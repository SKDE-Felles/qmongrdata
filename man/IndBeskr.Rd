% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{IndBeskr}
\alias{IndBeskr}
\title{Beskrivelse av kvalitetsindikatorer}
\format{
Dataramme med ei rad per indikator. Som variabler er ulike beskrivende elementer for indikatoren

\describe{
\item{IndID}{Indikatorens iD. Består av registernavn og et løpenummer. Eks nkr_nakke2, intensiv1}
\item{Register}{kortnavn for registeret. Eks nakke, intensiv. Denne er strengt tatt overflødig hvis
man er nøye med konsekvent navngiving av indikatorens id, se IndID}
\item{IndTittel}{Tittel eller en form for kort beskrivelse av indikatoren}
\item{IndNavn}{Indikatornavn. Identifikator først og fremst for indikator"gjenkjennelse" hos statistiker.
Kan eksempelvis være parameteren som benyttes i valgtVar for å hente ut tilrettelegging av denne indikatoren.}
\item{MaalNivaaGronn}{Grense for grønt målnivå. Desimaltall i intervallet 0-1}
\item{MaalNivaaGul}{Grense for gult målnivå. Desimaltall i intervallet 0-1}
\item{MaalRetn}{Angir om ønsket målnivået for variabelen er høyt (1) eller lavt (09. Heltall: 0,1 }
\item{BeskrivelseKort}{Kort, men noe detaljert beskrivelse av indikatoren. Tekst.}
\item{BeskrivelseLang}{Utfyllende beskrivelse av indikatoren. Tekst.}
}
}
\source{
Organisasjonsnumre og struktur kan finnes ved hjelp av Brønnøyaundregisteret:
\url{https://w2.brreg.no/enhet/sok/}
}
\usage{
IndBeskr
}
\description{
Oversikt over over og beskrivelse av alle kvalitetsindikatorerer. Fila oppdateres etter hvert som det legges til
data fra flere kvalitetsindikatorer og registre. "Originalfila" finnes som Excel-fil under data-raw. Gjør endringer
der og skriv så ned til rda.
}
\keyword{datasets}
