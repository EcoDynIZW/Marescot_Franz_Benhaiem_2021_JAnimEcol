library(rmarkdown)
library(purrr)
library(stringr)
library(here)

render_all_reports <- function() {
  rmds <- list.files(
    here("R"), pattern = "*.rmd|*.Rmd|*.RMD", 
    recursive = TRUE, include.dirs = TRUE
  )
  out <- gsub(".*/", "", rmds)
  
  map2(
    rmds,
    out,
    ~render(
      paste0("R/", .x), 
      output_file = here(
        "docs",  
        paste0(gsub(".Rmd|.rmd|.RMD", "", .y), ".html")
      )
    )
  )
}

render_all_reports()
