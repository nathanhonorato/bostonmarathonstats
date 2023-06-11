#' Get basic data of an athlete that finish Boston Marathon.
#'
#' The boston_athlete() function uses the results_boston database to get information 
#' about an athlete that finish Boston Marathon from 2009 to 2022.
#'
#' @param athlete Year when the event occured (string).
#'
#' @return A ggplot2 plot with density of the athletes (y-axis) over 
#' finishing times (x-axis).
#' @examples
#' boston_athlete(athlete = "Kipruto")
#' boston_athlete(athlete = "Benson Kipruto")
#'
#' @export
boston_athlete <- function(athlete) {
  results_boston |>
    dplyr::filter(stringr::str_detect(FullName, athlete)) |>
    dplyr::select(Year, FullName, AgeOnRaceDay, RankOverGender, OfficialTime) |>
    dplyr::arrange(dplyr::desc(Year)) |> 
    janitor::clean_names()
  
}