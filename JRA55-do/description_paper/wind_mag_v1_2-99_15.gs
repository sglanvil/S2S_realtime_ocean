*------------------------------------------------
'reinit'
*------------------------------------------------
'open wind_mag_tanh_annual_v1_2.1999_2015.ctl'
'open jra55_ocean_mask.ctl'
*
'set vpage 0.00 8.50 0.00 11.00'
'set parea 1.00 8.00 6.50 10.50'
*
'set lon 25 385'
*
'set xlint 30'
'set ylint 20'
'set grid on'
'set mproj scaled'
'set mpdraw off'
*'set mpdset mres'
*'set poli off'
'set map 1 1 1'
'set xlab on'
'set ylab on'
'set xlopts 1 3 0.12'
'set ylopts 1 3 0.12'
*
'set gxout shaded'
*'run colmap.gs odcm3'
*'run clevsreg.gs 0.95 1.24 0.01'
*'run colmap.gs bluered'
*'run clevsreg.gs 0.82 1.18 0.02'
'run colmap.gs factor20'
'set clevs 0.82 0.84 0.86 0.88 0.90 0.92 0.94 0.96 0.98 1.0 1.02 1.04 1.06 1.08 1.10 1.12 1.15 1.20 1.25'
'set grads off'
'd windmag'
*
*'set gxout contour'
*'set ccolor 1'
*'set clab off'
*'set cint 0.05'
*'set cmin 0.8'
*'set cmax 1.2'
*'set cthick 1'
*'set grads off'
*'d wind10mcorr'
*
'set gxout contour'
'set ccolor 1'
'set clab off'
'set cint 0.1'
'set cthick 3'
'set grads off'
'd windmag'
*
'set gxout fgrid'
'set fgvals 0 15'
'd index.2'
*
label(205.0,98.0,"(c) Multiplicative factor for wind speed (1998-present)",30,0,0.15)
'run cbarn2.gs 0.8 0 4.25 6.0 1 2'
*
'close 2'
'close 1'
*----------------------------------------------------
*
*'open wind_mag_tanh_annual.1999_2015.ctl'
*'set vpage 0.00 8.50 0.00 11.00'
*'set parea 1.00 8.00 1.00 5.00'
*
*'set lon 25 385'
*
*'set xlint 30'
*'set ylint 20'
*'set grid on'
*'set mproj scaled'
**'set mpdraw on'
*'set mpdset mres'
*'set poli off'
*'set map 1 1 1'
*'set xlab on'
*'set ylab on'
*'set xlopts 1 3 0.12'
*'set ylopts 1 3 0.12'
**
*'set gxout shaded'
**'run colmap.gs odcm3'
**'run clevsreg.gs 0.95 1.24 0.01'
*'run colmap.gs bluered'
*'set clevs -2.0 -1.75 -1.50 -1.25 -1.00 -0.75 -0.5 -0.2 -0.1 0 0.1 0.2 0.5 0.75 1.0 1.25 1.5 1.75 2.0'
**'set clevs 0.98 0.9825 0.985 0.9875 0.99 0.9925 0.995 0.998 0.999 1.0 1.001 1.002 1.005 1.0075 1.01 1.0125 1.0150 1.0175 1.02'
**'run clevsreg.gs 0.982 1.018 0.002'
**'run clevsreg.gs 0.82 1.18 0.02'
**'run colmap.gs factor20'
**'run clevsreg.gs 0.982 1.018 0.002'
*'set grads off'
*'d (windmag.1/windmag.2-1.0)*100'
**
**'set gxout contour'
**'set ccolor 1'
**'set clab off'
**'set cint 0.05'
**'set cmin 0.8'
**'set cmax 1.2'
**'set cthick 1'
**'set grads off'
**'d wind10mcorr'
**
*'set gxout contour'
*'set ccolor 1'
*'set clab on'
*'set cint 0.5'
*'set cthick 3'
*'set grads off'
*'d (windmag.1/windmag.2-1.0)*100'
**
*label(205.0,98.0,"Multiplicative factor change (%) relative to v1.1",30,0,0.15)
*'run cbarn2.gs 0.8 0 4.25 0.5 0 3'
**
*'close 2'
*'close 1'
*----------------------------------------------------
'enable print wind_mag.gm'
'print'
'disable print'
'!gxeps -c -i wind_mag.gm -o wind_mag_v1_2-99_15.eps'
'!rm wind_mag.gm'
*====================================================
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
