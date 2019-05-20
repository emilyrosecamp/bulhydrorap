# Convert raw zip file to tidy RDA object
# create_bulhydrorap

setwd("C:/Users/isabelle/Documents/Github/bulhydrorap/DATA-RAW")
unzip("C:/Users/isabelle/Documents/Github/bulhydrorap/DATA-RAW/tousmois.zip")

filename<-dir(pattern="*.csv")


# temporary read table: should be corrected so that nrows is dynamic
bulhydro<-read.csv(filename,fill=TRUE,skip=9,nrows = 103,header=T,sep = ";",dec=".")




#minimal tidy dataset
flow<-bulhydro[,monthID]
quality<-bulhydro[,monthID+1]
year<-bulhydro$Année


#Save to RDA r data file
devtools::use_data(bulhydro,overwrite = TRUE)


# Clear workspace
# rm(filename)
# rm(bulhydro)
