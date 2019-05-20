#' @title Calcul hydrolicite pour le mois en cours
#' @description Pour les donnees banque hydro d'une station, calculer le taux hydrolicite pour le mois actuek
#' @details Depuis le dernier fichier CSV pour la station, extraire les donnees de debit puis calculer
#' la moyenne historique.
#'  # Goal: compute the mean debit for the current month using historic data (Qmoy).
# Compute the hydrolicite value (H) for the current month, using current month debit (Qactu).
# H = 1-(Qactu/Qmoy)

#' @param x Input table of \code{debit_mensuel} class
#' @return A vector containing Qactu,Qmoy,H,N
#' @export


hydrolicite <- function(x) {
  # Goal: compute the mean debit for the current month using historic data (Qmoy).
  # Compute the hydrolicite value (H) for the current month, using current month debit (Qactu).
  # H = 1-(Qactu/Qmoy)

  out <- tryCatch(
    expr = {

  #####
  df<-x$df
  deb<-df$Débit


  # Check that debit data is numeric
  stopifnot(is.numeric(deb))

  #Count total rows containing data
  N<-length(deb)-sum(is.na(deb))

  #Compute the mean
  Qmoy<-mean(deb,na.rm=TRUE)

  #Locate the last non -NA value
  Qactu<-deb[max(which(!is.na(deb)))]

  H<-round(100*(1-(Qactu/Qmoy)))

  output<-c(Qactu,Qmoy,H,N)

  return(output)
}
  #####
  ,warning = function() {

    w <- warnings()
    warning('Warning produced running figure3.1():', w)

  },
  error = function(e)  {

    stop('Error produced running figure3.1():', e)

  },
  finally = {}
  )
    }


