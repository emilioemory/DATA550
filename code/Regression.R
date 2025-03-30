library(gtsummary)

clean_habs_data <- readRDS(here::here("output", "clean_habs_data.rds"))

model_phyco1 <- lm(m_density ~ phyco, data = clean_habs_data)
model_phyco2 <- lm(d_density ~ phyco, data = clean_habs_data)

tbl1 <- tbl_regression(model_phyco1, exponentiate = FALSE)

tbl2 <- tbl_regression(model_phyco2, exponentiate = FALSE)

tbl1
tbl2

saveRDS(list(tbl1 = tbl1, tbl2 = tbl2), file = here::here("output", "regressions.rds"))
