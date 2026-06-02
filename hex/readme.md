## [hex64](https://stigc.dk/c64/basic/?s=2jVbdkqI6EL7PU_RQcyGKWwQIKA7zIlvnAiECM5hQITqzb386CSK6c7FaCqG_dLq__oOGoPgZ1us1tPw7TeBYjrwGKcyyhFGX1aeRkiiEQXVCQ9Wq1xVNMv8w3U03zD_kg_zkwOJoR4PwvgiDkMQh1N0ZqlXmB8L8lfUqC1I_-H7FFYkZnMfXwvPy8augJAlhLMK8wV9_LWgudMHC3Bg6FmMlFQ-gKZryzEFeuQoAQT2_8j4ARAr-rcEuQbeKj63sa8Kcn9st1PzUCW7cg3OpVfcNqxQE75r2KNUIA1dGFkBYCCm4T9IQTlJBV1DQErLcLD7cIkWTyhrQlS748HN78Ie7dCRDj0tdQhQkQRyE5ms9MAfT-4FkN-EY4ugTLlrg9hOOIi59wsULHA1nYBSwAEkO4hmYLDxdVVxornxC6cLU7Ek1W6qOJmD8AzBdAuMJmCKQPQGzJTCZ41LJHpk9l8PQiQYlbMoY-bpK_NxcqF-4lGOpb7UNFzX0nFAMkZFHkzwOnbhRnAtCMyeN592TGM_5JHQXTkfcpDsn_cP7Xn4RunfycJIzJ_1qO82RQWsz5hjXPlbI7EvDBVclInTXc5s-Q1_-4YpESLWuCqyjlRI1erRO_A3NtVg-ivERiaKbti2S0gmw6d5LOZAI2W3keDkCCx2ttSq_YKysvxFS2p2wPjBFWy6mqvXmankBzP-yB1tHuXcYcy5qErFbfXt_5EVZw3PwDsZ3XfkHLQ6OhoN3c7uStdmvq4Pne6iAQVuEJMJgdGK4oCL0ueJQahv1Fd1mvndoSZRZ-9o3Cqikfc-cmegUwVZhRGLV-u_hg_XjYFTJqroMHa9fPFuF2lUhJnxoiy5vJC6tov0cCmeEcQd7EMYSdRe6yoW9CtNusDnRO1zJio8jpiCcuWr4SGIMxLlwPNtHoBU2RWwTp75sSBw_9IeUxMi_OBbYFNqg83Pjz7GYvElCPIxZJ6uVOPpv78Yew4MwywdY6mzCHlW1eMJF1C8wSNlbX0bkGE9DNOgSbbIckxiptY6Zv41VSWKT4E55Ph1C4r1xiVqXjBOoB6NUTu61WIKYvzV2YVTnmllCrdHnW1JZppEZq0LxbdVynBP33oJY3Zo6hrHtTtooi-6VbsGGNJuDUIoaqp6XiiTxPQEKOrGBLX9jnuR2QljgC2y8zbmrX1ejxqI0Uj-I_I2HDCExo-fiG-Y23CHqZUbv-F5gMlmlZmJcN3ayCL2OrG78oQacdtP0WB7RX6cD1muPJMkPvpwufQ9HWaoaVnOxOblPEgz66YKUP4wS62o3hx0BaGp6I92IzZ6JcTMWs787jMXa9E52U-FP6v6tzyT70EUTGw5OyfuYXLQURv8e_vlUme6t4d5NsD8guT3e9ldz38jSLIRGLTYIyPLbu-ctyxsfueB6hN3eM5x-wmJnEfKGlTAblDwN5TuTJplMUTv9-HaBT73fv_7zXHdgKXqZUHii_oZbhrxzEX_YiWF0UNMMK7xBwO_HVOz8276N65iEzSElLJvbLLiPd_g2k-3gzYsId-wmGGH7hw0WEC_RyXLBzOvKbWtKfzwrXW7AV6_0kXHwtv_48Uhqg6MvSvwP)
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
310 rem -- process merges
320 m=0:rem merge tracker flag
330 for i=1 to 6
340 nb=ad(h,i):if nb=0 then 400
350 if c(nb)<>c(h) or n(nb)=0 then 400
360 rem matched - move tiles to the target hex
370 n(h)=n(h)+n(nb)
380 c(nb)=0:n(nb)=0
390 m=1:rem flag that a merge
400 next i
410 if m=1 then goto 320:rem re-check neighbors
420 rem -- check for score and clear
430 if n(h)>=10 then s=s+n(h):ms$="clear! +"+mid$(str$(n(h)),2)+" points":n(h)=0:c(h)=0
435 if s>=nt then lv=lv+1:nt=nt*2:ms$=ms$+"  ** level "+mid$(str$(lv),2)+" **"
440 rem -- check for full board - game over
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
630 return
```
