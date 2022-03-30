*------------------------------------------------
'reinit'
*------------------------------------------------
'open mwtrans-core-aug2017-ly2009.ctl'
'open mwtrans-v1_3.ctl'
*
'open merid_wat_subl.ctl'
*-----------------------------------------------
'set vpage 0.0 11.0 0.0 8.5'
'set parea 0.6 3.6 1.0 8.0'
'set gxout line'
'set grads off'
'set xlopts 1 3 0.08'
'set ylopts 1 3 0.12'
'set xlab on'
'set ylab on'
'set vrange -1.2 1.2'
'set lat -90 90'
'set xlint 15'
'set ylint 0.25'
*
'define glbadj=ave(-glb.3,time=jan1988,time=jan2007)*1e-9'
*
'set ccolor 3'
'set cthick 10'
'set cmark 0'
*'d ave(glb.1,time=jan1988,time=jan2007)*1e-9 + glbadj'
'd ave(glb.1,time=jan1988,time=jan2007)*1e-9'
*'set ccolor 2'
*'set cthick 10'
*'set cmark 0'
*'d ave(glb.2,time=jan1988,time=jan2007)*1e-9 + glbadj'
'set ccolor 2'
'set cthick 10'
'set cmark 0'
'd ave(glb.2,time=jan1988,time=jan2007)*1e-9 + glbadj'
*
label(0.0,1.3,"GLOBAL FWT (1988-2007)",30,0,0.12)
label(-110,0.0,"[10^9 kg/s]",4,90,0.10)
label(0.0,-1.35,"latitude",30,0,0.12)
*
splt(0.0,0,180)
obswitherr( 45.0,-0.52, 0.30, 3, 0.10)
obswitherr( 35.0,-0.93, 0.30, 3, 0.10)
obswitherr( 24.0,-0.23, 0.30, 3, 0.10)
obswitherr( 10.0, 0.15, 0.30, 3, 0.10)
obswitherr(-19.5,-0.43, 0.30, 3, 0.10)
obswitherr(-32.0, 0.61, 0.30, 3, 0.10)
*---------------------------------------------------------------
*
'set line 3 1 5'
'run drawline.gs 10.0 1.05 35.0 1.05'
'set line 1 1 1'
'set string 1 l 3'
'set strsiz 0.10'
'run drawstring.gs 40.0 1.05 CORE'
'set string 1 c 3'
*
'set line 2 1 5'
'run drawline.gs 10.0 0.95 35.0 0.95'
'set line 1 1 1'
'set string 1 l 3'
'set strsiz 0.10'
'run drawstring.gs 40.0 0.95 JRA55-do'
'set string 1 c 3'
*
*---------------------------------------------------------------
'set vpage 0.0 11.0 0.0 8.5'
'set parea 4.2 7.2 1.0 8.0'
'set gxout line'
'set grads off'
'set xlopts 1 3 0.08'
'set ylopts 1 3 0.12'
'set xlab on'
'set ylab on'
'set vrange -1.2 1.2'
'set lat -90 90'
'set xlint 15'
'set ylint 0.25'
*
'define	inpadj=ave(inp.3,time=jan1988,time=jan2007)*1e-9'
*
'set ccolor 3'
'set cthick 10'
'set cmark 0'
*'d ave(inp.1,time=jan1988,time=jan2007)*1e-9 + inpadj'
'd ave(inp.1,time=jan1988,time=jan2007)*1e-9'
*'set ccolor 2'
*'set cthick 10'
*'set cmark 0'
*'d ave(inp.2,time=jan1988,time=jan2007)*1e-9 + inpadj'
'set ccolor 2'
'set cthick 10'
'set cmark 0'
'd ave(inp.2,time=jan1988,time=jan2007)*1e-9 + inpadj'
*
label(0.0,1.3,"Indo-Pacific FWT (1988-2007)",30,0,0.12)
label(-110,0.0,"[10^9 kg/s]",4,90,0.10)
label(0.0,-1.35,"latitude",30,0,0.12)
*
splt(0.0,0,180)
*
obswitherr( 47.0,-0.061, 0.032, 4, 0.08)
obswitherr( 35.0,-0.088, 0.046, 4, 0.08)
obswitherr( 24.0,-0.138, 0.046, 4, 0.08)
obswitherr( 10.0, 0.269, 0.072, 4, 0.08)
obswitherr(-24.0, 0.230, 0.077, 4, 0.08)
obswitherr(-37.5, 0.609, 0.050, 4, 0.08)
*
obswitherr( 47.0,-0.27, 0.00, 3, 0.10)
obswitherr( 35.0,-0.56, 0.00, 3, 0.10)
obswitherr( 24.0,-0.21, 0.00, 3, 0.10)
obswitherr( 10.0, 0.03, 0.00, 3, 0.10)
obswitherr(-18.0,-0.33, 0.00, 3, 0.10)
obswitherr(-32.0, 0.37, 0.00, 3, 0.10)
*---------------------------------------------------------------
*
'set line 3 1 5'
'run drawline.gs 10.0 1.05 35.0 1.05'
'set line 1 1 1'
'set string 1 l 3'
'set strsiz 0.10'
'run drawstring.gs 40.0 1.05 CORE'
'set string 1 c 3'
*
'set line 2 1 5'
'run drawline.gs 10.0 0.95 35.0 0.95'
'set line 1 1 1'
'set string 1 l 3'
'set strsiz 0.10'
'run drawstring.gs 40.0 0.95 JRA55-do'
'set string 1 c 3'
*
*---------------------------------------------------------------
'set vpage 0.0 11.0 0.0 8.5'
'set parea 7.8 10.8 1.0 8.0'
'set gxout line'
'set grads off'
'set xlopts 1 3 0.08'
'set ylopts 1 3 0.12'
'set xlab on'
'set ylab on'
'set vrange -1.2 1.2'
'set lat -90 90'
'set xlint 15'
'set ylint 0.25'
*
'define	atladj=ave(atl.3,time=jan1988,time=jan2007)*1e-9'
*
'set ccolor 3'
'set cthick 10'
'set cmark 0'
*'d ave(atl.1,time=jan1988,time=jan2007)*1e-9 + atladj'
'd ave(atl.1,time=jan1988,time=jan2007)*1e-9'
*'set ccolor 2'
*'set cthick 10'
*'set cmark 0'
*'d ave(atl.2,time=jan1988,time=jan2007)*1e-9 + atladj'
'set ccolor 2'
'set cthick 10'
'set cmark 0'
'd ave(atl.2,time=jan1988,time=jan2007)*1e-9 + atladj'
*
label(0.0,1.3,"Arctic-Atlantic FWT (1988-2007)",30,0,0.12)
label(-110,0.0,"[10^9 kg/s]",4,90,0.10)
label(0.0,-1.35,"latitude",30,0,0.12)
*
splt(0.0,0,180)
*
obswitherr( 59.0,-0.591, 0.235, 4, 0.08)
obswitherr( 53.0,-0.385, 0.119, 4, 0.08)
obswitherr( 45.0,-0.391, 0.126, 4, 0.08)
obswitherr( 36.0,-0.415, 0.066, 4, 0.08)
obswitherr( 24.0,-0.357, 0.139, 4, 0.08)
obswitherr(-16.0,-0.253, 0.052, 4, 0.08)
obswitherr(-24.0, 0.096, 0.030, 4, 0.08)
obswitherr(-32.0, 0.212, 0.036, 4, 0.08)
*
obswitherr( 45.0,-0.25, 0.0, 3, 0.10)
obswitherr( 35.0,-0.37, 0.0, 3, 0.10)
obswitherr( 24.0,-0.03, 0.0, 3, 0.10)
obswitherr( 11.0, 0.12, 0.0, 3, 0.10)
obswitherr(-19.0,-0.10, 0.0, 3, 0.10)
obswitherr(-30.0, 0.24, 0.0, 3, 0.10)
*
obswitherr( 26.5,-0.37, 0.2, 2, 0.10)
*---------------------------------------------------------------
*
'set line 3 1 5'
'run drawline.gs 10.0 1.05 35.0 1.05'
'set line 1 1 1'
'set string 1 l 3'
'set strsiz 0.10'
'run drawstring.gs 40.0 1.05 CORE'
'set string 1 c 3'
*
'set line 2 1 5'
'run drawline.gs 10.0 0.95 35.0 0.95'
'set line 1 1 1'
'set string 1 l 3'
'set strsiz 0.10'
'run drawstring.gs 40.0 0.95 JRA55-do'
'set string 1 c 3'
*---------------------------------------------------------------
'close 3'
'close 2'
'close 1'
*--------------------------------------------------------------
'enable print water.gm'
'print'
'disable print'
'!gxeps -c -i water.gm -o mwt_comp_core_ly2009_88_07_t08.eps'
'!rm -f water.gm'
*==============================================================
function bottom(fname,i,max)
 result=read(fname)
  pos=sublin(result,2)
 'query w2xy ' subwrd(pos,i) ' ' subwrd(pos,5)
 x = subwrd(result,3)
 y = subwrd(result,6)
 'query w2xy ' subwrd(pos,2) ' ' max
 clip= subwrd(result,6)
