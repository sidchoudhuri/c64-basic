# [1 line light cycle](https://stigc.dk/c64/basic/?s=2M0jzL7A1SjUuyQcSVumu2VaJtona2Yl-xlYF_gU6Ba4aBZrahkYWVgW2BdpAnpGhobl2oqaupYFVmn-JrUFJvrGBVZ4rCCkZVlTnF-Wl11YBAA)
```basic
0fOp=2e3to2e3:gEk:a=a+kaN3:pOp,pE(p)+128:p=p+pE(2117+a)-90:fOt=0to30:nE:nE:"1x{orng}z
```
- 1 to turn left and 3 to turn right. Any other key ends the game.
- The game ends if you hit your own light cycle trail or the top or bottom of the screen.
### How It Works
- The game draws to the screen and checks each cell before moving and reversing the color by adding 128 to it. These are effectively "solid blocks". Colliding makes the character value go past 255, which is an illegal value, so it ends the game.
- The four directions are stored as characters at the end of the line. The game reads their values from memory minus an offset resulting in screen steps for up, left, down, and right.
- Keys 1 and 3 change the direction one quarter-turn left or right achieved by adding the key press to the direction, keeping only the lowest 2 bits.
---

# [oneliner64.com](oneliner64.com)
## [A complete arcade action game for the C64 in one single line of code...](https://stigc.dk/c64/basic/?s=2M7QvcSzy0zDQ1DK21FTSUrJKd822KrAt0NbItjXU1AWSlppWBf6GRhYm2gU6RkZW-XkFNiZGBol-GgWuGobGRkBhTVsTI01to3R_HUMA) by Joep Geevers
use 1 and 9 to move your ship left and right
s=2PYxLCoAwDAX3nsRPkSQaNYEepn5wIVgRF_b2Si3uZobHg8NvCzc0oAG97bnPORSliGiIgp84i0CtjpaZpNPJItZcfQNNFz0ZaqKM1W2mSO4l4RTDH4NBYF395bPsAQ)
```basic
1?tArN(0)*39)"*":gEk:p=p+(k=1)-(k=9):pO1284+p,22:onp<420aN(pE(1324+p)=42)+2gO,1
```
# [rnd(0) vs rnd(1)](https://stigc.dk/c64/basic/?s=2M6iwLcpL0dDT1LK0tLSqBHMMIZxEW0MDIxOrgvzs1ETtCh1DczMouxLINrdKzy_J5-ICAA)
```basic
0x=rnd(.)*999:y=rnd(1)*999:a=1024:pokea+x,176:pokea+y,177:goto
```
# [Circuits](https://stigc.dk/c64/basic/?s=2MyjIz041NTYyN9IxMrayT84oUtEwNLPUzswr0SjKS9HQ09Qy0tQyNdEEyxgZGaHJWGhaW6Xnl-QDAA)
```basic
0poke53272,23:?chr$(169+int(rnd(.)*2)*54)chr$(222+int(rnd(.)*2)*8);:goto
```
# [Drops](https://stigc.dk/c64/basic/?s=2PYxLCoAwDAX3nsRPkSQaNYEepn5wIVgRF_b2Si3uZobHg8NvCzc0oAG97bnPORSliGiIgp84i0CtjpaZpNPJItZcfQNNFz0ZaqKM1W2mSO4l4RTDH4NBYF395bPsAQ)
```basic
0poke53281,0:x=rnd(0)*999:y=rnd(1)*999:a=1024:b=55296:c=11.5+rnd(1):poke53272,23:pokeb+x,c:pokea+x,95:pokeb+y,c:pokea+y,105:goto
```
# [Drip](https://stigc.dk/c64/basic/?s=2M0jzr7A1KMk3tSqyLdaqSPQzNDAytirwNzU1sjTTLtIxNAFygGImQHaBqwaEpZlfZGhkYZXnalVsW6xtaJXuDwA)
```basic
0forx=0to5:r=s*xand1023:poke55296+r,14:poke1024+r,peek(1024+r)or128:next:s=s+1:goto
```
## Drip in 6502 machine language

