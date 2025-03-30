here::i_am("code/Build.R")

rmarkdown::render(
  here::here("Report.Rmd"),
  output_file = here::here("output", "Report.html"),
  output_options = list(
    message = FALSE, 
    warning = FALSE 
  )
)

