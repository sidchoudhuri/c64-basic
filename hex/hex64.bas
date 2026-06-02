10 rem *** hex64 v2 - expanding boards ***
20 print chr$(147);chr$(14);chr$(5);:poke 53281,0:poke 53280,0
30 dim c(19),n(19),ad(19,6),x$(19),ho(19)
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
340 if h<1 or h>19 then 310
350 if ho(h)=1 then print "hole!":for t=1 to 500:next t:goto 310
360 if n(h)>0 then print "taken!":for t=1 to 500:next t:goto 310
370 c(h)=tc:n(h)=tn:sw=0
380 rem merges
390 m=0
400 for i=1 to 6:nb=ad(h,i)
410 if nb=0 then 440
420 if ho(nb)=1 or c(nb)<>c(h) or n(nb)=0 then 440
430 n(h)=n(h)+n(nb):c(nb)=0:n(nb)=0:m=1
440 next i
450 if m=1 then 390
460 rem score
470 if n(h)>=10 then s=s+n(h):ms$="clear! +"+mid$(str$(n(h)),2)+" pts":n(h)=0:c(h)=0
480 rem level up
490 if s>=nt then lv=lv+1:nt=nt*2:ms$=ms$+" ** lvl "+mid$(str$(lv),2)+" **":gosub 820
500 rem full board check
510 fu=1:for i=1 to 19:if n(i)=0 and ho(i)=0 then fu=0
520 next i:if fu=1 then g=1
530 tc=tk:tn=tm:tk=int(rnd(1)*4)+1:tm=int(rnd(1)*3)+1
540 goto 310
550 rem *** draw screen ***
600 print chr$(147);
610 print "hex64 score:";s;" lvl:";lv;" goal:";nt
620 if ms$<>"" then print ms$:ms$=""
625 print
630 for i=1 to 19
640 if ho(i)=1 then x$(i)="    ":goto 700
650 if n(i)<>0 then 680
660 si$=mid$(str$(i),2):if len(si$)=1 then si$=" "+si$
665 if sw=0 then x$(i)="[..]":goto 700
670 x$(i)="["+si$+"]":goto 700
680 sv$=mid$(str$(n(i)),2):if len(sv$)=1 then sv$=" "+sv$
690 x$(i)=co$(c(i))+"["+sv$+"]"+co$(0)
700 next i
710 print "     ";x$(1);" ";x$(2);" ";x$(3)
720 print
730 print "   ";x$(4);" ";x$(5);" ";x$(6);" ";x$(7)
740 print
750 print " ";x$(8);" ";x$(9);" ";x$(10);" ";x$(11);" ";x$(12)
760 print
770 print "   ";x$(13);" ";x$(14);" ";x$(15);" ";x$(16)
780 print
790 print "     ";x$(17);" ";x$(18);" ";x$(19)
795 print
800 print "---------------------------------------"
810 print "tile:";co$(tc);"[";mid$(str$(tn),2);"]";co$(0);" next:";co$(tk);"[";mid$(str$(tm),2);"]";co$(0)
815 return
820 rem *** load level shape ***
830 for i=1 to 19:ho(i)=1:n(i)=0:c(i)=0:next i:sw=1
840 lp=((lv-1) mod 5)+1
850 if lp=1 then ms$=ms$+"[flower]":goto 900
860 if lp=2 then ms$=ms$+"[ring]":goto 910
870 if lp=3 then ms$=ms$+"[arch]":goto 920
880 if lp=4 then ms$=ms$+"[wings]":goto 930
890 ms$=ms$+"[full]":goto 940
900 ho(5)=0:ho(6)=0:ho(9)=0:ho(10)=0:ho(11)=0:ho(14)=0:ho(15)=0:return
910 ho(1)=0:ho(2)=0:ho(3)=0:ho(4)=0:ho(7)=0:ho(8)=0
911 ho(12)=0:ho(13)=0:ho(16)=0:ho(17)=0:ho(18)=0:ho(19)=0:return
920 for i=1 to 19:ho(i)=0:next i:ho(1)=1:ho(3)=1:ho(17)=1:ho(19)=1:return
930 for i=1 to 19:ho(i)=0:next i:ho(2)=1:ho(10)=1:ho(18)=1:return
940 for i=1 to 19:ho(i)=0:next i:return
