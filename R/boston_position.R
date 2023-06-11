#' Find who finished in a certain position of Boston Marathon
#'
#' The boston_position() function uses the results_boston database to find who 
#' finished in a certain position of male and female Boston Marathons from 2009 to 2022.
#'
#' @param gender Gender of the athlete (string).
#' @param year Year when the event occured (string).
#' @param position Position which the athlete finished the race (integer).
#'
#' @return A dataframe of 7 column with year of event, name of the athlete,
#' age of race day, gender, country of citizenship, official time and 
#' finishing rank by gender.
#' @examples
#' boston_position(gender = "both", year = 2021:2022, position = 1:3)
#' boston_position(gender = "Female", year = c(2010, 2021:2022), position = 1)
#' boston_position(gender = "Male", year = 2009, position = 1:10)
#'
#' @export
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
    dplyr::arrange(dplyr::desc(Year)) |>
    janitor::clean_names()
}