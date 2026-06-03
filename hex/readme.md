## [hex64](https://stigc.dk/c64/basic/?s=2jVbZcptKEH2fr5hQfhASzqWBYVPwj6TuA0ZYIkagAiz783NmRZZTldhlT9Nzel-AQj61Z77dbvmp_UgTfo34I28_LvVw6IYjfx7r6TDLexaF_DJ1w8Kb0_SwoSTz94YyhPD35WV8bbmIo5yCcH0Ig5DFIT90Z95sqPCDQf2vDziC1A8-HtTzaZQHiwU_zw-V57Ek5HMVlkf89deKymGpRMhEyF_GiXcV8WXkVJTy6Zd-SsuprQ8cmrvgl18O7cfCf-mjYylcqJeaR0ESiCCUvywzPApi8FLFyx0uDTKDKwxPBBTkQaF4FBpmAiAFEdgELjloBl4MXkDEKDLsVLIooEjriA27gFMUG2uUGG4upaW3uKKEkXBoqJD-EqQEIxuatKXdJsikjFx8JHmp1W9DhLiMhjLNtlFKa0KFI68oR_FXAWhRIYEfUMEiG6-0qOIinZ7IRixx0n1jPLIhS9WFjkBfJDcCYvU2EqZ3xodN4rMIwUqS_Eo3oEj9UjIiw4hD_Rw7gGEkjpFrRmgYAlqRqeM4vz3zPIJJJGhpKrT7ZhrQpv428XdULsMtKwaLRcjZ8voVef6CjMN12M51N_B-HC9qtGKyttMQk4K8dS_8KDv61A5m6rxjfW75eG2nb3xuxqktvf1ctsOBxcjnCSPSDZc34DDH3v7E4kRpOf0gjvE4PVGhtcEWJkzfjZuTf2flNPbtN0-N1KJHSoShHqClPI54VgpSpWCA_FP4SX6pX9vhHxQg2420vjTloM6hnN8rXOQ6Sed2OrYzi5HdM9hJ-Gno03J4rjDkp6DzWULamefKuJIkEIhsiMOzjBGyjSR_PEmz8nFQN7ciyKPyRf7bqeuy0aDSgMtzRQxYbjZKohN5tkmEuyxJdQSqSCzJ1kxVZKzN1byTnFLtuaZvaxR15-3O3eFhMy9oSHnrB5G_8_hlmT2do7BUKYMJk6S-vbY9f7uwpFBW5qcKNVAmsC_7606tzGHZRsoS_qAP3ddfe35rrb8aW9utV65DIEzDvrz1vX4TYPe3zSsTCOTlDQv58x5WcXYyp3h7yNR3Lr9AQ19kEyehUoG-RKczEauBW17ljC3n8t9GSiRycExPCbHO12Gq31GBqYV6OWGYqy9vL5ZS6NpevfzcXO09mSNQ_RXkcawlPSws1V2FRP548rzbxgerNG-tNBKaydL47lXF0sS2ZecmD28_PHgcP56ekAxbIBWmcTr0rMlimoOP9po7FNNVr5PFkxnt22GDK6dYwjwUGifEhOqQd1sRY_Xn9-__31pFu9obJbjzPl2j8ebrrXHp3yf71xv7V2P_CvuFVSz3biOldsrEVZnY6W2M17GbrWytDle52cvPBB_1UFTkqBhi9uOEZfGtlLpPHFI4KnVUBunESYtVWt3mDlc4isKVXP2hCIpSpyj74gbFK3Z1iVafKIWG3Gko_hR-tqJX1-RHU1bYpstdq3uP__bjsXzN9dL1cgRkPZYGJn56-7XayyBrvUfB9rpgcEGWywq8fhE43wnAlMCULm_TwLBj3MD2Iz7b9D6bT_WlVVOb389PaQan1HumbPRhlgqam1iOYvaXCjvtkfxHuTA0-Z_wtwIrI9dzBYjpUrcZf77043s72X4v0O95asHRPRjZOjootk-eWWh8D62n5uSg2Kt5bqHJPfQdWmeHjYGVL8DVQ2xid5vIr9JQ7hIhk4AzNWdhTnSqIcgSiSWUjCkE_JdqLCgyZ2xOK5OZM5fvoIJIyVgwWTRZL8jiKbdEcWs0-nNxXTm1R2Q8IauSrCZymuK_a4qsYGiJ_FZD8hcNGvcb) v2 - expanded boards
```basic
10 rem *** hex64 v2 - expanding boards ***
20 print chr$(147);chr$(14);chr$(5);:poke 53281,0:poke 53280,0
30 dim c(19),n(19),ad(19,6),x$(19),ho(19),mp(19),rm(19)
35 ms$=""
40 s=0:g=0:lv=1:nt=50
50 for i=1 to 19:for j=1 to 6:read ad(i,j):next j:next i
60 data 2,4,5,0,0,0
70 data 1,3,5,6,0,0
80 data 2,6,7,0,0,0
90 data 5,1,8,9,0,0
100 data 4,6,1,2,9,10
110 data 5,7,2,3,10,11
120 data 6,3,11,12,0,0
130 data 9,4,13,0,0,0
140 data 8,10,4,5,13,14
150 data 9,11,5,6,14,15
160 data 10,12,6,7,15,16
170 data 11,7,16,0,0,0
180 data 14,8,9,17,0,0
190 data 13,15,9,10,17,18
200 data 14,16,10,11,18,19
210 data 15,11,12,19,0,0
220 data 18,13,14,0,0,0
230 data 17,19,14,15,0,0
240 data 18,15,16,0,0,0
250 dim co$(4)
260 co$(1)=chr$(156):co$(2)=chr$(30):co$(3)=chr$(150):co$(4)=chr$(158):co$(0)=chr$(5)
270 gosub 820
280 tc=int(rnd(1)*4)+1:tn=int(rnd(1)*3)+1
290 tk=int(rnd(1)*4)+1:tm=int(rnd(1)*3)+1
300 rem *** main loop ***
310 gosub 600
320 if g=1 then print "game over! score:";s:end
330 h=0:input "hex";h
340 if h<1 or h>sl then 310
350 ih=mp(h)
360 if n(ih)>0 then print "taken!":for t=1 to 500:next t:goto 310
370 c(ih)=tc:n(ih)=tn
380 rem merges
390 m=0
400 for i=1 to 6:nb=ad(ih,i)
410 if nb=0 then 440
420 if ho(nb)=1 or c(nb)<>c(ih) or n(nb)=0 then 440
430 n(ih)=n(ih)+n(nb):c(nb)=0:n(nb)=0:m=1
440 next i
450 if m=1 then 390
460 rem score
470 if n(ih)>=10 then s=s+n(ih):ms$="clear! +"+mid$(str$(n(ih)),2)+" pts":n(ih)=0:c(ih)=0
480 rem level up
490 if s>=nt then lv=lv+1:nt=nt*2:ms$=ms$+" ** lvl "+mid$(str$(lv),2)+" **":gosub 820
500 rem full board check
510 fu=1:for i=1 to 19:if n(i)=0 and ho(i)=0 then fu=0
520 next i:if fu=1 then g=1
530 tc=tk:tn=tm:tk=int(rnd(1)*4)+1:tm=int(rnd(1)*3)+1
540 goto 310
600 rem *** draw screen ***
610 print chr$(147);
620 print "hex64 score:";s;" lvl:";lv;" goal:";nt
630 if ms$<>"" then print ms$:ms$=""
635 print
640 for i=1 to 19
650 if ho(i)=1 then x$(i)="    ":goto 710
660 if n(i)<>0 then 690
670 si$=mid$(str$(rm(i)),2):if len(si$)=1 then si$=" "+si$
680 x$(i)="["+si$+"]":goto 710
690 sv$=mid$(str$(n(i)),2):if len(sv$)=1 then sv$=" "+sv$
700 x$(i)=co$(c(i))+"["+sv$+"]"+co$(0)
710 next i
720 print "     ";x$(1);" ";x$(2);" ";x$(3)
730 print
740 print "   ";x$(4);" ";x$(5);" ";x$(6);" ";x$(7)
750 print
760 print " ";x$(8);" ";x$(9);" ";x$(10);" ";x$(11);" ";x$(12)
770 print
780 print "   ";x$(13);" ";x$(14);" ";x$(15);" ";x$(16)
790 print
800 print "     ";x$(17);" ";x$(18);" ";x$(19)
805 print
810 print "---------------------------------------"
820 print "tile:";co$(tc);"[";mid$(str$(tn),2);"]";co$(0);" next:";co$(tk);"[";mid$(str$(tm),2);"]";co$(0)
825 return
830 rem *** load level shape ***
840 for i=1 to 19:ho(i)=1:n(i)=0:c(i)=0:next i
850 lp=(lv-1)-int((lv-1)/5)*5+1
860 if lp=1 then ms$=ms$+"[flower]":goto 910
870 if lp=2 then ms$=ms$+"[ring]":goto 920
880 if lp=3 then ms$=ms$+"[arch]":goto 930
890 if lp=4 then ms$=ms$+"[wings]":goto 940
900 ms$=ms$+"[full]":goto 950
910 ho(5)=0:ho(6)=0:ho(9)=0:ho(10)=0:ho(11)=0:ho(14)=0:ho(15)=0:goto 960
920 ho(1)=0:ho(2)=0:ho(3)=0:ho(4)=0:ho(7)=0:ho(8)=0
921 ho(12)=0:ho(13)=0:ho(16)=0:ho(17)=0:ho(18)=0:ho(19)=0:goto 960
930 for i=1 to 19:ho(i)=0:next i:ho(1)=1:ho(3)=1:ho(17)=1:ho(19)=1:goto 960
940 for i=1 to 19:ho(i)=0:next i:ho(2)=1:ho(10)=1:ho(18)=1:goto 960
950 for i=1 to 19:ho(i)=0:next i
960 rem build label map
970 sl=0:for i=1 to 19:if ho(i)=1 then 990
980 sl=sl+1:mp(sl)=i:rm(i)=sl
990 next i:return
```
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
