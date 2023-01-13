#removes months of data that do not have enough data points to be used in monthly aggregation analyses later. 
#A month must have 3 weeks worth of data to keep for monthly trend analysis

bawq_allparam<-bawq_qaqc %>%
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


blwq_allparam<- 
  blwq_qaqc%>%
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


olwq_allparam<- 
  olwq_qaqc%>%
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

powq_allparam<- 
  powq_qaqc%>%
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