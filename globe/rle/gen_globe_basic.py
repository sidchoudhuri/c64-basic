#!/usr/bin/env python3
"""
gen_globe_basic.py -- emit globe_basic.bas, a pure C64 BASIC V2 rotating globe.

The program computes the projection tables once (~1 min), builds NF=8
rotation frames as strings with embedded PETSCII color codes (~2-3 min),
then PRINT-animates them forever at ~1 fps. Texture chars are shown
literally (lowercase charset): . H g @ -- water blue, land brown.

Texture is downsampled to 128 columns so longitude wrap is a single
AND 127 (no MOD in BASIC V2).

--rle stores the texture DATA run-length encoded (count+char pairs,
whole-stream, runs capped at 128 so the decoder's work string stays
within BASIC's 255-char limit). Shrinks the DATA section ~3.6x at the
cost of ~15-20s extra decode time at init. Runtime is unchanged.

Tokenize with:  petcat -w2 -o globe_basic.prg -- globe_basic.bas
"""

VERSION = "2.1.0"
BUILD = "2026-06-10-2"

import argparse
import pathlib

TW = 128          # texture width  -> wrap = AND 127
NF = 8            # rotation frames; angle step = TW/NF = 16
RUN_CAP = 128     # max RLE run: decoder work string stays <= 255 chars
DATA_PAYLOAD = 64 # max encoded chars per DATA line (whole runs only)

REMAP = {".": ".", "H": "H", "g": "g", "@": "@"}

HEAD = """100 rem rotating ascii globe - pure c64 basic
110 rem texture: github.com/adamsky/globe - original basic by terror
120 print chr$(147);chr$(14);chr$(5):poke 53280,0:poke 53281,0
130 tw=128:ht=35:nf=8:p=3.14159265
140 dim m$(ht),r%(959),b%(959),f$(nf*24-1)
"""

READ_PLAIN = """150 print "reading texture..."
160 for r=1 to ht:read a$,b$:m$(r)=a$+b$:next
"""

READ_RLE = """150 print "decoding texture (rle)..."
152 d$=".":g$="g":h$="H":b$="@"
154 for i=1 to 7:d$=d$+d$:g$=g$+g$:h$=h$+h$:b$=b$+b$:next
156 r=1:w$=""
158 if r>ht then 200
160 read q$:j=1:l=len(q$)
162 if j>l then 158
164 n=0
166 c=asc(mid$(q$,j,1)):if c>57 then 172
168 if c>=48 then n=n*10+c-48:j=j+1:goto 166
172 if n=0 then n=1
174 x$=d$:c$=mid$(q$,j,1):if c$="g" then x$=g$
176 if c$="H" then x$=h$
178 if c$="@" then x$=b$
180 w$=w$+left$(x$,n):j=j+1
182 if len(w$)>=128 then m$(r)=left$(w$,128):r=r+1:w$=mid$(w$,129)
184 goto 162
"""

BODY = """200 print "computing projection..."
210 for y=0 to 23:for x=0 to 39:i=y*40+x:r%(i)=-1
220 nx=(x-19.5)/12:ny=(y-12)/11:d=nx*nx+ny*ny
230 if d>1 then 310
240 nz=sqr(1-d)
250 if abs(ny)<.999 then ph=p/2-atn(-ny/sqr(1-ny*ny)):goto 270
260 ph=0:if ny>0 then ph=p
270 if abs(nx)<.001 then t=p/2:goto 290
280 t=atn(nz/nx):if nx<0 then t=t+p
290 ty=int(ph/p*ht)+1:if ty>ht then ty=ht
295 if ty<1 then ty=1
300 r%(i)=ty:b%(i)=int(t/(2*p)*tw) and 127
310 next:next
400 for f=0 to nf-1:ao=f*16:print "building frame";f+1;"of";nf
410 for y=0 to 23:s$="":cc=0
420 for x=0 to 39:i=y*40+x
430 if r%(i)<0 then s$=s$+" ":goto 560
470 tx=(b%(i)+ao) and 127
480 t$=mid$(m$(r%(i)),tx+1,1)
490 c$=t$:k=31:if t$<>"." then k=149
540 if k<>cc then s$=s$+chr$(k):cc=k
550 s$=s$+c$
560 next
570 f$(f*24+y)=s$
580 next:next
600 print chr$(147);
610 fc=0
620 print chr$(19);
630 for r=0 to 23:print f$(fc*24+r);:next
640 fc=fc+1:if fc=nf then fc=0
650 goto 620
"""


