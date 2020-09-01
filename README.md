
# qmongrdata

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/mong/qmongrdata.svg?branch=master)](https://travis-ci.org/mong/qmongrdata)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/mong/qmongrdata?branch=master&svg=true)](https://ci.appveyor.com/project/mong/qmongrdata)
<!-- badges: end -->

The goal of qmongrdata is to ...

## Installation

You can install the released version of qmongrdata from [github](https://github.com/) with:

``` r
remotes::install.github("mong/qmongrdata")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(qmongrdata)
## basic example code
```
## Ethics
Please note that the 'qmongrdata' project is released with a
  [Contributor Code of Conduct](CODE_OF_CONDUCT.md).
  By contributing to this project, you agree to abide by its terms.
  [Copied to clipboard]

## Registre overview

- **raw**: data is in `qmongrdata-raw`
- **csv**: `csv` file is OK
- **descr**: Description of indicators added to database
- **DG**: Dekningsgrad as separate indicator exists in `csv` file
- **v.1.0**: Data from registre wanted in version 1.0
- **imongr**: The data is in the database

| Registre                                                                                            | id              | raw      | csv      | descr    | DG       | v1.0     | imongr   |
| ---                                                                                                 | ---             | ---      | ---      | ---      | ---      | ---      | ---      |
| Nasjonalt Hoftebruddregister                                                                        | hoftebrudd      | &#10004; | &#10004; | &#10004; | &#10004; | &#10004; | &#10004; |
| Nasjonalt register for lymfoide maligniteter                                                        | lymfoid         | &#10004; | &#10004; | &#10004; | &#10004; | &#10004; | &#10004;
| Norsk hjerneslagregister                                                                            | hjerneslag      | &#10004; | &#10004; | &#10004; | &#10004; | &#10004; | &#10004;
| Norsk hjerteinfarktregister                                                                         | hjerteinfarkt   | &#10004; | &#10004; | &#10004; | &#10004; | &#10004; | &#10004;
| Nasjonalt kvalitetsregister for ryggkirurgi                                                         | rygg            | &#10004; | &#10004; | &#10004; |          | &#10004; | &#10004;
| Nasjonalt kvalitetsregister for ryggkirurgi                                                         | nkr_nakke       |          |          | &#10004; |          | &#10004;
| Norsk Intensiv- og pandemiregister                                                                  | intensiv        |          |          | &#10004; |          | &#10004;
| Norsk register for invasiv kardiologi (NORIC)                                                       | noric           | &#10004; | &#10004; | &#10004; |          | &#10004; | &#10004;
| Norsk karkirurgisk register - NORKAR                                                                | norkar          | &#10004; |          | &#10004; |          | &#10004; |
| Cerebral pareseregisteret i Norge                                                                   | cp              |          |          |          |          | &#10004; |
| ​Det norske hjertekirurgiregisteret                                                                 | hjertekirurgi   |          |          |          |          | &#10004; |
| Nasjonalt hjertestansregister                                                                       | hjertestans     | &#10004; |          |          |          | &#10004; |
| Nasjonalt korsbåndregister                                                                          | korsband        |          |          |          |          | &#10004; |
| Nasjonalt medisinsk kvalitetsregister for barne- og ungdomsdiabetes                                 | diabetes_barn   |          |          |          |          | &#10004; |
| Nasjonalt register for ablasjonsbehandling og elektrofysiologi i Norge (ABLA NOR).                  | ablanor         |          |          |          |          | &#10004; |
| Nasjonalt register for barnekreft                                                                   | barnekreft      |          |          |          |          | &#10004; |
| Nasjonalt register for brystkreft                                                                   | brystkreft      |          |          |          |          | &#10004; |
| Nasjonalt register for gynekologisk kreft                                                           | gynkreft        |          |          |          |          | &#10004; |
| Nasjonalt register for leddproteser                                                                 | leddprotese     |          |          |          |          | &#10004; |
| Nasjonalt register for lungekreft                                                                   | lungekreft      |          |          |          |          | &#10004; |
| Nasjonalt register for melanom                                                                      | melanom         |          |          |          |          | &#10004; |
| Nasjonalt register for prostatakreft                                                                | prostata        |          |          |          |          | &#10004; |
| Nasjonalt register for tykk- og endetarmskreft                                                      | tarmkreft       | &#10004; |          |          |          | &#10004; |
| Nasjonalt traumeregister                                                                            | traume          | &#10004; |          |          |          | &#10004; |
| Norsk hjertesviktregister                                                                           | hjertesvikt     |          |          |          |          | &#10004; |
| Norsk kvalitetsregister for artrittsykdommer – NorArtritt                                           | norartritt      |          |          |          |          | &#10004; |
| Norsk diabetesregister for voksne                                                                   | diabetes_voksne |          |          |          |          | &#10004; |
| Norsk kvalitetsregister for fedmekirurgi (SOReg Norge)                                              | fedmekir        |          |          |          |          | &#10004; |
| Norsk Kvalitetsregister Øre-Nese-Hals – Tonsilleregisteret                                          | tonsille        |          |          |          |          | &#10004; |
| Norsk MS register og biobank                                                                        | ms              |          |          |          |          | &#10004; |
| Norsk nyreregister                                                                                  | nyre            |          |          |          |          | &#10004; |
| Norsk ryggmargsskaderegister - NorSCIR                                                              | norscir         |          |          |          |          | &#10004; |
| Norsk gynekologisk endoskopiregister - NGER                                                         | nger            | &#10004; | &#10004; | &#10004; | &#10004; |          | &#10004; |
| Norsk Nakke- og Ryggregister                                                                        | nnrr            | &#10004; | &#10004; | &#10004; |
| Norsk register for analinkontinens (NRA)                                                            | nra             | &#10004; | &#10004; | &#10004; |
| Norsk register for gastrokirurgi (NoRGast)                                                          | norgast         | &#10004; | &#10004; | &#10004; |          |          | &#10004;
| Norsk vaskulittregister & biobank (NorVas)                                                          | norvas          | &#10004; | &#10004; | &#10004; |          |          | &#10004;
| Nasjonalt register for arvelige og medfødte nevromuskulære sykdommer                                | muskel          | &#10004; |          | &#10004; |
| Gastronet                                                                                           | gastronet       |          |
| Nasjonalt Barnehofteregister                                                                        | hofte_barn      |          |
| Nasjonalt kvalitetsregister for behandling av skadelig bruk eller avhengighet av rusmidler (KVARUS) | kvarus          |          |
| Nasjonalt kvalitetsregister for smertebehandling – SmerteReg                                        | smerte          |          |
| Nasjonalt register for langtids mekanisk ventilasjon                                                | mek_vent        |          |
| Nasjonalt register for organspesifikke autoimmune sykdommer (ROAS)                                  | roas            |          |
| Nordisk kvalitetsregister for hidradenitis suppurativa (HISREG)                                     | hisreg          | &#10004; |
| Norsk kvalitetsregister for behandling av spiseforstyrrelser (NorSpis)                              | norspis         |          |
| Norsk kvalitetsregister for leppe-kjeve-ganespalte                                                  | ganespalt       |          |
| Norsk kvinnelig inkontinensregister                                                                 | nkir            | &#10004; |
| Norsk nyfødtmedisinsk kvalitetsregister                                                             | nnk             |          |
| Norsk parkinsonregister og biobank                                                                  | parkinson       |          |
| Norsk Porfyriregister                                                                               | porfyri         |          |
| Norsk register for personer som utredes for kognitive symptomer i spesialisthelsetjenesten – NorKog | norkog          |          |

