#' @title Extraction tableau des debits
#' @description Pour les donnees banque hydro d'une station, extraire données historiques de debits mensuel
#' @details Depuis le dernier fichier CSV pour la station, extraire les donnees de debit

#' @param x Input table of \code{debit_mensuel} class
#' @return A data frame
#' @export

debit_mensuel<-function(x){
#----------------------------------------------------#
# Faire de controles qualité sur la table de donnees
#----------------------------------------------------#
  #   if(is.data.frame(x)) {
  #   print("Format donnees OK")
  # } else {
  #   print("Probleme de format de donnees")
  # }
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
year<-1916:2018
final<-data.frame(year,flow,quality)
colnames(final)<-c("Annee","Debit","Qualite")

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

