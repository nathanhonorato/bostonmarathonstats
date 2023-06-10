## code to prepare `results_boston` dataset goes here

library(tidyverse)

file_names <- list.files("data-raw/csv_files/",
                         pattern = ".csv",
                         full.names = TRUE)

results_boston <-
  file_names |>
  purrr::map_df(~ {
    Year <- sub(".*_(\\d{4})\\.csv", "\\1", .x)
    df <- read_csv(.x) |>
      dplyr::mutate(Year = as.integer(Year), .before = "FullName") |>
      dplyr::select(-BibNumber, -SortName, -EventGroup)
  }) |>
  mutate(Gender = str_replace_all(Gender, "M", "Male"),
         Gender = str_replace(Gender, "F", "Female"))

usethis::use_data(results_boston, overwrite = TRUE)
