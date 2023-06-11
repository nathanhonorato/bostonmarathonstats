#' Get summary information about countries in Boston Marathon.
#'
#' The boston_country() function uses the results_boston database to get information 
#' about countries that had representants in an edition of Boston Marathon from 2009 to 2022.
#'
#' @param gender Gender of the athlete (string).
#' @param year Year when the event occured (string).
#' @param country Country of origin of an athlete (string).
#'
#' @return A dataframe of 7 column with gender, year of event, country of origin
#' of an athlete, number of finishers from that country, mean age of finishers,
#' fastest time and slowest time.
#' @examples
#' boston_country(gender = "both", year = 2021:2022, country = c("Brazil", "Kenya"))
#' boston_country(gender = "Female", year = 2022, country = "Kenya")
#' boston_country(gender = "Male", year = 2009, country = "United States of America")
#'
#' @export
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
    dplyr::summarise(n_athletes = dplyr::n(),
                     mean_age = mean(AgeOnRaceDay),
                     fastest_time = min(OfficialTime) |> lubridate::seconds_to_period(),
                     slowest_time = max(OfficialTime) |> lubridate::seconds_to_period()) |>
    dplyr::arrange(dplyr::desc(Year)) |>
    dplyr::ungroup() |>
    janitor::clean_names()
  
}
