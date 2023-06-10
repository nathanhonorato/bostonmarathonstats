# boston_summary()
boston_summary <- function(gender, year) {
  if (gender == "both") {
    filter_gender <- c("Male", "Female")
  } else {
    filter_gender <- gender
  }
  
  results_boston |>
    dplyr::group_by(Gender, Year) |>
    dplyr::summarise(n_finishers = n(),
                     mean_age = mean(AgeOnRaceDay),
                     n_countries = n_distinct(CountryOfCtzName),
                     fastest_time = min(OfficialTime) |> lubridate::seconds_to_period(),
                     slowest_time = max(OfficialTime) |> lubridate::seconds_to_period()) |>
    dplyr::filter(Gender %in% filter_gender & Year %in% year) |>
    dplyr::arrange(dplyr::desc(Year)) |>
    dplyr::ungroup() |>
    janitor::clean_names()
}