while(1)
  result=read(fname)
  ret=sublin(result,1)
  if(ret=2);break;endif;
  pos=sublin(result,2)
 'query w2xy ' subwrd(pos,i) ' ' subwrd(pos,5)
 x1 = subwrd(result,3)
 y1 = subwrd(result,6)
 if(y<clip | y1<clip)
   if(y>clip)
     x2=(x1-x)*(clip-y)/(y1-y)+x
     'draw line ' x ' ' y ' ' x2 ' ' clip
   endif
   if(y1>clip)
     x2=(x1-x)*(clip-y)/(y1-y)+x
     'draw line ' x1 ' ' y1 ' ' x2 ' ' clip
   endif
 else
   'draw line ' x ' ' y ' ' x1 ' ' y1
 endif
 x = x1
 y = y1
endwhile
ret=close(fname)
*------------------------------------------
function shadeset(type)
*  Temperature
 'set rgb 40   0   0   0'
 'set rgb 41  40  40  40'
*      -  1.2
 'set rgb 42  60  60  60'
*  1.2 -  2.0
 'set rgb 43  80  80  80'
*  2.0 -  5.0
 'set rgb 44 100 100 100'
*  5.0 - 15.0
 'set rgb 45 120 120 120'
* 15.0 - 20.0
 'set rgb 46 140 140 140'
