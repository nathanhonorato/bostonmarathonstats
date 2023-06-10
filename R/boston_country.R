boston_country <- function(gender, year, country) {
  if (gender == "both") {
    filter_gender <- c("Male", "Female")
  } else {
    filter_gender <- gender
  }
  
  results_boston |>
    dplyr::filter(CountryOfCtzName == country &
                    Gender %in% filter_gender &
                    Year %in% year) |>
    dplyr::group_by(Gender, Year, CountryOfCtzName) |>
    dplyr::summarise(n_athletes = n(),
                     mean_age = mean(AgeOnRaceDay),
                     fastest_time = min(OfficialTime) |> lubridate::seconds_to_period(),
                     slowest_time = max(OfficialTime) |> lubridate::seconds_to_period()) |>
    dplyr::arrange(desc(dplyr::Year)) |>
    dplyr::ungroup() |>
    janitor::clean_names()
  
}
