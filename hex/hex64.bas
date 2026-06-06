10 rem *** hex64 v2 - more boards! ***
20 print chr$(147);chr$(14);chr$(5);:poke 53281,0:poke 53280,0
30 dim c(19),n(19),ad(19,6),x$(19),ho(19),mp(19),rm(19),zc(5),zn(5),cl(5)
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
250 dim co$(5)
260 co$(1)=chr$(156):co$(2)=chr$(30):co$(3)=chr$(150):co$(4)=chr$(158):co$(5)=chr$(159):co$(0)=chr$(5)
270 gosub 820
275 gosub 1000
300 rem *** main loop ***
310 gosub 600
320 if g=1 then print "game over! score:";s:end
330 h=0:input "hex";h
340 if h<1 or h>sl then 310
350 ih=mp(h)
360 if n(ih)>0 then print "taken!":for t=1 to 500:next t:goto 310
370 c(ih)=zc(sp):n(ih)=zn(sp)
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
490 if s>=nt then lv=lv+1:nt=nt*2:ms$=ms$+" ** lvl "+mid$(str$(lv),2)+" **":gosub 820:gosub 1000:goto 310
500 rem full board check
510 fu=1:for i=1 to 19:if n(i)=0 and ho(i)=0 then fu=0
520 next i:if fu=1 then g=1
530 sp=sp+1:if sp>5 then gosub 1000
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
815 print "tile:";co$(zc(sp));"[";mid$(str$(zn(sp)),2);"]";co$(0);
816 if sp<5 then print " next:";:for si=sp+1 to 5:print co$(zc(si));"[";mid$(str$(zn(si)),2);"]";co$(0);:next si
817 print
818 return
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
1000 rem *** gen stack ***
1010 sp=1
1020 if lp=1 then nc=1:nm=4
1030 if lp=2 then nc=2:nm=4
1040 if lp=3 then nc=2:nm=4
1050 if lp=4 then nc=4:nm=4
1060 if lp=5 then nc=5:nm=5
1070 rem shuffle nm colors into cl() via fisher-yates
1080 for k=1 to nm:cl(k)=k:next k
1090 for k=nm to 2 step -1
1100 j=int(rnd(1)*k)+1
1110 t=cl(k):cl(k)=cl(j):cl(j)=t
1120 next k
1130 if lp<=2 then gosub 1200:return
1140 for i=1 to 5
1150 zc(i)=cl(int(rnd(1)*nc)+1)
1160 zn(i)=int(rnd(1)*3)+1
1170 next i
1180 return
1200 rem *** grouped stack gen (lp 1-2) ***
1210 if nc=1 then k1=5:goto 1230
1220 k1=int(rnd(1)*4)+1
1230 for i=1 to 5
1240 if i<=k1 then zc(i)=cl(1):goto 1260
1250 zc(i)=cl(2)
1260 zn(i)=int(rnd(1)*3)+1
1270 next i
1280 return
