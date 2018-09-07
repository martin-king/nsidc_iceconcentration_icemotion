# nsidc_iceconcentration_icemotion

1. To download data, do something like the following in the data folder:

wget --http-user= --http-password= --load-cookies ~/.urs_cookies --save-cookies ~/.urs_cookies --keep-session-cookies --no-check-certificate --auth-no-challenge=on -r -l 1 --reject "index.html*" -np -nH --cut-dirs 7 https://daacdata.apps.nsidc.org/pub/DATASETS/nsidc0116_icemotion_vectors_v3/data/north/means/2016/