def load_texture(path):
    rows = [r for r in pathlib.Path(path).read_text().splitlines() if r]
    w = max(len(r) for r in rows)
    return [r.ljust(w, ".") for r in rows]


def downsample(rows):
    w = len(rows[0])
    return ["".join(REMAP.get(row[int(i * w / TW)], ".") for i in range(TW))
            for row in rows]


# ------------------------------------------------------------------ rle

def rle_encode(stream):
    """Whole-stream RLE, runs capped at RUN_CAP. Returns list of (n, char)."""
    runs = []
    i = 0
    while i < len(stream):
        c = stream[i]
        n = 1
        while i + n < len(stream) and stream[i + n] == c and n < RUN_CAP:
            n += 1
        runs.append((n, c))
        i += n
    return runs


def pack_runs(runs):
    """Encode runs as count+char (count omitted when 1), pack whole runs
    into DATA payloads of <= DATA_PAYLOAD chars."""
    chunks, cur = [], ""
    for n, c in runs:
        tok = (str(n) if n > 1 else "") + c
        if len(cur) + len(tok) > DATA_PAYLOAD:
            chunks.append(cur)
            cur = ""
        cur += tok
    if cur:
        chunks.append(cur)
    return chunks


def simulate_rle_decoder(chunks, expect_rows):
    """Line-for-line port of BASIC lines 150-184; must reproduce m$()."""
    m = {}
    r, w = 1, ""
    for q in chunks:
        j = 0
        while j < len(q):
            n = 0
            while j < len(q) and q[j].isdigit():
                n = n * 10 + int(q[j])
                j += 1
            if n == 0:
                n = 1
            w += q[j] * n
            j += 1
            assert len(w) <= 255, "decoder work string exceeds BASIC limit"
            if len(w) >= 128:
                m[r] = w[:128]
                r += 1
                w = w[128:]
    assert r == len(expect_rows) + 1 and not w, "decoder row count mismatch"
    for i, row in enumerate(expect_rows, 1):
        assert m[i] == row, f"decoded row {i} mismatch"


# ----------------------------------------------------------------- main

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--rle", action="store_true",
                    help="store texture DATA run-length encoded")
    ap.add_argument("--texture", default="globe_texture.txt")
    ap.add_argument("--out", default=None)
    args = ap.parse_args()

    here = pathlib.Path(__file__).parent
    rows = downsample(load_texture(here / args.texture))

    if args.rle:
        runs = rle_encode("".join(rows))
        chunks = pack_runs(runs)
        simulate_rle_decoder(chunks, rows)
        print(f"rle: {sum(len(r) for r in rows)} chars -> {len(runs)} runs, "
              f"{sum(len(c) for c in chunks)} encoded chars, decoder verified")
        data = chunks
        program = HEAD + READ_RLE + BODY
        out = pathlib.Path(args.out or here / "globe_basic_rle.bas")
    else:
        data = [half for row in rows for half in (row[:64], row[64:])]
        program = HEAD + READ_PLAIN + BODY
        out = pathlib.Path(args.out or here / "globe_basic.bas")

    lines = program.rstrip("\n").split("\n")
    n = 1000
    for chunk in data:
        lines.append(f'{n} data "{chunk}"')
        n += 10

    out.write_text("\n".join(lines) + "\n")
    longest = max(map(len, lines))
    print(f"wrote {out}: {len(lines)} lines, longest {longest} chars")
    assert longest <= 80, "line exceeds C64 editor limit"


if __name__ == "__main__":
    main()
