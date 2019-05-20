
debit_mensuel<-function(x){
#----------------------------------------------------#
# Faire de controles qualité sur la table de donnees
#----------------------------------------------------#
    if(is.data.frame(x)) {
    print("Format donnees OK")
  } else {
    print("Probleme de format de donnees")
  }
#----------------------------------------------------#
# Retenir que les donnees necessaires pour le bulletin
#----------------------------------------------------#

#Select data for current month
temp<-months.Date(Sys.Date())
month<-paste(toupper(substring(temp,1,1)),substring(temp,2),".",sep="")

#Locate column ID number with flow data for current month
#months are coded with or without periods, ex: Avril, Mai, Sept., Oct.
monthID<-match(month,paste(names(x),".",sep=""))
if(is.na(monthID)) {
  monthID<-monthID<-match(month,names(x))
  if(is.na(monthID)){
    #ERROR TO BE FIXED
  }
}

#minimal tidy dataset
flow<-x[,monthID]
quality<-x[,monthID+1]
year<-x$Année
final<-data.frame(year,flow,quality)
colnames(final)<-c("Année","Débit","Qualité")

#----------------------------------------------------#
# Creer la classe debit_mensuel
#----------------------------------------------------#


structure(
  list(
    df=final,
    colnames=colnames(final)
    ),
    class="debit_mensuel"
  )
}
#----------------------------------------------------#

