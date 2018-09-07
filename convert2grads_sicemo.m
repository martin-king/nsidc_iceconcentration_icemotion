clear all;
close all;

%settings for writing out data
fid_out=fopen('nsidc_seaicemotion_north_dec_1979_2016_v03.grd','w','ieee-be');

for iyr=1979:2016
    for imn=12:12
       if imn < 10
           imnstr=strcat(num2str(0),num2str(imn));
       else
           imnstr=num2str(imn);
       end
       %read in data
       fid_in=fopen(strcat('data.dir/',num2str(iyr),'/','icemotion.grid.month.',num2str(iyr),'.',imnstr,'.n.v3.bin'),'r');
       data=fread(fid_in,inf,'int16');
       fclose(fid_in);
       data=reshape(data,3,361,361);

       datax=squeeze(data(1,:,:));
       datay=squeeze(data(2,:,:));
       vectn=squeeze(data(3,:,:));

       datax=fliplr(datax);
       datax=reshape(datax,1,361*361);
       datay=fliplr(datay);
       datay=reshape(datay,1,361*361);
       vectn=fliplr(vectn);
       vectn=reshape(vectn,1,361*361);
       %i=find(datax==0 & datay==0);
       j=find(vectn == 0);

       %datax(i)=-9.99e8;
       datax(j)=-9.99e8;
       datax=[datax 0 0];
       count=fwrite(fid_out,datax,'float32');


       %datay(i)=-9.99e8;
       datay(j)=-9.99e8;
       datay=[datay 0 0];
       count=fwrite(fid_out,datay,'float32');
    end
end



fclose(fid_out);
