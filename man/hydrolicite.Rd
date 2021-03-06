% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hydrolicite.R
\name{hydrolicite}
\alias{hydrolicite}
\title{Calcul hydrolicite pour le mois en cours}
\usage{
hydrolicite(x)
}
\arguments{
\item{x}{Input table of \code{debit_mensuel} class}
}
\value{
A vector containing Qactu,Qmoy,H,N
}
\description{
Pour les donnees banque hydro d'une station, calculer le taux hydrolicite pour le mois actuek
}
\details{
Depuis le dernier fichier CSV pour la station, extraire les donnees de debit puis calculer
la moyenne historique.
 # Goal: compute the mean debit for the current month using historic data (Qmoy).
}
