#Script is all for SWMP data preparation - load packages, import data, QAQC data, and add some organizational columns
#revised by H.R. 1/12/2023

#Set working directory to project directory

#checks to see if a package is installed, if not it attempts to install the package and then loads it
source("scripts/companion/00SWMPlib.R")

#load SWMP data, 4 dataframes, 1 for each station
#you need to change the data source string for your local project first
source("scripts/companion/01SWMPimport.R")

#take a look at data structure
summary(bawq)

#for fun if you want, calculate the total amount of water quality data collected in the SWMP program to date
source("scripts/companion/forfunDataCalc.R")

#removes bad data and columns that have no data
source("scripts/companion/02SWMPqaqc.R")

##########################################################################################
### All data should be loaded in, qaqc'd, with the proper flags kept at this step #######
##########################################################################################


#write out data as csvs for use in other projects if you like
write.csv(bawq_qaqc, file = "outputs/bawq_qaqc.csv")
write.csv(blwq_qaqc, file = "outputs/blwq_qaqc.csv")
write.csv(olwq_qaqc, file = "outputs/olwq_qaqc.csv")
write.csv(powq_qaqc, file = "outputs/powq_qaqc.csv")
#save the working directory for later so that you don't have to rerun
save.image(file="011323_1335.RData")


#adding a comment here so we can see a push and a commit on gitHUb





