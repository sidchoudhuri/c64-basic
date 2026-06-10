100 rem rotating ascii globe - pure c64 basic
110 rem texture: github.com/adamsky/globe - original basic by terror
120 print chr$(147);chr$(14);chr$(5):poke 53280,0:poke 53281,0
130 tw=128:ht=35:nf=8:p=3.14159265
140 dim m$(ht),r%(959),b%(959),f$(nf*24-1)
150 print "decoding texture (rle)..."
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
200 print "computing projection..."
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
1000 data "128.128.37.H11.7H102.2H2.2g4@2g2.4g8@g2.H21.2H.4H9.2H53.2H2.2H2g"
1010 data "@2g3@3.16@.H10.3g.H7.H2.2H15.H51.3H3.H.3g4.3g14@12.H2.H13.3H8.3H"
1020 data "2g2.H9.H33.H4.H.2H2g2.g.gH7.g12@29.H6.2H2g5@3gH2.H4.H3.H10.H19."
1030 data "3g@3g.H2g.g@4gH6.11@g26.2g3.Hg.H2g13@g2@g3H2g2.H9.H6.5g3.2H5.Hg"
1040 data "3@g2H2gH.@2.g@g5.2g8@gH13.H.4g2H5.2H2.Hg@.28@2g7.2g2H.Hg17@2g@4g"
1050 data "2@.@3.g2@.H2.g6@gH16.6@3gHgHg@2g2@g@g37@2HgH2.g25@g.gH2.g2@4.H4@"
1060 data "2H4.3gH9.3@H4@2.49@3.H.Hg24@g2.H.H.H.gH4.H2@g7.2H7.Hg2@gHg47@g@g"
1070 data "3@g6.Hg3@2g.2g16@6.2@g7.H.H16.g3@g.3g40@3g@g2.g12.H2gH4.H15@.H4."
1080 data "3@g@H23.H2.@H2.40@gH3.H.g@H11.H.2H6.Hg14@g.H.H6@H18.g@3.g.g2H41@"
1090 data "7.2@H9.2H12.g16@Hg7@H16.gHg3.@2g43@g.H4.@H25.g15@g5@2g18.2H3g48@"
1100 data "Hg4.H26.Hg19@g3Hg19.g49@.H33.20@g2.2H18.5@g5@.@.3@gHg29@g.H33."
1110 data "18@g2H19.H.H2@g.@.g3@g.H2.2@2.28@2g.HgH32.17@gH22.2@g2.gH.Hg@g2."
1120 data "g.H3@2.23@g2@g3.gH32.H17@23.g2@.H3.3H@.8@2.22@g2H@H3.g34.16@g23."
1130 data "Hg.H2.g.H3.H2.g5@2.23@2.2g.Hg36.g13@gH24.@g4@H8.30@H3.g39.12@26."
1140 data "g7@g2Hg4H31@3.H39.Hg5@g2.H26.H10@g10@g25@45.g4@5.@24.16@.g4@H2g"
1150 data "22@46.Hg3@29.18@H4@gHgH.Hg17@gH45.H.3@4.H24.18@2.6@4.2g5@g7@g50."
1160 data "3@2.@3.H2.H19.19@.6@4.H.3@gH2.4@Hg51.H.@2g@5.2H19.19@Hg3@g6.H3@H"
1170 data "3.4@2H54.H.@2g7.H15.H19@g.2@9.2@H4.H4@4.g52.Hg@4.H19.20@2.H9.2@"
1180 data "4.H.@g2@H58.@3.@g19.g20@.g9.g@6.g6.H2.H53.g.g5@17.22@9.2Hg5.g6.H"
1190 data "2.H18."
