10 t$="iceberg"
15 en = 4:dim x(en):dim y(en)
16 dim ep(en):et=en
17 for e=1toen:ep(e)=48+e:next e
20 gx=18:gy=8:bl=20-gx:dim b(gx,gy)
30 bt=1:ul=1024+bl+bt*40
40 oc=asc("."):ib=asc("*"):yp=asc("y")
50 gosub 1000
70 for y=1togy
80 for x=1togx:b(x,y)=46+4*(rnd(1)<0.13)
:next x
90 next y
110 for y=1togy:print spc(bl);
120 for x=1togx:print chr$(b(x,y));" ";:
next x
130 print:next
140 yx=int(rnd(1)*gx+1):yy=int(rnd(1)*gy
+1):if b(yx,yy)<>oc then 140
150 b(yx,yy)=yp:poke ul+(yx-1)*2+40*yy,y
p and 63
160 for e=1toen
170 x(e)=int(rnd(1)*gx+1):y(e)=int(rnd(1
)*gy+1):if b(x(e),y(e))<>oc then 170
180 b(x(e),y(e))=ep(e):poke ul+(x(e)-1)*
2+40*y(e),ep(e) and 63
185 next e
190 print:print "(n, s, e, w)"
200 rem =-=-=update player ship=-=-=
210 getd$:ok=(d$="n" or d$="s" or d$="e"
 or d$="w"): if not(ok) then 210
220 b(yx,yy)=oc:poke ul+(yx-1)*2+40*yy,o
c
230 yy=yy-(d$="s" and yy<>gy)+(d$="n" an
d yy<>1)
240 yx=yx-(d$="e" and yx<>gx)+(d$="w" an
d yx<>1)
250 c=b(yx,yy)
260 b(yx,yy)=yp:poke ul+(yx-1)*2+40*yy,y
p and 63
270 if c=sp then 500
280 if c=ib then 600
290 rem =-=-=update enemy ship=-=-=
300 for e=1toen
302 if ep(e)=oc then 350
305 b(x(e),y(e))=oc:poke ul+(x(e)-1)*2+y
(e)*40, oc
310 x(e)=x(e)+sgn(yx-x(e)):y(e)=y(e)+sgn
(yy-y(e))
320 c=b(x(e),y(e))
330 b(x(e),y(e))=ep(e):poke ul+(x(e)-1)*
2+40*y(e),ep(e) and 63
340 if c=ib then gosub 700
350 next e
420 goto 200
500 print"you have been caught!!"
510 goto 800
600 print"you have collided with an iceb
erg."
620 goto 800
700 print"enemy vessel "e" struck an ice
berg"
705 b(x(e),y(e))=ib:poke ul+(x(e)-1)*2 +
 y(e)*40,ib
710 ep(e)=oc
720 et=et-1
730 if et = 0 then print " you are safe,
 all enemies destroyed.":end
740 return
800 stop
1000 print chr$(147)
1015 bi=20-int(len(t$)/2)
1020 print spc(bi) t$
2000 return
