#Script is all for SWMP data preparation - load packages, import data, QAQC data, and add some organizational columns
#revised by H.R. 1/12/2023

#Set working directory to project directory

#checks to see if a package is installed, if not it attempts to install the package and then loads it
source("scripts/companion/00SWMPlib.R")

#load SWMP data, 4 dataframes, 1 for each station
source("scripts/companion/01SWMPimport.R")

#for fun if you want, calculate the total amount of water quality data collected in the SWMP program to date
source("scripts/companion/forfunDataCalc.R")

#removes bad data and columns that have no data
source("scripts/companion/02SWMPqaqc.R")

##########################################################################################
### All data should be loaded in, qaqc'd, with the proper flags kept at this step #######
##########################################################################################

#add a column for year and month to help with sorting and later monthly trend analysis

#BA
bawq_qaqc2 <- mutate(bawq_qaqc1, year=lubridate::year(datetimestamp))

bawq_qaqc3 <- mutate(bawq_qaqc2, month=lubridate::month(datetimestamp))


#BL

blwq_qaqc2 <- mutate(blwq_qaqc1, year=lubridate::year(datetimestamp))

blwq_qaqc3 <- mutate(blwq_qaqc2, month=lubridate::month(datetimestamp))


#OL

olwq_qaqc2 <- mutate(olwq_qaqc1, year=lubridate::year(datetimestamp))

olwq_qaqc3 <- mutate(olwq_qaqc2, month=lubridate::month(datetimestamp))


#PO

powq_qaqc2 <- mutate(powq_qaqc1, year=lubridate::year(datetimestamp))

powq_qaqc3 <- mutate(powq_qaqc2, month=lubridate::month(datetimestamp))


##removes months of data that do not have enough data points to be used in monthly aggregation analyses later. Must have 3 weeks worth of data


bawq_done_allparam<- 
  bawq_qaqc3%>%
  filter(!grepl('2015-03', datetimestamp))%>%
  filter(!grepl('2016-03', datetimestamp))%>%
  filter(!grepl('2017-03', datetimestamp))%>%
  filter(!grepl('2019-03', datetimestamp))%>%
  filter(!grepl('2013-04', datetimestamp))%>%
  filter(!grepl('2014-04', datetimestamp))%>%
  filter(!grepl('2018-04', datetimestamp))%>%
  filter(!grepl('2012-06', datetimestamp))%>%
  filter(!grepl('2012-07', datetimestamp))%>%
  filter(!grepl('2012-09', datetimestamp))%>%
  filter(!grepl('2016-09', datetimestamp))%>%
  filter(!grepl('2012-10', datetimestamp))%>%
  filter(!grepl('2014-11', datetimestamp))%>%
  filter(!grepl('2015-11', datetimestamp))%>%
  filter(!grepl('2017-11', datetimestamp))%>%
  filter(!grepl('2018-11', datetimestamp))%>%
  filter(!grepl('2012-12', datetimestamp))%>%
  filter(!grepl('2016-12', datetimestamp))%>%
  filter(!grepl('2020-11', datetimestamp))%>%
  filter(!grepl('2021-03', datetimestamp))



blwq_done_allparam<- 
  blwq_qaqc3%>%
  filter(!grepl('2015-04', datetimestamp))%>%
  filter(!grepl('2016-04', datetimestamp))%>%
  filter(!grepl('2017-04', datetimestamp))%>%
  filter(!grepl('2013-05', datetimestamp))%>%
  filter(!grepl('2019-05', datetimestamp))%>%
  filter(!grepl('2018-06', datetimestamp))%>%
  filter(!grepl('2012-09', datetimestamp))%>%
  filter(!grepl('2012-10', datetimestamp))%>%
  filter(!grepl('2019-10', datetimestamp))%>%
  filter(!grepl('2013-11', datetimestamp))%>%
  filter(!grepl('2014-11', datetimestamp))%>%
  filter(!grepl('2015-11', datetimestamp))%>%
  filter(!grepl('2016-11', datetimestamp))%>%
  filter(!grepl('2020-04', datetimestamp))%>%
  filter(!grepl('2020-09', datetimestamp))%>%
  filter(!grepl('2020-11', datetimestamp))%>%
  filter(!grepl('2021-06', datetimestamp))%>%
  filter(!grepl('2021-11', datetimestamp))


olwq_done_allparam<- 
  olwq_qaqc3%>%
  filter(!grepl('2018-02', datetimestamp))%>%
  filter(!grepl('2016-03', datetimestamp))%>%
  filter(!grepl('2015-04', datetimestamp))%>%
  filter(!grepl('2017-04', datetimestamp))%>%
  filter(!grepl('2019-04', datetimestamp))%>%
  filter(!grepl('2013-05', datetimestamp))%>%
  filter(!grepl('2014-05', datetimestamp))%>%
  filter(!grepl('2015-07', datetimestamp))%>%
  filter(!grepl('2012-08', datetimestamp))%>%
  filter(!grepl('2012-09', datetimestamp))%>%
  filter(!grepl('2016-09', datetimestamp))%>%
  filter(!grepl('2019-09', datetimestamp))%>%
  filter(!grepl('2012-10', datetimestamp))%>%
  filter(!grepl('2016-10', datetimestamp))%>%
  filter(!grepl('2012-11', datetimestamp))%>%
  filter(!grepl('2014-11', datetimestamp))%>%
  filter(!grepl('2015-11', datetimestamp))%>%
  filter(!grepl('2020-04', datetimestamp))%>%
  filter(!grepl('2020-11', datetimestamp))%>%
  filter(!grepl('2021-07', datetimestamp))%>%
  filter(!grepl('2021-11', datetimestamp))

powq_done_allparam<- 
  powq_qaqc3%>%
  filter(!grepl('2014-04', datetimestamp))%>%
  filter(!grepl('2015-04', datetimestamp))%>%
  filter(!grepl('2016-04', datetimestamp))%>%
  filter(!grepl('2018-04', datetimestamp))%>%
  filter(!grepl('2017-05', datetimestamp))%>%
  filter(!grepl('2019-05', datetimestamp))%>%
  filter(!grepl('2015-08', datetimestamp))%>%
  filter(!grepl('2013-09', datetimestamp))%>%
  filter(!grepl('2019-10', datetimestamp))%>%
  filter(!grepl('2013-11', datetimestamp))%>%
  filter(!grepl('2014-11', datetimestamp))%>%
  filter(!grepl('2015-11', datetimestamp))%>%
  filter(!grepl('2017-11', datetimestamp))%>%
  filter(!grepl('2021-11', datetimestamp))


#save the global environment up until this point so that you do not have to run the above code again for 2021

bawq_allparam <-mutate(bawq_done_allparam, year=lubridate::year(datetimestamp))
blwq_allparam <-mutate(blwq_done_allparam, year=lubridate::year(datetimestamp))
olwq_allparam <-mutate(olwq_done_allparam, year=lubridate::year(datetimestamp))
powq_allparam <-mutate(powq_done_allparam, year=lubridate::year(datetimestamp))


