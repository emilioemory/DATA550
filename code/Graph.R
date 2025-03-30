library(ggplot2)

clean_habs_data <- readRDS(here::here("output", "clean_habs_data.rds"))

micro_plot <-
  ggplot(clean_habs_data, aes(x = phyco, y = m_density)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "darkgreen") +
  labs(title = "Microcystis vs Phycocyanin", x = "Phycocyanin", y = "Cell Density")

doli_plot <-
  ggplot(clean_habs_data, aes(x = phyco, y = d_density)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "darkcyan") +
  labs(title = "Dolichospermum vs Phycocyanin", x = "Phycocyanin", y = "Cell Density")

saveRDS(list(micro_plot = micro_plot, doli_plot = doli_plot), file = here::here("output", "plots.rds"))