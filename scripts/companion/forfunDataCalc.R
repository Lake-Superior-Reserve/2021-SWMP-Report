#For fun, calculate the total amount of water quality data collect in the SWMP program to date
#qaqc_keep specifies all flags should be kept
#Subset is used to remove columns and rows with all NAa 
bawq_rc <- subset(qaqc(bawq, qaqc_keep=c(-5,-4,-3,-2,-1,0,1,2,3,4,5)),rem_cols=TRUE, rem_rows = TRUE)
blwq_rc <- subset(qaqc(blwq, qaqc_keep=c(-5,-4,-3,-2,-1,0,1,2,3,4,5)),rem_cols=TRUE, rem_rows = TRUE)
olwq_rc <- subset(qaqc(olwq, qaqc_keep=c(-5,-4,-3,-2,-1,0,1,2,3,4,5)),rem_cols=TRUE, rem_rows = TRUE)
powq_rc <- subset(qaqc(powq, qaqc_keep=c(-5,-4,-3,-2,-1,0,1,2,3,4,5)),rem_cols=TRUE, rem_rows = TRUE)

#count datapoints in a dataframe function

countDATA<- function (x) {
  count(x)*ncol(x)}

#add up all datapoints
DataCount2021<-countDATA(bawq_rc)+countDATA(blwq_rc)+countDATA(olwq_rc)+countDATA(powq_rc)



