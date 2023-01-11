##All libraries used in training
library(SWMPr)
library(SWMPrExtension)
library(lubridate)
library(ggplot2)
library(dplyr)



### FEED IN WQ DATA ##### data downloaded from AQS ZIP as of 1/30/2020 data 2012-2019 then 2021 added 12/27/2021
Data_Source <- "C:/Users/hramage/OneDrive - UW-Madison/LSNERR_SWMP/R/2021 Analysis/2021 Trend Analysis/data"

##Feed in our BA WQ data
bawq <- import_local(Data_Source, "lksbawq", trace = TRUE)

##Feed in our BL WQ data
blwq <- import_local(Data_Source, "lksblwq", trace = TRUE)

##Feed in our OL WQ data
olwq <- import_local(Data_Source, "lksolwq", trace = TRUE)

##Feed in our PO WQ data
powq <- import_local(Data_Source, "lkspowq", trace = TRUE)

### qaqc keep all flags then REMOVE Columns and rows with all NAs### for abstract to see how many datapoints we have including all flags
bawq_qaqcrc <- qaqc(bawq, qaqc_keep=c(-5,-4,-3,-2,-1,0,1,2,3,4,5))
blwq_qaqcrc <- qaqc(blwq, qaqc_keep=c(-5,-4,-3,-2,-1,0,1,2,3,4,5))

olwq_qaqcrc <- qaqc(olwq, qaqc_keep=c(-5,-4,-3,-2,-1,0,1,2,3,4,5))

powq_qaqcrc <- qaqc(powq, qaqc_keep=c(-5,-4,-3,-2,-1,0,1,2,3,4,5))


bawq_rc <- subset(bawq_qaqcrc, rem_cols=TRUE, rem_rows = TRUE)
blwq_rc <- subset(blwq_qaqcrc, rem_cols=TRUE, rem_rows = TRUE)
olwq_rc <- subset(olwq_qaqcrc, rem_cols=TRUE, rem_rows = TRUE)
powq_rc <- subset(powq_qaqcrc, rem_cols=TRUE, rem_rows = TRUE)

#combine the number of rows from each dataset (site) to get the total numbere of data points
Number<-(nrow(bawq_rc)*ncol(bawq_rc))+(nrow(blwq_rc)*ncol(blwq_rc))+(nrow(olwq_rc)*ncol(olwq_rc))+(nrow(powq_rc)*ncol(powq_rc))
Number

### QAQC our data keeping flags:   ######
bawq_qaqc <- qaqc(bawq, qaqc_keep=c(0,1,2,3,4,5))

blwq_qaqc <- qaqc(blwq, qaqc_keep=c(0,1,2,3,4,5))

olwq_qaqc <- qaqc(olwq, qaqc_keep=c(0,1,2,3,4,5))

powq_qaqc <- qaqc(powq, qaqc_keep=c(0,1,2,3,4,5))


#checking what these outputs are
names(bawq_qaqc)

### REMOVE Columns and rows with all NAs, which is level and clevel and chlfluor for some sites
### rows that are removed will be ones that have all NAS so chunks of time that have no data (winter and bad deployments)
bawq_qaqc1 <- subset(bawq_qaqc, rem_cols=TRUE, rem_rows = TRUE)
blwq_qaqc1 <- subset(blwq_qaqc, rem_cols=TRUE, rem_rows = TRUE)
olwq_qaqc1 <- subset(olwq_qaqc, rem_cols=TRUE, rem_rows = TRUE)
powq_qaqc1 <- subset(powq_qaqc, rem_cols=TRUE, rem_rows = TRUE)

# check
head(bawq_qaqc1)


##########################################################################################
### All data should be loaded in, qaqc'd, with the proper flags kept at this step #######
##########################################################################################


###### add a column for year and month to help with sorting and later monthly trend analysis

#BA
bawq_qaqc2 <- mutate(bawq_qaqc1, year=lubridate::year(datetimestamp))

bawq_qaqc3 <- mutate(bawq_qaqc2, month=lubridate::month(datetimestamp))
head(bawq_qaqc3)

#BL

blwq_qaqc2 <- mutate(blwq_qaqc1, year=lubridate::year(datetimestamp))

blwq_qaqc3 <- mutate(blwq_qaqc2, month=lubridate::month(datetimestamp))
head(blwq_qaqc3)

#OL

olwq_qaqc2 <- mutate(olwq_qaqc1, year=lubridate::year(datetimestamp))

olwq_qaqc3 <- mutate(olwq_qaqc2, month=lubridate::month(datetimestamp))
head(olwq_qaqc3)

#PO

powq_qaqc2 <- mutate(powq_qaqc1, year=lubridate::year(datetimestamp))

powq_qaqc3 <- mutate(powq_qaqc2, month=lubridate::month(datetimestamp))
head(powq_qaqc3)

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
#data is ready for analyses
load("LKS_WQ_2021 Workspace.RData")


bawq_allparam <-mutate(bawq_done_allparam, year=lubridate::year(datetimestamp))
blwq_allparam <-mutate(blwq_done_allparam, year=lubridate::year(datetimestamp))
olwq_allparam <-mutate(olwq_done_allparam, year=lubridate::year(datetimestamp))
powq_allparam <-mutate(powq_done_allparam, year=lubridate::year(datetimestamp))

#these get carried over to 02_06_LKS_newcodeFORbetterGraphs2021 R code for analysis and plotting
write.csv(bawq_allparam, file = "bawq.csv")
write.csv(blwq_allparam, file = "blwq.csv")
write.csv(olwq_allparam, file = "olwq.csv")
write.csv(powq_allparam, file = "powq.csv")

