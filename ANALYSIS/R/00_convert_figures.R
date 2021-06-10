library(stringr)
library(pdftools)
library(here)
library(glue)

pdfs <- list.files(here("figures"), pattern = "*.pdf", full.names = TRUE)
for(pdf in pdfs) {
  pdf_convert(pdf = glue("{pdf}"), 
              filenames = glue("{str_remove(pdf, '.pdf')}.png"),
              format = "png", dpi = 500)
  
  pdf_convert(pdf = glue("{pdf}"), 
              filenames = glue("{str_remove(pdf, '.pdf')}.tiff"),
              format = "tiff")
}