* 20.0 - 25.0
 'set rgb 47 160 160 160'
* 25.0 - 
 'set rbcols 41 42 43 44 45 46 47'
 if(type='anom')
 'set rbcols 0 41'
 'set clevs 0.0 '
else
 if(type='delta')
 'set rbcols 41 42 44  46 47 '
 'set clevs 1.6 1.8 2.2 2.4 '
else
 if(type='none')
 'set rbcols 0 41 '
 'set clevs 999.0 '
 else
* 'set clevs 1.2 2.0 5.0 15.0 20.0 25.0'
 'set rbcols 40 42'
 'set clevs 28'
  endif
 endif
endif
*------------------------------------------
function shade2(type)
*  Temperature
 'set rgb 40   0   0   0'
 'set rgb 41  40  40  40'
*      -  1.2
 'set rgb 42  60  60  60'
*  1.2 -  2.0
 'set rgb 43  80  80  80'
*  2.0 -  5.0
 'set rgb 44 100 100 100'
*  5.0 - 15.0
 'set rgb 45 120 120 120'
* 15.0 - 20.0
 'set rgb 46 140 140 140'
* 20.0 - 25.0
 'set rgb 47 160 160 160'
* 25.0 - 
 'set rbcols 41 42 43 44 45 46 47'
 if(type='anom')
 'set rbcols 41 0'
 'set clevs 0.0 '
else
 if(type='delta')
 'set rbcols 41 42 44  46 47 '
 'set clevs 1.6 1.8 2.2 2.4 '
 else
* 'set clevs 1.2 2.0 5.0 15.0 20.0 25.0'
 'set rbcols 40 42'
 'set clevs 28'
 endif
endif
*-----------------------------------------
function label2(x,y,lab,len,angle)
'set strsiz 0.12 0.15' 
'set string 1 c 3 ' angle
w = 0.10*len/2 + 0.01
h = 0.11/2 + 0.02
'query w2xy ' x ' ' y
 x = subwrd(result,3)
 y = subwrd(result,6)
'set line 0'
'draw recf '%(x-w)%' '%(y-h)%' '%(x+w)%' '%(y+h)
'draw string ' x ' ' y ' ' lab
'set line 1'
'set string 1 c 3 0' 
*------------------------------------------
function tick(fname,i)
while(1)
  result=read(fname)
  ret=sublin(result,1)
  if(ret=2);break;endif;
  pos=sublin(result,2)
 'query w2xy ' subwrd(pos,i) ' 0 '
  x = subwrd(result,3)
  y = subwrd(result,6)
 'draw line ' x ' ' y+0.02 ' ' x ' ' y+0.12
endwhile
ret=close(fname)
*--------------------------------------------
function scale2(min,max)
  'set strsiz 0.12'
  'set string 1 c'
  'query w2xy ' min ' -60 '
  x = subwrd(result,3)
  y = subwrd(result,6)
'draw string ' x ' ' y+0.1 ' ' min 'N'
  'query w2xy ' max ' -60 '
  x1 = subwrd(result,3)
  y1 = subwrd(result,6)
'draw string ' x1 ' ' y1+0.1 ' ' max 'N'
 'draw line ' x ' ' y ' ' x1 ' ' y1
  i=min
  while(i<=max)
    'query w2xy ' i ' -60 '
    x = subwrd(result,3)
    y = subwrd(result,6)
   'draw line ' x ' ' y-0.08 ' ' x ' ' y
   if (i=5 | i=10 | i=15 | i=20 | i=25 | i=30 )
     'draw string ' x ' ' y+0.1 ' ' i
   endif
  i = i + 1
  endwhile
