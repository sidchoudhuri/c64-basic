## [hex64](https://stigc.dk/c64/basic/?s=2jVbdkqI6EL7PU_Sm5kIUtwgQUBzmRbbOBUIEZjBQITozb386CSK6c7FaCqG_dLq__oMFoMQZ1us1NOIrieFYjKKCXpplAaMuyg8jJWEAg2qlhrJRLysWp95huptuuHfIhv5DAI_CHfOD-yLwAxIFULVnKFep50vzV1Sr1E88_-sFVyTicB5fckqz8TNnJA5gzIOsxl93zVkmdc6DzBg65mPZK-FDndfFWUB_FcoHBHXiKjofECnFlwa7BN0oMTZ9VxHu_NxuoRKnVgrjHpwLrdovWCUgRVs3x16NMAhlZD4Eueyl8EgSwKlX0OYMdA9pZhbvbpGgSUUF6Errv3uZPfjdXVqSoseFLiD0Yz_yA_O1HpiD2f1AsptwHHHsCRcucPsJxxCXPOGiBY4FMzD0uY8k-9EMjBeerkohtVAeYWxhavqkmi9VhxMw-gGYLIHRBEwQyJ-A6RIYz3Ep-w6ZPRfD0MoaJXzKmP5lFXuZuTAvdynHE89qGy5q6ARhGCIjDyd5FDhxrYSQhKVOGs27JzGe80HYLpiOuEl3Tvotuq7_JGzv5MEk50762bRaIIPWZswxoT2skNmXWkihCkTothM2fYau-BaKhEi1LnOso5WSFXq0jr0Ny7RcPorwEQnDm7YtktJKsOne9f1AQmS37sfLEXjgaK1U8Qljaf0NkdL2hPWBKdoIOVUtnavlF2D-Fx3YOsroYcyErEjIb_VNv_uLsoZnQA_Gd116By0PjoYDvbld9pXZr8sD9Sgq4NDkAQkxGK0cLqgIfS4FFNpGfcW2qUcPDQlTa1_zygCVNG-pMxOdItgqjEiuGu8teLB-HIyqviwvQyuqX9RWoXZViAkf2KLL6h6XVtF-DoUzwriDPQhjibpzXWbSXqVpN9ic2B2u-lKMI5yFqsVIIozCOXck20egFXZE7BGnrqhJFD00h4RESL485tgRGr_1MuPMMZ9ciQM8iVsPy5U8eq9vxhhDgjTLB1jiDMIGVTbYjjEFMHTWi9EchEDQBZpjuSURUmodMn8bq41EJrGd3mzST6K98YZZb4z9qAejUzjPsOmiFte7YmbNPN9yyBKLXNidSmzRKBwL9zKOw3sZW5EhxSYYFLKCshOFInF0j27OJm-xn2_Mk8y2fwv8BRu6ObfVy2rUWHFG6vmht6Ew9JgMI3XBCzIbywD1cqN3fMsxU6xSMw6uGzs2pF6HVjf-UAOOsmk0LI_ortMB6zUlcfyDL6dL18GxL5SJxVxKJMZwni7I6MOEsE62c0ARgEYmN3KN2OyZmDXTLv27cViszdp4N9XzpO7f2ke8D1zUsI_g8LtPv0Wn4OzvmZ5NBedeBu5NAsseae3wtrua-7ovzEJq1GLpR35f3yhdVi0-cmGlhN9eH5x-wiNnEfKGOT4bFD_N2juTJo1MrTr9-NKAT-mf3_9RV_Q8QS9jBk_U33DLYLcu1g87MYwOanpciTcI-POYhK1327dxjZDwOaSEp3P3BPehhy8zsA50XoS4YzfBCN8_bLCAaImOlwtu3kJuWxP241nJcgO-USWPjAPd_uOHksQGR1-U_B8)
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
