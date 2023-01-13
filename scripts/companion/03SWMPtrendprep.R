#add a column for year and a column for month to help with sorting and later monthly trend analysis

#BA
bawq_qaqc <- mutate(bawq_qaqc, year=lubridate::year(datetimestamp))
bawq_qaqc <- mutate(bawq_qaqc, month=lubridate::month(datetimestamp))


#BL

blwq_qaqc <- mutate(blwq_qaqc, year=lubridate::year(datetimestamp))
blwq_qaqc <- mutate(blwq_qaqc, month=lubridate::month(datetimestamp))


#OL

olwq_qaqc <- mutate(olwq_qaqc, year=lubridate::year(datetimestamp))
olwq_qaqc <- mutate(olwq_qaqc, month=lubridate::month(datetimestamp))


#PO

powq_qaqc <- mutate(powq_qaqc, year=lubridate::year(datetimestamp))
powq_qaqc <- mutate(powq_qaqc, month=lubridate::month(datetimestamp))