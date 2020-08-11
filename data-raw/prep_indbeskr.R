library(magrittr)

#Indikatorbeskrivelser

IndBeskr <- read.csv2("data-raw/IndBeskr.csv", fileEncoding = "UTF-8")
usethis::use_data(IndBeskr, overwrite = TRUE)

#################################################
######## Legg på dekningsgrad ###################
# PR https://github.com/mong/qmongrdata/pull/44 #
#################################################

IndBeskr <- read.csv2("data-raw/IndBeskr.csv", fileEncoding = "UTF-8")


IndBeskr <- IndBeskr %>%
  dplyr::mutate(dg_id = dplyr::case_when(Register == "hoftebrudd" & indikatorType != "dg" ~ "hoftebrudd_dekgrad_prim_brudd",
                                         Register == "lymfoid" & indikatorType != "dg" ~ "lymfoid_dekgrad_utred",
                                         Register == "hjerteinfarkt" & indikatorType != "dg" ~ "hjerteinfarkt_dekgrad",
                                         Register == "norkar" & IndID %in% c("norkar_doed_utpos_hoved",
                                                                             "norkar_doed_utpos_hoved_aapen",
                                                                             "norkar_doed_utpos_hoved_EVAR",
                                                                             "norkar_anb_med_utpos_hoved") & indikatorType != "dg" ~ "norkar_dg_utpos_hoved",
                                         Register == "norkar" & IndID %in% c("norkar_forsnev_hals_14d",
                                                                             "norkar_anb_med_forsnev_hals") & indikatorType != "dg" ~ "norkar_dg_forsnev_hals",
                                         Register == "norkar" & IndID == "norkar_anb_med_forsnev_ben" & indikatorType != "dg" ~ "norkar_dg_forsnev_ben",
                                         Register == "nger" & indikatorType != "dg" ~ "nger_dekgrad",
                                         Register == "hjerneslag" & indikatorType != "dg" ~ "hjerneslag_dekgrad",
                                         indikatorType == "dg" ~ IndID))


IndBeskr <- IndBeskr %>%
  dplyr::mutate(include = dplyr::case_when(indikatorType == "andel" ~ TRUE,
                                           TRUE ~ FALSE))

IndBeskr <- IndBeskr %>%
  dplyr::mutate(indikatorType = dplyr::case_when(indikatorType == "dg" ~ "andel",
                                           TRUE ~ "andel"))

write.csv2(IndBeskr, file = "data-raw/IndBeskr.csv", fileEncoding = "UTF-8", row.names = FALSE)

usethis::use_data(IndBeskr, overwrite = TRUE)

#################################################
######## Endre kolonnenavn ######################
# PR https://github.com/mong/qmongrdata/pull/45 #
#################################################

IndBeskr <- read.csv2("data-raw/IndBeskr.csv", fileEncoding = "UTF-8")

IndBeskr <- IndBeskr %>%
  dplyr::rename(id = IndID,
                title = IndTittel,
                name = IndNavn,
                type = indikatorType,
                measure_unit = benevning,
                min_denominator = minsteNevner,
                min_value = minVerdi,
                max_value = maxVerdi,
                level_green = MaalNivaaGronn,
                level_yellow = MaalNivaaGul,
                level_direction = MaalRetn,
                short_description = BeskrivelseKort,
                long_description = BeskrivelseLang,
                registry_name = Register,
                registry_full_name = FulltRegisterNavn)

write.csv2(IndBeskr, file = "data-raw/IndBeskr.csv", fileEncoding = "UTF-8", row.names = FALSE)

usethis::use_data(IndBeskr, overwrite = TRUE)
