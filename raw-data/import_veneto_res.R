library(tidyverse)
library(janitor)
library(readr)

veneto_res_1519 <- read_csv(file = here::here("raw_data",
                                              "veneto_res_1519.csv"),
                      col_types = cols(femmine15 = col_number(),
                                       femmine16 = col_number(),
                                       femmine17 = col_number(),
                                       femmine18 = col_number(),
                                       femmine19 = col_number(),
                                       maschi15 = col_number(),
                                       maschi16 = col_number(),
                                       maschi17 = col_number(),
                                       maschi18 = col_number(),
                                       maschi19 = col_number(),
                                       totale15 = col_number(),
                                       totale16 = col_number(),
                                       totale17 = col_number(),
                                       totale18 = col_number(),
                                       totale19 = col_number()),
                      skip = 6) %>%
    clean_names() %>%
    rename(comune = sesso) %>%
    filter(comune != "Veneto")




save(veneto_res_1519, file = here::here("data", "veneto_res_1519.rda"))

