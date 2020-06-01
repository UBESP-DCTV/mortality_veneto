library(tidyverse)
library(janitor)
library(readr)

comune_giorno <- read.csv(file = here::here("raw_data",
                                            "comune_giorno.csv"),
                          encoding = "latin1") %>%
    clean_names()

db_gg <- comune_giorno %>%
    separate(ge, into = c("mm", "gg"), sep = 1)

#9999 means "data not available"

db_mortality <- db_gg %>%
    mutate(femmine_20 = ifelse(femmine_20 == 9999, NA, femmine_20),
           maschi_20 = ifelse(maschi_20 == 9999, NA, maschi_20),
           totale_20 = ifelse(totale_20 == 9999, NA, totale_20)) %>%
    rename(provincia = nome_provincia)



save(db_mortality, file = here::here("data", "db_mortality.rda"))
