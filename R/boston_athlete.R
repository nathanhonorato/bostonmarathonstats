boston_athlete <- function(athlete) {
  results_boston |>
    dplyr::filter(str_detect(FullName, athlete)) |>
    dplyr::select(Year, FullName, AgeOnRaceDay, RankOverGender, OfficialTime) |>
    dplyr::arrange(desc(Year))
  
}