```asm
; c64 6502
; build to $c000 and run with: sys 49152

* = $c000

s       = $c080
tlo     = $c081
thi     = $c082
scrlo   = $fb
scrhi   = $fc
collo   = $fd
colhi   = $fe

start:
        lda #$00
        sta tlo
        sta thi
        ldx #$08                ; for x=0 to 7

loop:
        ; scrptr = $0400 + t
        clc
        lda tlo
        adc #<$0400
        sta scrlo
        lda thi
        adc #>$0400
        sta scrhi

        ; colptr = $d800 + t
        clc
        lda tlo
        adc #<$d800
        sta collo
        lda thi
        adc #>$d800
        sta colhi

        ldy #$00
        lda #$0e                ; color 14
        sta (collo),y

        lda (scrlo),y
        ora #$80                ; peek(...) or 128
        sta (scrlo),y

        ; t = (t + s) and 1023
        clc
        lda tlo
        adc s
        sta tlo
        lda thi
        adc #$00
        and #$03
        sta thi

        dex
        bne loop

        inc s                   ; s=s+1
        jmp start               ; goto

        ; state byte (defaults to 0)
        * = s
        .byte $00,$00,$00
```
# [Face & Dripping Paint Effect Demo](https://stigc.dk/c64/basic/?s=2nVfLbuMwDLz3K3xMNj6IpJ4B8jEBmu4GxTatkUM_v6Qkv91ENlChdiCSo9FwJIOqXq__z7sQwv74dmuuJ3W_8cuxuZxfz7vr_vh5e7-AQn241vH94_J9f0FV8eRvmWyOzenrz_f545Vn0Qup6vr2ebm872JQsz8R3v9dPiSNMRjsoal3Dc-m_QH0i1ZVV6Cph3G3BtCnakZVX6evAxz_3u63ChWXZ9jn-7kirB_-8UyYzARFNYDlATXKs1XdQA2184_zYVnleSAtBoLyNRrdQUGy_KzHsNDVwXMKnVJ4wz_RquJmFWrH9VHoEKptCkVNDI4imJ431wEURMPncX23lTX_O2vClBkztTA4R0g54g-BV8f0GeAVUgEAUKuQo4zEDsfCoHDBaKlDM0KwVXFAM-nrpLXMGu_tc_ZAzxfBXcBA-VnBUxClypuBccTRdh2D3fCsDW07EFvlB1P5uVZvWIqFk4QFBrXJ_-0zDFiqQGgZdKYvjrCBQeDu0mKTrgOxVYQ4FaGsfOq7_Z4zvYG3DnmASm0aVzERoYiFvYGXXIShSIPiKSk3JDAqtjOHPxJh8PM2BqpdEJsZQNiqQBwpMDZdxwGNjFgOL7EfCDquAeWAM5QaCbMGGRdqHhA4BmqvIo1PMFCRAv0QGvQKpAUF9g6EXb92fZV7jLdt2MO0VYHUKxCQO1hYE41nv4UFKXo3kaWkWfBBkGQ02urfQDyRYDzQZEPR18HkvfQDEu2yC0eyZHg7OUoSiWMQW0VIWYRydxL5xBNUJyURDLf7sRNSVmFs33h8t60GBSh0qRE6jPY12FoOLvBBWUv0PsmRyB81sd4qQT0yQVAuqoZvRelIlqsWuV9dMTa1kjRZglG32sfWlaAyDCuugGwXmb3sv7q9BNLc7kQMOGqW2LY4A7BVfXrhDhiVqBJSqRrcSIVxJ1s_l1usbs9gyD3jXZxUBMCsvAOabLzCnBnoLgJWIbmu7fc7Gh5ksE7WMi6_VXZm-ZPD6cWOFVX17y7DX3I9cIX1zVrgkGyLQ1de_MRNZuW3Cs74B4ECcUpfd5yJp-nAGVqj4zYHPmtXFLdqI2rbfumG9PFGIW-rXJOeHlD2sch-AA)
```basic
10 dima(999):fori=0to999:reada(i):poke1024+i,a(i):next
20 forx=0to5:r=q*xand1023
30 ifpeek(1024+r)=32thenpoke55296+r,(rand3)+14
40 poke1024+r,peek(1024+r)or128:next
50 q=q+1:goto 20
200 data 32,32,32,32,32,32,32,32,32,32,32
201 data 32,32,32,103,116,111,203,160,160,160,241,78,32,32,32,32,32,32,32,32,32
202 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
203 data 32,32,32,32,32,108,254,203,160,236,204,160,160,160,227,98
204 data 85,223,32,32,32,32,32,32,32,32,32,32,32,32,32,32
205 data 32,32,32,32,32,32,32,32,32,32,32,32,32,74,120,240
206 data 243,233,227,203,160,167,160,227,223,160,227,223,32,32,32,32
207 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
208 data 32,32,32,32,32,108,236,254,160,160,160,160,160,160,160,160
209 data 160,192,75,251,123,32,32,32,32,32,32,32,32,32,32,32
210 data 32,32,32,32,32,32,32,32,32,32,32,32,32,232,203,160
211 data 160,160,160,160,160,160,160,160,160,160,227,223,252,32,32,32
212 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
213 data 32,32,32,104,254,254,160,206,160,160,160,160,160,160,160,160
214 data 160,160,160,202,220,101,32,32,32,32,32,32,32,32,32,32
215 data 32,32,32,32,32,32,32,32,32,32,32,206,160,160,160,173
216 data 160,160,160,160,160,160,160,160,160,160,160,160,186,246,32,32
217 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
218 data 32,32,32,74,160,162,160,160,160,160,160,160,160,160,160,160
219 data 160,160,160,245,160,246,32,32,32,32,32,32,32,32,32,32
220 data 32,32,32,32,32,32,32,32,32,32,32,106,160,175,160,160
221 data 160,160,160,160,160,160,160,160,160,160,160,118,243,117,32,32
222 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
223 data 32,32,32,245,203,160,160,160,160,160,174,196,226,210,251,160
224 data 160,160,206,208,102,32,32,32,32,32,32,32,32,32,32,32
225 data 32,32,32,32,32,32,32,32,32,32,108,160,201,160,102,232
226 data 160,160,160,160,160,198,160,160,160,160,213,79,75,32,32,32
227 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
228 data 32,32,220,160,160,203,203,160,167,241,232,194,201,211,253,173
229 data 79,249,219,161,80,208,32,32,32,32,32,32,32,32,32,32
230 data 32,32,32,32,32,32,32,32,32,32,80,160,160,201,160,160
231 data 160,160,160,254,160,202,160,186,160,162,174,160,225,246,32,32
232 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
233 data 32,122,73,200,110,227,213,160,160,160,160,187,160,160,160,172
234 data 160,160,160,173,239,75,32,32,32,32,32,32,32,32,32,32
235 data 32,32,32,32,32,32,32,32,108,203,228,95,241,238,160,160
236 data 160,160,160,202,174,174,186,160,160,160,224,160,32,32,32,32
237 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
238 data 103,249,75,254,249,231,201,160,160,160,160,160,160,160,160,160
239 data 206,236,251,160,101,32,32,32,32,32,32,32,32,32,32,32
240 data 32,32,32,32,32,32,32,32,32,32,32,72,243,213,160,160
241 data 160,160,160,160,160,160,160,231,118,232,78,160,75,32,32,32
242 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
243 data 32,32,107,239,207,104,220,237,203,160,160,160,160,160,232,102
244 data 227,248,208,203,32,32,32,32,32,32,32,32,32,32,32,32
245 data 32,32,32,32,32,32,32,32,32,32,32,32,229,213,161,160
246 data 238,160,160,160,160,75,220,160,160,172,246,232,32,32,32,32
247 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
248 data 32,32,32,32,103,202,229,160,97,201,160,160,231,108,160,240
249 data 112,174,187,231,32,32,32,32,32,32,32,32,32,32,32,32
250 data 32,32,32,32,32,32,32,32,32,32,32,32,32,251,253,160
251 data 160,202,209,80,206,203,160,174,161,160,247,97,32,32,32,32
252 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
253 data 32,32,32,32,32,74,201,160,160,160,160,227,160,160,167,160
254 data 160,160,160,117,32,32,32,32,32,32,32,32,32,32,32,32
255 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,124,160
256 data 160,160,160,160,160,160,160,160,160,160,236,32,32,32,32,32
257 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
258 data 32,32,32,32,32,32,32,124,201,160,160,160,254,160,236,249
259 data 239,119,32,32,32,32,32,32,32,32,32,32,32,32,32,32
260 data 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
261 data 39,120,239,160,228,105,32,32,32,32,32,32,32,32,32,32
262 data 32,32,32,32,32,32,32,32
```
