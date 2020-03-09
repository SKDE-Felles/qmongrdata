#--------GENERELT---------------
#Må legge til funksjonalitet for at ett og ett register oppdateres i datafila.
# evt. sjekke på kvalindID

#Indikatorbeskrivelser

IndBeskr <- readxl::read_excel("data-raw/Indikatorbeskrivelser.xlsx")
usethis::use_data(IndBeskr, overwrite = TRUE)

## Sykehusstruktur
# Excel
SykehusNavnStruktur <- readxl::read_excel('data-raw/SykehusNavnStruktur.xlsx')

# csv
SykehusNavnStruktur <- read.csv2('data-raw/SykehusNavnStruktur.csv')

# Convert org.nr. to characters
SykehusNavnStruktur$OrgNrRHF <- as.character(SykehusNavnStruktur$OrgNrRHF)
SykehusNavnStruktur$OrgNrHF <- as.character(SykehusNavnStruktur$OrgNrHF)
SykehusNavnStruktur$OrgNrShus <- as.character(SykehusNavnStruktur$OrgNrShus)
usethis::use_data(SykehusNavnStruktur, overwrite = TRUE)

# ------------DEGENERATIV NAKKE-----------------------
# Denne funker bare når database tilgjengelig!:
library(nakke)
RegData <- NakkeRegDataSQL()
RegData <- NakkePreprosess(RegData)

KvalIndDataNakke <- tilretteleggDataNakke(RegData = RegData, datoFra = '2014-01-01', aar=0) 
usethis::use_data(KvalIndDataNakke, overwrite = TRUE)


#-------------- INTENSIV -----------------------------------
library(intensiv)
RegData <- NIRRegDataSQL(datoFra = '2016-01-01')
RegData <- NIRPreprosess(RegData)

KvalIndDataIntensiv <- intensiv::tilretteleggKvalIndData(RegData, 
                                                         datoFra='2016-01-01', datoTil=Sys.Date())

#----------------Legge til nytt datasett NB: Må overskrive gamle data fra registeret som oppdateres---------------
data('KvalIndData')
KvalIndData <- rbind(KvalIndData,
                     KvalIndDataIntensiv)
usethis::use_data(KvalIndData, overwrite = TRUE)

#-------------- NORGAST -----------------------------------
norgastdata <- read.csv2('data-raw/norgastdata.csv')
data('KvalIndData')
KvalIndData <- rbind(KvalIndData,
                     norgastdata)
usethis::use_data(KvalIndData, overwrite = TRUE)


#--------  FUNKSJONER --------------------------------

#' Degenerativ Nakke: Tilrettelegge data for offentlig visning.
#'
#' @param filUt tilnavn for utdatatabell (fjern?)
#' @param RegData - data
#' @param valgtVar -
#' @param datoFra - startdato
#' @param aar - velge hele år (flervalg)
#' @return Datafil til Resultatportalen
#' @export

tilretteleggDataNakke <- function(RegData = RegData, datoFra = '2014-01-01', aar=0,
                           filUt='dummy'){ #valgtVar, 
  
nyID <- c('114288'='4000020', '109820'='974589095', '105783'='974749025',
          '103469'='874716782', '601161'='974795787', '999920'='913705440',
          '105588'='974557746', '999998'='999998', '110771'='973129856',
          '4212372'='4212372', '4211880'='999999003', '4211879'='813381192')
RegData$OrgNrShus <- as.character(nyID[as.character(RegData$ReshId)])
resultatVariable <- c('KvalIndId', 'Aar', "ShNavn", "ReshId", "OrgNrShus" , "Variabel")
NakkeKvalInd <- data.frame(NULL) #Aar=NULL, ShNavn=NULL)

kvalIndParam <- c('KomplSvelging3mnd', 'KomplStemme3mnd', 'Komplinfek', 'NDIendr12mnd35pstKI')
indikatorID <- c('nakke1', 'nakke2', 'nakke3', 'nakke4')


for (valgtVar in kvalIndParam){

  myelopati <- if (valgtVar %in% c('KomplStemme3mnd', 'KomplSvelging3mnd')) {0} else {99}
  fremBak <- if (valgtVar %in% c('KomplStemme3mnd', 'KomplSvelging3mnd', 'NDIendr12mnd35pstKI')) {1} else {0}
  #filUt <- paste0('NakkeKvalInd', ifelse(filUt=='dummy',  valgtVar, filUt), '.csv')
  NakkeVarSpes <- NakkeVarTilrettelegg(RegData=RegData, valgtVar=valgtVar, figurtype = 'andelGrVar')
  NakkeUtvalg <- NakkeUtvalgEnh(RegData=NakkeVarSpes$RegData, aar=aar, datoFra = datoFra,
                                myelopati=myelopati, fremBak=fremBak) #, hovedkat=hovedkat) # #, datoTil=datoTil)
  NakkeKvalInd1 <- NakkeUtvalg$RegData[ , resultatVariable]
  NakkeKvalInd1$kvalIndID <- indikatorID[which(kvalIndParam == valgtVar)]
  
  NakkeKvalInd <- rbind(NakkeKvalInd, NakkeKvalInd1)
  #info <- c(NakkeVarSpes$tittel, NakkeUtvalg$utvalgTxt)
  #NakkeKvalInd$info <- c(info, rep(NA, dim(NakkeKvalInd)[1]-length(info)))
}  

  # 114288=4000020, 109820=974589095, 105783=974749025, 103469=874716782, 601161=974795787, 999920=913705440,
  # 105588=974557746, 999998=999998, 110771=973129856, 4212372=4212372, 4211880=999999003, 4211879=813381192
  #test <- as.character(nyID[as.character(x)])
  # ReshId=OrgID
  # 114288=4000020              Stavanger USH
  # 109820=974589095           OUS, Ullevål USH
  # 105783=974749025        Trondheim, St. Olav
  # 103469=874716782                  OUS, RH
  # 601161=974795787                Tromsø, UNN
  # 999920=913705440    Oslofjordklinikken Vest
  # 105588=974557746              Haukeland USH
  # 999998=999998        Oslofjordklinikken
  # 110771=973129856                     Volvat
  # 4212372=4212372      Aleris Colosseum Oslo
  # 4211880=999999003             Aleris Nesttun
  # 4211879=813381192 Aleris Colosseum Stavanger
  return(invisible(NakkeKvalInd))
}