*-----------------------------------------
function label3(x,y,lab,len,angle)
'set strsiz 0.07 0.10' 
'set string 1 c 3 ' angle
w = 0.10*len/2 + 0.01
h = 0.11/2 + 0.02
'query w2xy ' x ' ' y
 x = subwrd(result,3)
 y = subwrd(result,6)
'set line 0'
'draw recf '%(x-w)%' '%(y-h)%' '%(x+w)%' '%(y+h)
'draw string ' x ' ' y ' ' lab
'set line 1'
'set string 1 c 3 0' 
*------------------------------------------
function tick2(fname,i,tval)
while(1)
  result=read(fname)
  ret=sublin(result,1)
  if(ret=2);break;endif;
  pos=sublin(result,2)
 'query w2xy ' subwrd(pos,i) ' ' tval
  x = subwrd(result,3)
  y = subwrd(result,6)
 'draw line ' x ' ' y+0.02 ' ' x ' ' y+0.12
endwhile
ret=close(fname)
*--------------------------------------------------------
function ytick(min,max,int,pos)
i=min
while(i<=max)
 'query w2xy ' pos ' ' i
    x = subwrd(result,3)
    y = subwrd(result,6)
 'draw line ' x-0.08 ' ' y ' ' x ' ' y
  i=i+int
endwhile
*-----------------------------------------
function axislab(x,y,lab,len,angle)
'set strsiz 0.09 0.12' 
'set string 1 c 3 ' angle
w = 0.10*len/2 + 0.01
h = 0.11/2 + 0.02
'query w2xy ' x ' ' y
 x = subwrd(result,3)
 y = subwrd(result,6)
'set line 0'
'draw recf '%(x-w)%' '%(y-h)%' '%(x+w)%' '%(y+h)
'draw string ' x ' ' y ' ' lab
'set line 1'
'set string 1 c 3 0'
*--------------------------------------------------
function dlabel(fname)
while(1)
 result=read(fname)
 ret=sublin(result,1)
 if(ret!=0);break;endif;
 pos=sublin(result,2)
 drwlbl(pos)
endwhile
if(ret!=1)
 ret=close(fname)
endif
*--------------------------------------------------
function drwlbl(line)
 lat=subwrd(line,1)
 comment=substr(lat,1,1)
 if(comment='#');return;endif
* say line
 dep=subwrd(line,2)
 lab=subwrd(line,3)
 len=subwrd(line,4)
 angle=subwrd(line,5)
 size=subwrd(line,6)
 label(lat,dep,lab,len,angle,size)
*-----------------------------------------
function label(x,y,lab,len,angle,size,justify)
if(size='' | size='size');size=0.10;endif;
if(justify='' | justify='justify');justify='c';endif;
size2=size*1.2
'set strsiz ' size ' ' size2 
'set string 1 ' justify ' 3 ' angle
w = size*len/2
h = (size2*1.4)/2 
'query w2xy ' x ' ' y
 x = subwrd(result,3)
 y = subwrd(result,6)
'set line 0'
if(angle=0)
 'draw recf '%(x-w)%' '%(y-h*1.2)%' '%(x+w)%' '%(y+h)
endif
'draw string ' x ' ' y ' ' lab
'set line 1'
'set string 1 c 3 0'
*--------------------------------------------
function splt(pos,min,max)
  'set line 1 1 4'
  'query gr2xy ' min ' ' pos
  x1 = subwrd(result,3)
  y1 = subwrd(result,6)
  'query gr2xy ' max ' ' pos
  x2 = subwrd(result,3)
  y2 = subwrd(result,6)
'draw line ' x1 ' ' y1 ' ' x2 ' ' y2
*--------------------------------------------
function splt2(pos,min,max)
  'set line 1 1 4'
  'query gr2xy ' pos ' ' min
  x1 = subwrd(result,3)
  y1 = subwrd(result,6)
  'query gr2xy ' pos ' ' max
  x2 = subwrd(result,3)
  y2 = subwrd(result,6)
'draw line ' x1 ' ' y1 ' ' x2 ' ' y2
*--------------------------------------------
function obswitherr(posx,posy,erry,mrk,msiz)
  'set line 1 1 4'
  'query w2xy ' posx ' ' posy+erry
  x1 = subwrd(result,3)
  y1 = subwrd(result,6)
  'query w2xy ' posx ' ' posy-erry
  x2 = subwrd(result,3)
  y2 = subwrd(result,6)
'draw line ' x1 ' ' y1 ' ' x2 ' ' y2
  'query w2xy ' posx ' ' posy
  x1 = subwrd(result,3)
  y1 = subwrd(result,6)
'draw mark ' mrk ' ' x1 ' ' y1 ' ' msiz
