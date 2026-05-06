```basic
10 REM eye of the tiger By Bobby Brightling
20 POKE52,48:POKE56,48:CLR: REM reserve memory.
30 POKE56334,0:POKE1,51:    REM swap in char. rom.
40 FORp=0TO1              : REM copy rom to ram.
50 POKE88,0:POKE89,48+p:POKE90,0:POKE91,208+p:POKE781,1:POKE782,0:SYS41964
60 NEXT
70 POKE1,55: POKE56334,1:   REM swap out rom.
80 POKE53272,(PEEK(53272)AND240)+12: REM switch to ram char. set.
90 POKE 53265,91:           REM enable ecm, then setup grayscale colors.
100 g$(0)=CHR$(151):g$(1)=CHR$(152):g$(2)=CHR$(155):g$(3)=CHR$(5)
110 POKE 53280,0:POKE53281,0:POKE53282,11:POKE53283,12:POKE53284,15: REM colors.
120 PRINT CHR$(5)CHR$(147);
130 REM create 8 custom halftone characters chr$(33) to chr$(40)
140 a$="{REVERSE ON}h{REVERSE OFF}@"+CHR$(34)+CHR$(20)+CHR$(34)+"@{REVERSE ON}h{REVERSE OFF}@"
150 a$=a$+""+CHR$(34)+CHR$(20)+CHR$(34)+"@{REVERSE ON}"
160 a$=a$+"*{REVERSE OFF}@{REVERSE ON}*{REVERSE OFF}@{REVERSE ON}*{REVERSE OFF}@{REVERSE ON}*{REVERSE OFF}@{REVERSE ON}*{REVERSE OFF}D{REVERSE ON}*{REVERSE OFF}q{REVERSE ON}*{REVERSE OFF}D{REVERSE ON}"
170 a$=a$+"*{REVERSE OFF}q{REVERSE ON}*{REVERSE OFF}U{REVERSE ON}*{REVERSE OFF}U{REVERSE ON}*{REVERSE OFF}U{REVERSE ON}*{REVERSE OFF}U{REVERSE ON}{CM S}{REVERSE OFF}U{REVERSE ON};{REVERSE OFF}U{REVERSE ON}{CM S}{REVERSE OFF}U{REVERSE ON};{REVERSE OFF}U"
180 a$=a$+"{REVERSE ON}{CM B}{REVERSE OFF}U{REVERSE ON}{CM B}{REVERSE OFF}U{REVERSE ON}{CM B}{REVERSE OFF}U{REVERSE ON}{CM B}{REVERSE OFF}U{REVERSE ON}{CM B}{SH -}{CM B}{REVERSE OFF}{CM Y}{REVERSE ON}{CM B}{SH -}{CM B}{REVERSE OFF}{CM Y}{REVERSE ON}{CM B}{CM B}{CM B}{CM B}{CM B}{CM B}{CM B}{CM B}{REVERSE OFF}"
190 POKE648,49:PRINT"{HOME}"TAB(24)a$;:POKE648,4
200 rr=214:cc=211:pl=58640:fe=48:   REM variables useful for plot.
210 v$(0)=CHR$(146):v$(1)=CHR$(18): REM revers on and reverse off.
220 REM create a pseudo-grayscale array.  print gs$(z) where z is 48 to 79.  0
230 REM to 47 are not used (240 bytes wasted), but rendering is 15% faster.
240 DIM gs$(32+fe)
250 FORz=0TO31
260 z0=INT(z/8)AND3:gs$(z+fe)=g$(z0)+v$(z0/2)+CHR$(35+(zAND7)+(z0AND1)*128)
270 NEXT
280 REM plot tiger eye data using grayscale.
290 PRINT CHR$(147);
300 FOR r=1 TO 24
310 READ b$
320 FOR c=1 TO LEN(b$)
330 PRINT gs$(ASC(MID$(b$,c)));
340 NEXT
350 NEXT
360 PRINT CHR$(5)TAB(12)"eye of the tiger";
370 GET k$:IF k$="" THEN 370
380 END
390 REM eye of the tiger.
400 DATA "77998799964468;=?@>?a@<8899;;:9:99=>=b>;"
410 DATA "778987:::8767;<=@@<<;=??><9;@??>=<:<<;??"
420 DATA "6789:9;:;:88;=<=:8=?>=<=>=<<@@<@c@>?@@=;"
430 DATA "7788;<:;<<:;=>;:;>=9756899779=?@a@>=aca@"
440 DATA "688:;<<=:<<:<;::98766543466877:=?@?b??a>"
450 DATA "799<<<?>==:897655521345535667:<8<?=<a@=<"
460 DATA ":==>==>><:620000124311134444225669=?>;<<"
470 DATA "<@>?@?=;8400012ac<:904457677641012268988"
480 DATA "?b?@@?;7100028<hmic907<88899:86000135688"
490 DATA "@b@a?<81000378:?eg?305a=<9;=<;8101366788"
500 DATA "cabb=8200026:;@fj=:309ac>;=??=:30279<99:"
510 DATA "dba@=3000167>>cde=>50;?da>@@@?=505:>=:;;"
520 DATA "cb@;60000257<a@bb@=73<=?>>?ba@<207>abb=9"
530 DATA "ba<720000258=abbc@=:8=<>=>?dc@902:>bb=<:"
540 DATA "a=8300000279;@abb?>=<<>>@@chc<405=ccba=="
550 DATA ">93000000168;?@aba?<<<=?@bde=912:bcffa??"
560 DATA ":40000000048:>@@@@a>>=?@acb@9226?dffedd?"
570 DATA "620000000028;;=aabab??ddcda;226=efggbba?"
580 DATA "41000000020479:<@bba?bda@;6115<acggca?a<"
590 DATA "100000120003667::<>=@@<:51124<@bedcba??:"
600 DATA "000013664430064577::84311138@@dfgec>=;9;"
610 DATA "0111379:985322100000012479;?deedc@=:8:77"
620 DATA "134468<<<?<977764444679=?ddcfec@>9;=<9;;"
630 DATA "146678=@@abb>>?a?>=<>aceedggdb@@<<987778"
```
