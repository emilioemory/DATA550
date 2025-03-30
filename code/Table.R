library(gtsummary)
library(dplyr)
library(labelled)

clean_habs_data <- readRDS(here::here("output", "clean_habs_data.rds"))

clean_habs_data_mutated <- clean_habs_data |> mutate(
  phyco_cat = ntile(phyco, 3),  
  phyco_cat = factor(phyco_cat, 
                     levels = c(1, 2, 3), 
                     labels = c("Low", "Medium", "High"))
)

var_label(clean_habs_data_mutated) <- list(
  m_density = "Mycrocystis cell density",
  d_density = "Dolichospermum cell density",
  phyco = "Phycocyanin",
  phyco_cat = "Phycocyanin Tertile"
)

summary_table <- clean_habs_data_mutated |>
  select(phyco_cat, phyco, m_density, d_density) |>
  tbl_summary(
    by = phyco_cat,
    statistic = list(all_continuous() ~ "{mean} ({sd})"),
    digits = all_continuous() ~ 2,
    missing = "no"
  ) |>
  add_overall()


saveRDS(
  summary_table,
  file = here::here("output", "summary_table.rds")
)

