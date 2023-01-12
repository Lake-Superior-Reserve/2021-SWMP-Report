# QAQC SWMP data keeping flags except <-3> rejected
### REMOVE Columns and rows with all NAs, which is level and clevel and chlfluor for some sites
### rows that are removed will be ones that have all NAS so chunks of time that have no data (winter and bad deployments)
bawq_qaqc<- subset(qaqc(bawq, qaqc_keep=c(0,1,2,3,4,5)), rem_cols=TRUE, rem_rows = TRUE)
blwq_qaqc<- subset(qaqc(blwq, qaqc_keep=c(0,1,2,3,4,5)), rem_cols=TRUE, rem_rows = TRUE)
olwq_qaqc<- subset(qaqc(olwq, qaqc_keep=c(0,1,2,3,4,5)), rem_cols=TRUE, rem_rows = TRUE)
powq_qaqc<- subset(qaqc(powq, qaqc_keep=c(0,1,2,3,4,5)), rem_cols=TRUE, rem_rows = TRUE)


