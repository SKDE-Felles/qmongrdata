# convert to new database model

library(magrittr)
convert_csv <- function(csv_file) {
  old_data <- read.csv2(csv_file, fileEncoding = "UTF-8", stringsAsFactors = TRUE)
  
  new_data <- old_data %>%
    dplyr::select(Aar, OrgNrShus, Variabel, KvalIndID) %>%
    dplyr::rename(year = Aar,
                  ind_id = KvalIndID,
                  orgnr = OrgNrShus,
                  var = Variabel)
  
  if ("nevner" %in% colnames(old_data)) {
    new_data$denominator <- old_data$nevner
  }

  if ("Nevner" %in% colnames(old_data)) {
    new_data$denominator <- old_data$Nevner
  }
  
  write.csv2(new_data,
             file = csv_file,
             fileEncoding = "UTF-8",
             quote = TRUE,
             row.names=FALSE)
}

convert_csv("data-raw/nra.csv")
convert_csv("data-raw/hjerteinfarkt.csv")
convert_csv("data-raw/lymfoide_maligniteter.csv")
convert_csv("data-raw/noric.csv")
convert_csv("data-raw/nger.csv")
convert_csv("data-raw/norvas.csv")
convert_csv("data-raw/norgastdata.csv")
convert_csv("data-raw/nkr_rygg.csv")
convert_csv("data-raw/hoftebrudd.csv")
convert_csv("data-raw/nnrr.csv")
convert_csv("data-raw/hjerneslag.csv")

