## [hex64](https://stigc.dk/c64/basic/?s=2jVbbcqM4EH3XV2goPxib1CJA4uIhPzK1D9gmhgkXF2BPPn-PrjjO7O4klajVOn1VdwsW0qnu6W63o039IRJ6j-gLrT-u1XBuhws9jtV0nuU5iUJ6ndphoadm2mxZkvoHQxmC-4fiOr7XlMdRxoJw3YRBSOKQntuenrYs94NB_a_OWALhBx8btW9GtfRXtUy9XEjMaT9vSs8jSUjnMiwu-OvuJSuGpeQh4SF9GyfalowuI2V5IXc_9U4UU12dKey0wU-_GOqPhf7US0sEHKqWikZBEvAglL8kNTwWxOAJxcscTgSpweWGxwMWZEGueCw0zARAFkRgM3CZg6bgxeAFjBEWGbaQLBawSOuIDTuHUyw21lhiuJmUlt7iiCWEcYeGCukvgxQnzIYmbWm3GWQEYS4-JnnC6rchQlxGw1LNtlFKa1yFI49YhlJYBaBFhQR-wHIS2XilRRUX0-mJbMQSJ903xiMbslSd6wj0QfIgwFdvI24qadxsE59ECFaSzC91OXLhF5IRGUYc6n3sAIaROEamGaFhcGhFpi7jfDvSLIJJJGg5lSj-7TSgaP1d4u9ZsQyPrBgsEiFny_tXZP8FGYdr6_VVO9BuHK-q0WJmbYsQfYO8tW_0Iiu6qQfTg96l6ms63uvpG51P41QX3mEu6uFMYuSzQYu0w_UGHLraOzQkTpSW5jujaI_mde60NthCh-GsKdF2DdpNKOCwbRv_Nfxkcqne6-Gbpxps0Q3Gw1C301JcRuyVOqTuJMXL5VQMmhhInOlw-3q61DOJkae-DNHTn9pXFMOxlO3aBK1PEqZ9OZbGkSSBhM4HZsVw9EsVzkmS31-VUbkf1NGjDHKiPVH_9wpQnDSsMPCiLxkBmpr5kHBlqLeJh8skEToKlXKSpA-5KpkxOJfzXrEKNbdOXV3hkvbevm_Pm-28oMDUsR9E_t6j12X2TJrCQucNdky2uvped_R2JUmuTM2vJW5CmcEI7O57NQWHZRcpY_iDRhRUd-_oo8Hubqztdl6x1jU3Nfh26zo96jHc69M74Qjm7YYZ-3m06mBlavE8yCtoXZqBhr7IZk9CpQJ9iOIlPFY9tLzLtln64s-6hCeyF0xliYeWOU_VL1zDVEO9bBrBvj5PRLg3y9Ovm2uVgydzBKq7g7yMlaSHhYhYX_q8-f7qeY_lD1ZhHiKBN0kxiUieXh8iuC3P1rfh43nDxqP48XSfpDIa12moXZNFgRoTqKq5xWW628NL2KpykVnt6mGLY6dcQj1cNlYiUDbG2A_F2Xt_P1pEEc33R83Ds-L7g-K7UXzf4F20iuWcPEmpvTJxVyb2enoSGLHdk66ppyrwg3zkfSRbUZGjYojFBkvS5FFKnScOyR0lHJVCmjtpsUqr08zhckexcCVXf1gERalTlH1xg8UrdnWJrT4xAQ251ZCFvws_XdGra_IjJwttRWWujr2XP_vxIMPdjG47Wd_yPpYTTPzwDuttL4O86wMu7KAvDC7I67IC718E-icBmBJoweU2DQQDxHVjN-IzSw-ruamutWrJLH7-NDNdUeghIqedmr-6YjLcfXctMatemP8iB4Em_-L-jmMUZLqzADEF6ibej7du_FVPttRzlHomLDh6BiNRFwfFEMxSC42fodV0ahw0BjSz0OQZ-gtaZ4fFm5PJF271EBPWneKrFT7KGcFl_FiFWXOzokgNwSyRWELJaEUCiiKlyMIis8ZmtVKpWTP5uuQRUzIWzCyaWT-YxbPMEvlns_9yt_Y2C-0TM74wq5RZXexBV_L_uiIrGloi-6yD_7cOkpuX-3hrO5RqdUSp9tWV5HLadsB9eek-jfAcgznPFHTu8FThY2nu_LIt1GwGjwBh3z7dIP8A) - v2 more boards!
```basic
10 rem *** hex64 v2 - more boards! ***
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
380 rem *** merge ***
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
815 print "tile:";co$(tc);"[";mid$(str$(tn),2);"]";co$(0);" next:";co$(tk);"[";mid$(str$(tm),2);"]";co$(0)
816 return
820 rem *** load levels ***
830 for i=1 to 19:ho(i)=1:n(i)=0:c(i)=0:next i
840 lp=(lv-1)-int((lv-1)/5)*5+1
850 if lp=1 then ms$=ms$+"[flower]":goto 910
860 if lp=2 then ms$=ms$+"[ring]":goto 920
870 if lp=3 then ms$=ms$+"[arch]":goto 930
880 if lp=4 then ms$=ms$+"[wings]":goto 940
890 ms$=ms$+"[full]":goto 950
910 ho(5)=0:ho(6)=0:ho(9)=0:ho(10)=0:ho(11)=0:ho(14)=0:ho(15)=0:goto 960
920 ho(1)=0:ho(2)=0:ho(3)=0:ho(4)=0:ho(7)=0:ho(8)=0
921 ho(12)=0:ho(13)=0:ho(16)=0:ho(17)=0:ho(18)=0:ho(19)=0:goto 960
930 for i=1 to 19:ho(i)=0:next i:ho(1)=1:ho(3)=1:ho(17)=1:ho(19)=1:goto 960
940 for i=1 to 19:ho(i)=0:next i:ho(2)=1:ho(10)=1:ho(18)=1:goto 960
950 for i=1 to 19:ho(i)=0:next i
960 rem *** map labels ***
970 sl=0:for i=1 to 19:if ho(i)=1 then 990
980 sl=sl+1:mp(sl)=i:rm(i)=sl
990 next i:return
```
