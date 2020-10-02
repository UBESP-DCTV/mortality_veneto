library(tidyverse)
library(janitor)
library(readr)

veneto_res_rev<- read_rds(
    path = here::here("raw-data", "veneto_res_rev.rds")
    ) %>%
    clean_names() %>%
    rename(comune = sesso)




save(veneto_res_rev, file = here::here("data", "veneto_res_rev.rda"))

