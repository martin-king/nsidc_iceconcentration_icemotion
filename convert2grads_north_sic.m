clear all;
close all;

%settings for writing out data
fid_out=fopen('nsidc_sic_north_1979_2017_landundef.grd','w','ieee-be');

for iyr=1979:2017
    totmn=12;
%    if iyr==2015
%        totmn=5;
%    end
    for imn=1:totmn
       if imn < 10
           imnstr=strcat(num2str(0),num2str(imn));
       else
           imnstr=num2str(imn);
       end
       %read in data
       fid_in=fopen(strcat('nt_',num2str(iyr),imnstr,'.bin'),'r');
       data=fread(fid_in,inf,'uint8');
       fclose(fid_in);

       %first 300 points are not 'header'
       data(1:300)=[];
       %rescale to fraction (in 0 to 1).
       ipole=find(data==251);
       iunused=find(data==252);
       icoastlines=find(data==253);
       iland=find(data==254);
       imissing=find(data==255);
       data=data./250;
       data(iland)=-9.99E8; data(ipole)=-9.99E8; data(iunused)=0.; data(icoastlines)=0.;
       data(imissing)=0.;
       %for sea ice cover only
       %ii=find(data < 0.15);
       %data(ii)=0.;
       %i=find(data > 0.15);
       %data(i)=1.;
       %
       %this part I obtained by trial and error
       data=reshape(data,304,448);
       data=fliplr(data);
       data=reshape(data,1,304*448);
       data=[data 0 0];

       %write out data
       count=fwrite(fid_out,data,'float32');
       %clear data;
    end
end

fclose(fid_out);
