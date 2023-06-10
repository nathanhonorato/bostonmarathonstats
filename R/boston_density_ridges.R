boston_density_ridges <- function(year, range_position) {
  
  results_boston |>
    dplyr::filter(RankOverGender %in% range_position &
                    Year %in% year) |>
    dplyr::mutate(YearFct = fct_rev(as.factor(Year))) |>
    ggplot2::ggplot(aes(y = YearFct)) +
    ggridges::geom_density_ridges(aes(x = OfficialTime, fill = Gender),
                                  alpha = .8, color = "white") +
    ggplot2::theme_bw() +
    ggplot2::theme(legend.title = element_blank()) +
    ggplot2::labs(x = "Official Time",
                  y = "Year") +
    ggplot2::scale_fill_manual(values = c("#FFDE00", "#00488D"),
                               labels = c("Female", "Male"))
  
}