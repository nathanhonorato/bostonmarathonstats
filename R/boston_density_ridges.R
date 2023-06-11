#' Plot density of participants over finishing time in Boston Marathon.
#'
#' The boston_density_ridges() function uses the results_boston database to plot
#' a density plot (based on the package "ggridges") of finishing times of 
#' Boston Marathon from 2009 to 2022. This function needs at least two years to 
#' for the graph to plotted properly.
#'
#' @param year Year when the event occured (string).
#' @param range_position Range of positions to be ploted (string).
#' 
#' @return A dataframe of 5 column with year of event, full name of the athlete,
#' age of race day, finishing position by gender and official.
#' @examples
#' boston_density_ridges(year = 2012:2019, range_position = 1:10)
#'
#' @export
boston_density_ridges <- function(year, range_position) {
  
  results_boston |>
    dplyr::filter(RankOverGender %in% range_position &
                    Year %in% year) |>
    dplyr::mutate(YearFct = forcats::fct_rev(as.factor(Year))) |>
    ggplot2::ggplot(ggplot2::aes(y = YearFct)) +
    ggridges::geom_density_ridges(ggplot2::aes(x = OfficialTime, fill = Gender),
                                  alpha = .8, color = "white") +
    ggplot2::theme_bw() +
    ggplot2::theme(legend.title = ggplot2::element_blank()) +
    ggplot2::labs(x = "Official Time",
                  y = "Year") +
    ggplot2::scale_fill_manual(values = c("#FFDE00", "#00488D"),
                               labels = c("Female", "Male"))
  
}