# Convert raw zip file to tidy RDA object
# create_bulhydrorap

setwd("C:/Users/isabelle/Documents/Github/bulhydrorap/DATA-RAW")
unzip("C:/Users/isabelle/Documents/Github/bulhydrorap/DATA-RAW/tousmois.zip")

filename<-dir(pattern="*.csv")


# temporary read table: should be corrected so that nrows is dynamic
bulhydro<-read.csv(filename,fill=TRUE,skip=9,nrows = 103,header=T,sep = ";",dec=".")


#Select data for current month
temp<-months.Date(Sys.Date())
month<-paste(toupper(substring(temp,1,1)),substring(temp,2),".",sep="")

#Locate column ID number with flow data for current month
#months are coded with or without periods, ex: Avril, Mai, Sept., Oct.
monthID<-match(month,paste(names(bulhydro),".",sep=""))
if(is.na(monthID)) {
  monthID<-monthID<-match(month,names(bulhydro))
  if(is.na(monthID)){
    #ERROR TO BE FIXED
  }
}


#minimal tidy dataset
flow<-bulhydro[,monthID]
quality<-bulhydro[,monthID+1]
year<-bulhydro$Année


#Save to RDA r data file
usethis::use_data(bulhydro,overwrite = TRUE)


# Clear workspace
# rm(filename)
# rm(bulhydro)
