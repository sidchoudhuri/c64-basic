## square grid
```basic
10 rem *** grid hexa stack ***
20 print chr$(147);chr$(14); : rem clear screen & lower case mode
30 dim c(16),n(16),ad(16,6)
40 s=0:g=0
50 rem -- read 6-neighbor adjacency matrix for 16 grid spaces (0=none)
60 for i=1 to 16:for j=1 to 6:read ad(i,j):next j:next i
70 data 2,5,0,0,0,0 : rem 1
80 data 3,6,5,1,0,0 : rem 2
90 data 4,7,6,2,0,0 : rem 3
100 data 8,7,3,0,0,0 : rem 4
110 data 1,2,6,10,9,0 : rem 5
120 data 2,3,7,11,10,5 : rem 6
130 data 3,4,8,12,11,6 : rem 7
140 data 4,8,12,7,0,0 : rem 8
150 data 5,6,10,14,13,0 : rem 9
160 data 6,7,11,15,14,9 : rem 10
170 data 7,8,12,16,15,10 : rem 11
180 data 8,12,16,11,0,0 : rem 12
190 data 9,10,14,0,0,0 : rem 13
200 data 10,11,15,14,13,0 : rem 14
210 data 11,12,16,15,14,0 : rem 15
220 data 12,16,15,0,0,0 : rem 16
230 rem -- setup color control string mappings
240 dim co$(4):co$(1)=chr$(156):co$(2)=chr$(30):co$(3)=chr$(31):co$(4)=chr$(158):co$(0)=chr$(146)
250 rem -- generate first tile
260 tc=int(rnd(1)*4)+1:tn=1
270 rem *** main game loop ***
280 gosub 520:rem draw screen
290 if g=1 then print "game over! final score:";s:end
300 print "your tile: ";co$(tc);tn;co$(0);" (color code:";tc;")"
310 input "place at grid space (1-16)";h
320 if h<1 or h>16 then 280
330 if n(h)>0 then print "space occupied!":for t=1 to 1000:next:goto 280
340 rem -- place tile --
350 c(h)=tc:n(h)=tn
360 rem -- processing 6-way merges --
370 m=0
380 for i=1 to 6
390 nb=ad(h,i):if nb=0 then 450
400 if c(nb)<uoc(h) or n(nb)=0 then 450
410 if c(nb)<>c(h) then 450
420 n(h)=n(h)+n(nb)
430 c(nb)=0:n(nb)=0
440 m=1
450 next i
460 if m=1 then goto 370:rem re-check neighbors if a chain reaction occurs
470 rem -- check score --
480 if n(h)>=5 then s=s+n(h):print "clear! +";n(h);" points":n(h)=0:c(h)=0:for t=1 to 1000:next
490 rem -- game over check --
500 fu=1:for i=1 to 16:if n(i)=0 then fu=0
510 next i:if fu=1 then g=1
520 tc=int(rnd(1)*4)+1:tn=1:goto 270
530 rem *** sub: draw 4x4 screen ***
540 print chr$(147);:print "--- 6-neighbor grid stack --- score:";s
550 print:print
560 for i=1 to 16:if n(i)=0 then x$(i)="["+mid$(str$(i),2)+"]":goto 580
570 x$(i)=co$(c(i))+"["+mid$(str$(n(i)),2)+"]"+co$(0)
580 next i
590 rem print rows with spacing
600 print "  ";x$(1);"   ";x$(2);"   ";x$(3);"   ";x$(4)
610 print
620 print "  ";x$(5);"   ";x$(6);"   ";x$(7);"   ";x$(8)
630 print
640 print "  ";x$(9);"   ";x$(10);"   ";x$(11);"   ";x$(12)
650 print
660 print "  ";x$(13);"   ";x$(14);"   ";x$(15);"   ";x$(16)
670 print:print "----------------------------------------"
680 return
```
## [hex grid](https://stigc.dk/c64/basic/?s=2jVbdcqo6FL7PU6wyXkClZxIgoFj6Inv2BUIEWgxMiKft25-VBBHd3TPHTpW4vqyfb_3JKChxhufnZ2jFV5rAsZxEDYM0xxImXVYfRkoiCqPqpIaqVRufJVlwmJ_mBx4c8nH4EMDjaMdCejvQkJKYQt2dofKzIJTmraz9LEyD8GuDJxJzOE-bwvNIQmEqaN7gv3FsKqZqUCKEpmjKs4DhX6Hg1JcN4c7zlxeoxamTwjgM51Kr7gv8FKTomvY4qAlGvIGyEGghBykCklI4DQq6goEeIMvN4d0dUjRa1oDOdeF7kEvxpeHdfXQkwxhKXUIUJmEcUvNnfTSG2c0g2c04jjj2gItWuP2MY4hLH3DxCsfoAoxCHiJtYbwAk1WkfiWkFiogjK1czR5U87XqaAbGPwDTNTCegSkC-QMwWwOTJS_V0COz53IcO9mghM81MGz8JMjNBwsKV0Q8Day28aLGXhCGKTLyaJbH1IkbJYQkLHPSeLk9i9HOB2E7Opu4SndO-i36fvgkbO_kdJZzJ_1sOy2QQeuzEpPQAdb8EksjpFAlInTXC1s-Y19-C0UipFpXBXaGr2SNET0nwZblWhaMRNH1_gvS0EmwJdwPw0gi5LMZpssROHVE1qr8hKmyEUZIYnfCmseibIWcO89bOuAJsOLLHmxv5N5hyoWsScSvPep9DxdlXc3BO5hodRUctDy4wA_eNdBqqM19XR28wEMFHNqCkgjp7-R4QUUYZSWg1DbPPnvJAu_Qkiiz_rWvDFBJ-5Y5NzEogu1uRNJvgzd65_00GlVDVV3GTtRPnu077foOS5zaNsubAY9W0X4h3zlhwsE5gtlD3YWucmk_JYnZDamGSkwT1huchWrERGLMwXkeJvYr0Apn2nWKxPHdMEhJjNTLY4EToA27IDehHIs5kITiIOM2vsqXx-D1zbhiKJDmeAdLnU84kKoWLVxk_QTjMPQ2jAnpRWuIBl2iT5ZeEiOrNibztrUqSWyq2SnPZyMk3puQmA3JBIF6MEHlHF6L_YbFWuMkRXVuciXMOn2-1pMlGZmxKpR4qVqBY_42SBCrW9O0MLXdSRtl0a2tLdiQZssPSllD1YtSkSS-5b7gzhQO8K35Irfz3eKeYOttz1298SeNDWikQRgFWw8JQl4mz2WW5jbRlCTJD7ZPl76H41CqGvzbZrDygCSYpNMFKbqb89a1bkkTAlB3eiXJiM2dmSFs3yT7s_0t1lZispt7dFb3tyGQ7KnjG6cBLq3b1lr1O2d_btd8bhszPNxqNk9Lx-MdbnM6bV7fPG_dafhVPm9Tfl3bThvhsbOPvGBlLuaTh434wBTuaDx4v_757bn-5CmGghw7gRkqFT5gBn_dJ7abE_vb27rJQ_jCN-HZMq7AvbzDl9kJB285RHhjN8MI399dsIB4jU7WB24W_fVqyn60la4v4M-Q9J4uS_7_enkktczqi5L_AQ)
```basic
10 rem *** hex64 based on hexa stack ***
20 print chr$(147);chr$(14);chr$(5);:poke 53281,0:poke 53280,0
30 dim c(7),n(7),ad(7,6),x$(7)
35 ms$="":sw=1
40 s=0:g=0:lv=1:nt=50:rem s=score, g=game over, lv=level, nt=next level threshold
50 rem -- define hex matrix (6 neighbors per hex, 0=none)
60 for i=1 to 7:for j=1 to 6:read ad(i,j):next j:next i
70 data 2,4,3,0,0,0:rem hex 1 neighbors
80 data 5,4,1,0,0,0:rem hex 2 neighbors
90 data 1,4,6,0,0,0:rem hex 3 neighbors
100 data 1,2,5,7,6,3:rem hex 4 neighbors (center)
110 data 2,4,7,0,0,0:rem hex 5 neighbors
120 data 3,4,7,0,0,0:rem hex 6 neighbors
130 data 6,4,5,0,0,0:rem hex 7 neighbors
140 rem -- color mappings
150 dim co$(4):co$(1)=chr$(156):rem purple
160 co$(2)=chr$(30):rem green
170 co$(3)=chr$(150):rem pink
180 co$(4)=chr$(158):rem yellow
190 co$(0)=chr$(5):rem white (color reset)
200 rem -- generate tile for player
210 tc=int(rnd(1)*4)+1:tn=int(rnd(1)*3)+1
220 rem --- main game loop
230 gosub 500:rem draw screen
240 if g=1 then print "game over! final score:";s:end
250 print "your tile: ";co$(tc);tn;co$(0);" (color code:";tc;")"
255 h=0
260 input "place at hex (1-7)";h
270 if h<1 or h>7 then 230
280 if n(h)>0 then print "space occupied!":for t=1 to 1000:next:goto 230
290 rem -- place tile
300 c(h)=tc:n(h)=tn:sw=0
310 rem -- processing merges
320 m=0:rem merge tracker flag
330 for i=1 to 6
340 nb=ad(h,i):if nb=0 then 400
350 if c(nb)<>c(h) or n(nb)=0 then 400
360 rem match found! pool tiles into the target hex
370 n(h)=n(h)+n(nb)
380 c(nb)=0:n(nb)=0
390 m=1:rem flag that a merge happened
400 next i
410 if m=1 then goto 320:rem re-check neighbors if things shifted
420 rem -- check for score and clear
430 if n(h)>=10 then s=s+n(h):ms$="clear! +"+mid$(str$(n(h)),2)+" points":n(h)=0:c(h)=0
435 if s>=nt then lv=lv+1:nt=nt*2:ms$=ms$+"  ** level "+mid$(str$(lv),2)+" **"
440 rem -- check for full board (game over check)
450 fu=1:for i=1 to 7:if n(i)=0 then fu=0
460 next i:if fu=1 then g=1
470 rem -- generate next tile
480 if g=0 then tc=int(rnd(1)*4)+1:tn=int(rnd(1)*3)+1
490 goto 220
500 rem -- draw screen
510 print chr$(147);:print "hex64  score:";s;"  lvl:";lv;"  goal:";nt
515 if ms$<>"" then print ms$:ms$=""
520 print:print
530 rem format screen
540 for i=1 to 7:if n(i)=0 and sw=0 then x$(i)="[.]":goto 560
541 if n(i)=0 then x$(i)="["+mid$(str$(i),2)+"]":goto 560
550 x$(i)=co$(c(i))+"["+mid$(str$(n(i)),2)+"]"+co$(0)
560 next i
570 print "       ";x$(1);"    ";x$(2)
580 print
590 print "    ";x$(3);"    ";x$(4);"    ";x$(5)
600 print
610 print "       ";x$(6);"    ";x$(7)
620 print:print "----------------------------------------"
630 return```
