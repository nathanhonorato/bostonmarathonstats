boston_position <- function(gender, year, position) {
  if (gender == "both") {
    filter_gender <- c("Male", "Female")
  } else {
    filter_gender <- gender
  }
  
  results_boston |>
    dplyr::filter(RankOverGender %in% position &
                    Gender %in% filter_gender &
                    Year %in% year) |>
    dplyr:: select(Year, FullName, AgeOnRaceDay, Gender, CountryOfCtzName, OfficialTime, RankOverGender) |>
    dplyr::mutate(OfficialTime = lubridate::seconds_to_period(OfficialTime)) |>
    dplyr::arrange(desc(Year)) |>
    janitor::clean_names()
}