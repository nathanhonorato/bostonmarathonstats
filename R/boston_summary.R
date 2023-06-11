#' Get a summary stats of the participants of the Boston Marathon
#'
#' The boston_summary() function uses the results_boston database to get stats about 
#' the participants of a certain edition of Boston Marathon from 2009 to 2022.
#'
#' @param gender Gender of the athlete (string).
#' @param year Year when the event occured (string).
#'
#' @return A dataframe of 7 column with gender, year of event, number of finishers, mean age of finishers,
#' number of countries that had representants in the event, fastest time (champion) 
#' and slowest time.
#' @examples
#' boston_summary(gender = "Male", year = 2021:2022)
#' boston_summary(gender = "Female", year = 2021)
#' boston_summary(gender = "both", year = c(2009, 2021:2022))
#'
#' @export
boston_summary <- function(gender, year) {
  if (gender == "both") {
    filter_gender <- c("Male", "Female")
  } else {
    filter_gender <- gender
  }
  
  results_boston |>
    dplyr::group_by(Gender, Year) |>
    dplyr::summarise(n_finishers = dplyr::n(),
                     mean_age = mean(AgeOnRaceDay),
                     n_countries = dplyr::n_distinct(CountryOfCtzName),
                     fastest_time = min(OfficialTime) |> lubridate::seconds_to_period(),
                     slowest_time = max(OfficialTime) |> lubridate::seconds_to_period()) |>
    dplyr::filter(Gender %in% filter_gender & Year %in% year) |>
    dplyr::arrange(dplyr::desc(Year)) |>
    dplyr::ungroup() |>
    janitor::clean_names()
}
