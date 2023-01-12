#import SWMP data from data files saved in the project

### FEED IN WQ DATA ##### data downloaded from AQS ZIP as of 1/30/2020 data 2012-2019 then 2021 added 12/27/2021
Data_Source <- "C:/Users/hramage/OneDrive - UW-Madison/LSNERR_SWMP/R/2021-SWMP-Report/data"

##Feed in our BA WQ data
bawq <- import_local(Data_Source, "lksbawq", trace = TRUE)

##Feed in our BL WQ data
blwq <- import_local(Data_Source, "lksblwq", trace = TRUE)

##Feed in our OL WQ data
olwq <- import_local(Data_Source, "lksolwq", trace = TRUE)

##Feed in our PO WQ data
powq <- import_local(Data_Source, "lkspowq", trace = TRUE)