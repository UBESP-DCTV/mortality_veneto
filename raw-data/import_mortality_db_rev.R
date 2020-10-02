library(tidyverse)
library(janitor)
library(readr)

comune_giorno <- read_rds(
    path = here::here("raw-data", "comune_giorno_rev.rds")
    ) %>%
    clean_names()

#the variable ge means month day, for example ge = 107
#means jenuary 7th, for 2020 we only have data intill June 30th,
#so I will remove the period from July 1st for the other years
#(mean exclude ge > 700)
db_gg <- comune_giorno %>%
    mutate(ge = ifelse(ge > 700, NA, ge)) %>%
    separate(ge, into = c("mm", "gg"), sep = 1) %>%
    mutate_at(vars(m_15:t_20), as.character)

#n.d. means "data not available"

db_mortality_rev <- db_gg %>%
    mutate(f_20 = ifelse(f_20 == "n.d.", NA, f_20),
           m_20 = ifelse(m_20 == "n.d.", NA, m_20),
           t_20 = ifelse(t_20 == "n.d.", NA, t_20)) %>%
    rename(provincia = nome_provincia) %>%
    mutate_at(vars(m_15:t_20), as.numeric)





save(db_mortality_rev, file = here::here("data", "db_mortality_rev.rda"))
