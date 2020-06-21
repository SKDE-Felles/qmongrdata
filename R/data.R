#' Oversikt over sykehusstruktur og navn
#'
#' Datasett som inneholder oversikt over organisasjonsnummer og navn for RHF, HF og sykehus.
#' Organisasjonsnummer er hentet fra Brønnøysundregisteret. Navn fra Brønnøysundregisteret er også med, samt
#' "selvvalgte" kortnavn for både HF og sykehus.
#'
#' @format Dataramme med ei rad per sykehus og RHF, HF og sykehusnavn som variabler
#' \describe{
#'   \item{OrgNrRHF}{RHF'ets organisasjonsnummer i Brønnøysundregisteret}
#'   \item{RHF}{Regionalt Helseforetak}
#'   \item{OrgNrHF}{HF'ets organisasjonsnummer i Brønnøysundregisteret}
#'   \item{HF}{Helseforetak, navn fra Brønnøysundregisteret}
#'   \item{Hfkortnavn}{Kortnavn for HF'et}
#'   \item{OrgNrShus}{Sykehusets organisasjonsnummer i Brønnøysundregisteret}
#'   \item{OrgNavnEnhetsreg}{Sykehusets navn i Brønnøysundregisteret}
#'   \item{SykehusnavnLang}{Sykehusets navn "hos SKDE", dvs. navnet som har blitt benyttet i helseatlas.}
#'   \item{SykehusNavn}{Sykehusets kortnavn}
#'   \item{TaMed}{Indikator (0/1) som angir om sykehuset er vanlig å ha med i div. oversikter}
#' }
#' @source Organisasjonsnumre og struktur kan finnes ved hjelp av Brønnøyaundregisteret:
#' \url{https://w2.brreg.no/enhet/sok/}
"SykehusNavnStruktur"

#' Oversikt over sykehusstruktur og navn
#'
#' Datasett som inneholder oversikt over organisasjonsnummer og navn for RHF, HF og sykehus.
#' Organisasjonsnummer er hentet fra Brønnøysundregisteret. Navn fra Brønnøysundregisteret er også med, samt
#' "selvvalgte" kortnavn for både HF og sykehus.
#'
#' @format Dataramme med ei rad per sykehus og RHF, HF og sykehusnavn som variabler
#' \describe{
#'   \item{OrgNr}{Sykehusets eller helseforetaket sitt organisasjonsnummer i Brønnøysundregisteret}
#'   \item{OrgNavnEnhetsreg}{Sykehusets eller helseforetaket sitt navn i Brønnøysundregisteret}
#'   \item{Kortnavn}{Sykehusets eller helseforetaket sitt kortnavn}
#'   \item{Nivaa}{Nivået til organisasjonen. 3 for sykehus; 2 for HF; 1 for RHF; 0 for Nasjonalt}
#'   \item{NivaaOpp}{Organisasjonsnummer til overordnet enhet}
#' }
#' @source Organisasjonsnumre og struktur kan finnes ved hjelp av Brønnøyaundregisteret:
#' \url{https://w2.brreg.no/enhet/sok/}
"hospital_structure"

#' Beskrivelse av kvalitetsindikatorer
#'
#' Oversikt over over og beskrivelse av alle kvalitetsindikatorerer. Fila oppdateres etter hvert som det legges til
#' data fra flere kvalitetsindikatorer og registre. "Originalfila" finnes som Excel-fil under data-raw. Gjør endringer
#' der og skriv så ned til rda.
#'
#' @format Dataramme med ei rad per indikator. Som variabler er ulike beskrivende elementer for indikatoren
#'
#' \describe{
#'   \item{IndID}{Indikatorens iD. Består av registernavn og et løpenummer. Eks nkr_nakke2, intensiv1}
#'   \item{Register}{kortnavn for registeret. Eks nakke, intensiv. Denne er strengt tatt overflødig hvis
#'   man er nøye med konsekvent navngiving av indikatorens id, se IndID}
#'   \item{IndTittel}{Tittel eller en form for kort beskrivelse av indikatoren}
#'   \item{IndNavn}{Indikatornavn. Identifikator først og fremst for indikator"gjenkjennelse" hos statistiker.
#'   Kan eksempelvis være parameteren som benyttes i valgtVar for å hente ut tilrettelegging av denne indikatoren.}
#'   \item{MaalNivaaGronn}{Grense for grønt målnivå. Desimaltall i intervallet 0-1}
#'   \item{MaalNivaaGul}{Grense for gult målnivå. Desimaltall i intervallet 0-1}
#'   \item{MaalRetn}{Angir om ønsket målnivået for variabelen er høyt (1) eller lavt (09. Heltall: 0,1 }
#'   \item{BeskrivelseKort}{Kort, men noe detaljert beskrivelse av indikatoren. Tekst.}
#'   \item{BeskrivelseLang}{Utfyllende beskrivelse av indikatoren. Tekst.}
#' }
#' @source Organisasjonsnumre og struktur kan finnes ved hjelp av Brønnøyaundregisteret:
#' \url{https://w2.brreg.no/enhet/sok/}
"IndBeskr"



#' Kvalitetsindikatordata
#'
#' "Hendelsesentydige" data som angir verdier for hver kvalitetsindikator.
#'
#' @format Dataramme med ei rad per hendelse (operasjon/innleggelse/...)
#'
#' \describe{
#'   \item{Aar}{Årtall for hendelsen. format: YYYY}
#'   \item{ShNavn}{Sykehusnavn. Dette er sykehusnavnet som benyttes i registeret. Det kan være registrert
#'   hendelser fra flere enheter på ett og samme sykehus. Dette navnet kan da benyttes til å skille mellom
#'   de ulike enhetene. Tekst}
#'   \item{ReshId}{Den registrerende enhetens resh-id.}
#'   \item{OrgNrShus}{Sykehusets organisasjonsnummer i Brønnøysundregisteret. Numerisk, 9 siffer}
#'   \item{Variabel}{Resultatvariabel for kvalitetsindikatoren. I de fleste tilfeller vil dette være en
#'   indikatorvariabel, dvs. ha verdiene 0 og 1. For noen kvalitetsindikatorer kan det være nødvendig å
#'   benytte en eksakt verdi. F.eks. liggetid hvis man ønsker å benytte median liggetid som indikator.}
#'   \item{kvalIndID}{ID for kvalitetsindikatoren. Benyttes til å koble indikatorbeskrivelser
#'   til de observerte verdiene (eller omvendt...). Dvs. kobler sammen 'KvalIndData' og 'IndBeskr'.}
#' }
#' @source Organisasjonsnumre og struktur kan finnes ved hjelp av Brønnøyaundregisteret:
#' \url{https://w2.brreg.no/enhet/sok/}
"KvalIndData"

#' Fagområdeinndeling
#'
#' Oversikt over hvilke kvalitetsregistere som hører til under ulike fagområder
#'
"fagomr"
