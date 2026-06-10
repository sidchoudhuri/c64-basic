## Contents
- This folder contains a .d64 image with all code, calculated and pre-rendered, "fast" versions, 16, 24, 38 (max RAM) frames as well as an example in machine language
```
0 "globe           " 64 2a
52   "globe ml"     prg   ← machine language, real-time rotation, ~25 fps
150  "globe 38"     prg   ← max BASIC, 38 pre-rendered frames
95   "globe 24"     prg
64   "globe 16"     prg
26   "globe calc"   prg   ← the calculated
277 blocks free.
```
- The texture used is [globe_texture.txt](https://github.com/sidchoudhuri/c64-basic/blob/main/globe/globe_texture.txt) is from [adamsky's globe repo](https://github.com/adamsky/globe).
- [python script to generate BASIC code up to 42 frames (max available RAM)](https://github.com/sidchoudhuri/c64-basic/blob/main/globe/gen_globe_fast.py) -- pre-computed
```bash
python3 gen_globe_fast.py --frames N
```
## [rotating ascii globe -- calculated](https://stigc.dk/c64/basic/?s=2rVjZcqs4EH3nKyjKU2W8YMQWQ0KKX8GbxOQGewi518zXT7ckQGAwdk1IJQHUOjo6vUiC2LZeHD_14lymZZZTPf3aZ5lOf513R40Q0Vger-V3cYx0mpXse2ftz5-b9JB-fn1UG26pr_VzkdEsT3_pu_Qr2-u7CnoVxbnQiGPrlyLLS33PitmceC_mq7xz5J1vRpfzx1H3XWdrr-z2gaxsjbi2Xv6JibONWBm7fpSf4m10iV2LeMQPncDXiGfrh-xT_5zNWWmuir_moR-aq538f5rN89PC8dbE1IhfszGKY3rAGcvZWZZlaCSw9dO50IuY6OVZZ2WEVno6W-1mEcAXZpzOlnCfQyfNsRswkOTyzQW8FOe_j_syO-cc0SECsYptRHTcCJ-u4skNoyyuFp69vEbAOjPjNdEcECy_xvPrmoSWb26IE-VVPK_WxIEHEh3i_LrIr8u8WuSV5oA82Uk_vANhdsx1l9iaA3rk_8Zf_xRzsj6YmuNzm3T3Nc8r880Kw1AYX1h82TjrtMzn67zaiA4c1zQjeka-LwAHooClHQFGXr3bbV8NmhvkKyDbtqRRIrCECAFiC71iHCf_dwOWHOr6ZtfG5RKwQnisYpBzfmGbywJcuSRoWFbvrJSWVcxA99DX-fs30rwmmouhzEUsq2jHbxCr3MydxcVclH9MPc0POnFeNBBJRw8KN3q2cNFJOCU_rUmUnuPTggSRdO_uO_vFg-VUpJ9H4_W0JK_G-WS85ifNu_Hw1yw2jKj4DZLt97GteY6wuPW65gn3cd7vsdTDA9E9TzT8Fq8A8mu2lHkTmBxc88CvosHQDSG2H8BrcEoJAcQ1WKbndt4eumEWf2aH2RyjGQ3MVXldkhXkhgcO2AN1y4g-YpdERQlj-DbnAb0MZgguaLPiNtBMmmbaNgueAfAURk5jlCgYOmIQL8SBiOZLJcq39-FJQ_xvF0XJ516Umi8E-nh73-9vzD9MVP5D8xuF9jMNtOFe13wQCIoC1oRlZUKr5m_VgAjs25KlBehm9GbQK2ghNrp13ahjQFjgKHscpjBfJbbHYU57Edtwm58EfQEOhLkjYRSN2EDkkJapblj_84LSZpOfBHN-Esz9STDvKTCm3otLBfN_klnwGBgyoDSBi1K8E_f8WfJFsJdRMOivTsNibJLZdooZYjAGTDgZeJH0LikkgoUdMKDfiMwGyLC7zMh0BoipMj6QGK_HrAXrZgDrD66IxnCyaju7YXY3A5j4I1CoRevudITZRAawmpWcHEySNYN0yCFYkwFD2lLuRPAJ_PK7mptCjCpg9zKAK844VkdyeKI3CiJY0GOGw9M2RBnCUOzIrATFotKqAWYKWC8DeATQGolxtJsw7bBUp9lkAIdgdMA6EamIzNCPODXaoyXBuhlgJY3P4IdnEE1o8shl4Pa50YxR1ougLkNLtnMB8I0Qo3YxgnUzAE1EICbPXgimZsCgZmrZwh_Bg7UBxpqq4SgZwHj80CcZCU0pB-uuASKsqEVvIGv_NHz65QjBlAwQI1D6MDeebVgBarD-GsBoI8pAPeXTYmPF0VEyAIzQ8GFesmYmrQO2_XSqq2HfE1jPJd0BapSHhpoBGJfsYTdatU8aZm5nDeguIDeOaMjeUIOIQjA1AxL6TJDJdaxGRrB7awC9ic9O0emsO5yZ25agZ7ORUXWNQrB7u6DB1OIFezjO3CYDniaWdBMKwe7vgsbqBxtm1mSAIrHFy_5UAaG3zLZPMqODOytIDgQLW2YUGNF6yKlqy5dm1mXm2c8xoyObKl62vSYDsDDxus0rFLu3EFBRI2lfM-_-LmgsuwdyBcHaNYCJPVi7gI8xw9LCrLrCqsy8pzSjY7tLvqB4vrJxofWei95llvD9UT-nEGziHEAf8iVWLwTrZAC7l0ZKubgRTDKbOgc84MrWm2E3N3H7wiYXgqETgYGf7SaYyWyndw8UTGxcfNJhlqibMTq1MN0wmz4J06b7qGhyS-W7PWZiZCpqPH2cGGc2fRJm9K4ja48jmD_ETGwfcV87uGVmY8ymT8LMkszYJLOXQWZ1sCoHCDqR6wi2feCMLtCHTpA9ZuEgs0RhxiypU7uKjzALHvkWxPiWZvzUXzMLyDAzsVNuk4XJPuOfEBDswW9BnNzIqZ81zNxhZtRSAlUWOtb4d4zZw9-CGB0NtobZcAYgA6YY1zNNkruaBY9_WOKfW-hYXUGwlxFmiaKMDIv6zXDoItj2iU9etFkDh-tZEI4xU_rU-877zP4D) based on [Rafał Fajfrowski's BASIC Programming Language Facebook group post](https://www.facebook.com/groups/2057165187928233/?multi_permalinks=4330021220642607&hoisted_section_header_type=recently_seen&__cft__[0]=AZbW7lPI8VtNrzjwkSuTQjujAotZnfNND9bNmVvtH3kqHZHLPEB7sUvcORuFBU9EUEIo5POSyHiu2qQanKSrx-SFa3N6cns3Qn5KmQpemllG8VP41grMskYjM2qkWaqg-3MFeHoWqyxqL3d92eMjQWZFUpsZt_lDAvXzDytUGwKT26dl_Iq2H0Hw0Sxyo4yyPdSRPUDksM42H5mHN_hYkxyc&__cft__[1]=AZZ2da23JfVGVCfFdQSYhO25hTdobfzbFYupy-4laH0a6gIANlnRWOAmpeQDWghaeyvacBnuDrUs_Lh-p33w8ImFc4TmmyrRyvwTOTsXgCZIoaNRtpyQNk9QOoOU8a8nMdc9-FPfT6QJdRQBEHYS1bYgeQFlkIwa4wd__JxFXB_dHIyyCGdmoymcTY0yMttac3aWTDiE6t7fTj6oqEIulyxt&__tn__=%2CO%2CP-R) (his code [here](https://basicfusion.org/index.html?open=cloud%2Fa2a675d8&fbclid=IwY2xjawSVyo1leHRuA2FlbQIxMABicmlkETFpU2l2aVpYdnpJODFaQ0tjc3J0YwZhcHBfaWQQMjIyMDM5MTc4ODIwMDg5MgABHtFetuiVFSZXIr413B5jCwe4QPVYQ4_Jfa_g7QsOL4ok2j_RIeaeKzjUd35p_aem_4-Ozh0TBhPCDMDmNnpeIiw))
```basic
100 rem rotating ascii globe
110 rem texture: github.com/adamsky/globe - original basic by terror
120 print chr$(147);chr$(142);chr$(5):poke 53280,0:poke 53281,0
130 tw=128:ht=35:nf=8:p=3.14159265
140 dim m$(ht),r%(959),b%(959),f$(nf*24-1)
150 print "reading texture..."
160 for r=1 to ht:read a$,b$:m$(r)=a$+b$:next
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
410 for y=0 to 23:s$="":rv=0:cc=0
420 for x=0 to 39:i=y*40+x
430 if r%(i)>=0 then 470
440 if rv then s$=s$+chr$(146):rv=0
450 s$=s$+" ":goto 560
470 tx=(b%(i)+ao) and 127
480 t$=mid$(m$(r%(i)),tx+1,1)
490 c$=".":k=31:rt=0
500 if t$="h" then c$=",":k=30
510 if t$="g" then c$=chr$(166):k=30
520 if t$="@" then c$=" ":k=149:rt=1
530 if rt<>rv then s$=s$+chr$(146-128*rt):rv=rt
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
1000 data "................................................................"
1010 data "................................................................"
1020 data "................................................................"
1030 data "................................................................"
1040 data ".....................................h...........hhhhhhh........"
1050 data "................................................................"
1060 data "..............................hh..gg@@@@gg..gggg@@@@@@@@g..h...."
1070 data ".................hh.hhhh.........hh............................."
1080 data "........................hh..hhgg@gg@@@...@@@@@@@@@@@@@@@@.h....."
1090 data ".....ggg.h.......h..hh...............h.........................."
1100 data ".........................hhh...h.ggg....ggg@@@@@@@@@@@@@@......."
1110 data ".....h..h.............hhh........hhhgg..h.........h............."
1120 data "....................h....h.hhgg..g.gh.......g@@@@@@@@@@@@......."
1130 data "......................h......hhgg@@@@@gggh..h....h...h.........."
1140 data "h...................ggg@ggg.hgg.g@ggggh......@@@@@@@@@@@g......."
1150 data "...................gg...hg.hgg@@@@@@@@@@@@@g@@ghhhgg..h........."
1160 data "h......ggggg...hh.....hg@@@ghhggh.@..g@g.....gg@@@@@@@@gh......."
1170 data "......h.gggghh.....hh..hg@.@@@@@@@@@@@@@@@@@@@@@@@@@@@@gg......."
1180 data "gghh.hg@@@@@@@@@@@@@@@@@gg@gggg@@.@...g@@.h..g@@@@@@gh.........."
1190 data "......@@@@@@ggghghg@gg@@g@g@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
1200 data "hhgh..g@@@@@@@@@@@@@@@@@@@@@@@@@g.gh..g@@....h@@@@hh....gggh...."
1210 data ".....@@@h@@@@..@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
1220 data "...h.hg@@@@@@@@@@@@@@@@@@@@@@@@g..h.h.h.gh....h@@g.......hh....."
1230 data "..hg@@ghg@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@g@g@@@g."
1240 data ".....hg@@@gg.gg@@@@@@@@@@@@@@@@......@@g.......h.h.............."
1250 data "..g@@@g.ggg@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ggg@g..g....."
1260 data ".......hggh....h@@@@@@@@@@@@@@@.h....@@@g@h....................."
1270 data "..h..@h..@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@gh...h.g@h....."
1280 data "......h.hh......hg@@@@@@@@@@@@@@g.h.h@@@@@@h..................g@"
1290 data "...g.ghh@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.......@@h....."
1300 data "....hh............g@@@@@@@@@@@@@@@@hg@@@@@@@h................ghg"
1310 data "...@gg@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@g.h....@h......"
1320 data "...................g@@@@@@@@@@@@@@@g@@@@@gg..................hhg"
1330 data "gg@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@hg....h......."
1340 data "...................hg@@@@@@@@@@@@@@@@@@@ghhhg..................."
1350 data "g@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.h............"
1360 data ".....................@@@@@@@@@@@@@@@@@@@@g..hh.................."
1370 data "@@@@@g@@@@@.@.@@@ghg@@@@@@@@@@@@@@@@@@@@@@@@@@@@@g.h............"
1380 data ".....................@@@@@@@@@@@@@@@@@@ghh...................h.h"
1390 data "@@g.@.g@@@g.h..@@..@@@@@@@@@@@@@@@@@@@@@@@@@@@@gg.hgh..........."
1400 data ".....................@@@@@@@@@@@@@@@@@gh......................@@"
1410 data "g..gh.hg@g..g.h@@@..@@@@@@@@@@@@@@@@@@@@@@@g@@g...gh............"
1420 data "....................h@@@@@@@@@@@@@@@@@.......................g@@"
1430 data ".h...hhh@.@@@@@@@@..@@@@@@@@@@@@@@@@@@@@@@ghh@h...g............."
1440 data ".....................@@@@@@@@@@@@@@@@g.......................hg."
1450 data "h..g.h...h..g@@@@@..@@@@@@@@@@@@@@@@@@@@@@@..gg.hg.............."
1460 data "......................g@@@@@@@@@@@@@gh........................@g"
1470 data "@@@@h........@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@h...g................"
1480 data ".......................@@@@@@@@@@@@..........................g@@"
1490 data "@@@@@ghhghhhh@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@...h................"
1500 data ".......................hg@@@@@g..h..........................h@@@"
1510 data "@@@@@@@g@@@@@@@@@@g@@@@@@@@@@@@@@@@@@@@@@@@@...................."
1520 data ".........................g@@@@.....@........................@@@@"
1530 data "@@@@@@@@@@@@.g@@@@hgg@@@@@@@@@@@@@@@@@@@@@@....................."
1540 data ".........................hg@@@.............................@@@@@"
1550 data "@@@@@@@@@@@@@h@@@@ghgh.hg@@@@@@@@@@@@@@@@@gh...................."
1560 data ".........................h.@@@....h........................@@@@@"
1570 data "@@@@@@@@@@@@@..@@@@@@....gg@@@@@g@@@@@@@g......................."
1580 data "...........................@@@..@...h..h...................@@@@@"
1590 data "@@@@@@@@@@@@@@.@@@@@@....h.@@@gh..@@@@hg........................"
1600 data "...........................h.@gg@.....hh...................@@@@@"
1610 data "@@@@@@@@@@@@@@hg@@@g......h@@@h...@@@@hh........................"
1620 data "..............................h.@gg.......h...............h@@@@@"
1630 data "@@@@@@@@@@@@@@g.@@.........@@h....h@@@@....g...................."
1640 data "................................hg@....h...................@@@@@"
1650 data "@@@@@@@@@@@@@@@..h.........@@....h.@g@@h........................"
1660 data "..................................@...@g...................g@@@@"
1670 data "@@@@@@@@@@@@@@@@.g.........g@......g......h..h.................."
1680 data "...................................g.g@@@@@.................@@@@"
1690 data "@@@@@@@@@@@@@@@@@@.........hhg.....g......h..h.................."
```
