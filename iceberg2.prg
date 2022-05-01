10 t$="iceberg"
20 gx=18:gy=8:bl=20-gx:dim b(gx,gy)
30 bt=1:ul=1024+bl+bt*40
40 oc=asc("."):ib=asc("*"):yp=asc("y"):sp=asc("z")
50 gosub 1000
70 for y=1togy
80 for x=1togx:b(x,y)=46+4*(rnd(1)<0.13):next x
90 next y
110 for y=1togy:print spc(bl);
120 for x=1togx:print chr$(b(x,y));" ";:next x
130 print:next 
140 yx=int(rnd(1)*gx+1):yy=int(rnd(1)*gy+1):if b(yx,yy)<>oc then 140
150 b(yx,yy)=yp:poke ul+(yx-1)*2+40*yy,yp and 63
170 sx=int(rnd(1)*gx+1):sy=int(rnd(1)*gy+1):if b(sx,sy)<>oc then 170
180 b(sx,sy)=sp:poke ul+(sx-1)*2+40*sy,sp and 63
190 print:print "(n, s, e, w)"
200 rem =-=-=update player ship=-=-=
210 getd$:ok=(d$="n" or d$="s" or d$="e" or d$="w"): if not(ok) then 210
220 b(yx,yy)=oc:poke ul+(yx-1)*2+40*yy,oc
230 yy=yy-(d$="s" and yy<>gy)+(d$="n" and yy<>1)
240 yx=yx-(d$="e" and yx<>gx)+(d$="w" and yx<>1)
250 c=b(yx,yy)
260 b(yx,yy)=yp:poke ul+(yx-1)*2+40*yy,yp and 63
270 if c=sp then 500
280 if c=ib then 600
290 rem =-=-=update enemy ship=-=-=
300 b(sx,sy)=oc:poke ul+(sx-1)*2+40*sy,oc
310 sx=sx+sgn(yx-sx):sy=sy+sgn(yy-sy)
320 c=b(sx,sy)
330 b(sx,sy)=sp:poke ul+(sx-1)*2+40*sy,sp and 63
340 if c=ib then 700
350 if c=yp then 500
420 goto 200
500 print"you have been caught!!"
510 goto 800
600 print"you have collided with an iceberg."
620 goto 800
700 print"you are safe - enemy vessel struck an iceberg"
800 stop
1000 print"S";
1010 print"."
1015 bi=20-int(len(t$)/2)
1020 print spc(bi) t$
2000 return
