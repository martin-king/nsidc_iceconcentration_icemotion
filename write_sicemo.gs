function write

'reset'

'set x 1 360'
'set y 1 179'

tmax=38
t=1
'set fwrite nsidc_sicemo_dec_1979_2016_v03_sicgrid.grd'
'set gxout fwrite'

while (t<=tmax)

 'set t 't

 'd sidx/10.'
 'd sidy/10.'

 t=t+1

endwhile

'disable fwrite'

return
