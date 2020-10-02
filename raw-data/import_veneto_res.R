library(tidyverse)
library(janitor)
library(readr)

veneto_res <- read_rds(
    path = here::here("raw-data", "veneto_res.rds")
    ) %>%
    clean_names() %>%
    rename(comune = sesso) %>%
    filter(comune != "Veneto")




save(veneto_res, file = here::here("data", "veneto_res.rda"))

