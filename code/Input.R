library(pacman)
p_load(dplyr, tidyverse, here, readxl)

habs <- read_excel(here("raw_data" ,"HABs_DATA.xlsx"), 
                   col_types = c("text", "numeric", "date", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", "numeric"))

habs1 <- habs %>%
  mutate(across(c(m_density, a_density, d_density, w_density), 
                ~ ifelse(. == 0, NA, .)))

saveRDS(
    habs1,
    file = here::here("output", "clean_habs_data.rds")
)
