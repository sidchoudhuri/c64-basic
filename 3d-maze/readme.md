# [3D Maze](3dmaze.m0n.de)
### Turbo mode 16mhz+ required...
```basic
10 gosub 3000
20 print chr$(147):poke 53280,0:poke 53281,0
21 print spc(15)"3d maze":print "{down}{down}"spc(5)"turbo mode 16mhz+ required"
22 print "{down}"spc(12)"press any key"
23 geta$:if a$="" then goto 23
25 m$="xxxxx=xxxxxxxxxxxxxx  x x  x       xx      x x xxxxx xxxx xxxx x x   x xxx  x x  x x x x xx  xx x xx xxx x xxx      xx   + x xxxxxxx xxxxxxxxx xx                xxxxxxxxxxxxxxxxxxx"
26 m$=left$(m$,104)+" "+mid$(m$,106):m$=left$(m$,122)+"  "+mid$(m$,125)
27 m$=left$(m$,151)+" "+mid$(m$,153)
35 px=14:py=6:dr=0:mm=0
40 rem main loop
45 pa=dr*q-q:if mm=1 then gosub 2000:goto 50
46 print chr$(19);"facing: ";mid$("nesw",dr+1,1);" (m=map)  "
47 gosub 1000
50 get k$:if k$="" then 50
60 if k$="a" then dr=(dr-1) and 3:goto 45
70 if k$="d" then dr=(dr+1) and 3:goto 45
80 if k$="w" then dx=int(cos(pa)+.5):dy=int(sin(pa)+.5):tx=px+dx:ty=py+dy:gosub 500:goto 45
85 if k$="m" then mm=1-mm:print chr$(147):for i=0 to 39:ph(i)=0:next:goto 45
90 goto 50
500 rem collision & win check
510 p=int(ty)*w+int(tx)+1:if p<1 or p>len(m$) then return
515 c$=mid$(m$,p,1):if c$="x" then return
530 px=tx:py=ty:if c$="=" then goto 4000
550 return
1000 rem 3d render
1010 for x=0 to 39:ra=pa-0.4+(x/40)*0.8:d=0
1040 d=d+0.2:rx=px+cos(ra)*d:ry=py+sin(ra)*d
1050 p=int(ry)*w+int(rx)+1:if p<1 or p>len(m$) then d=14:goto 1060
1055 if mid$(m$,p,1)<>"x" and d<14 then goto 1040
1060 v=int(10/d):if v>11 then v=11
1062 c=160:if d>3 then c=102:if d>5 then c=126
1064 if d>7 then c=124:if d>10 then c=46
1065 if v=ph(x) and c=pc(x) then next x:return
1070 ph(x)=v:pc(x)=c:for y=1 to 24
1090 ch=32:if y>=12-v and y<=12+v then ch=c
1100 poke 1024+y*40+x,ch
1110 next y,x:return
2000 rem map render
2010 for y=0 to h-1:for x=0 to w-1
2020 c=32:ch$=mid$(m$,y*w+x+1,1)
2030 if ch$="x" then c=160
2040 if ch$="=" then c=102
2050 if x=int(px) and y=int(py) then c=90
2060 poke 1024+(y+10)*40+x,c
2080 next x,y
2090 print chr$(19);"map x:";px;"y:";py;" (w,a,d,m)     "
2100 print "facing: ";mid$("nesw",dr+1,1)
2110 return
3000 w=18:h=10:pi=3.14159:q=pi/2:dim ph(39):dim pc(39):return
4000 rem win!
4010 print chr$(147):poke 53281,1:poke 53280,1
4020 for i=1 to 10:print:next
4030 print "      *** you escaped the maze! ***"
4040 end
```
