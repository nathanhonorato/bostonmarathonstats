boston_athlete <- function(athlete) {
  results_boston |>
    dplyr::filter(stringr::str_detect(FullName, athlete)) |>
    dplyr::select(Year, FullName, AgeOnRaceDay, RankOverGender, OfficialTime) |>
    dplyr::arrange(dplyr::desc(Year)) |> 
    janitor::clean_names()
  
}