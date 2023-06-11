testthat::test_that("returns a ggplot object", {
  
  testthat::expect_s3_class(
    boston_density_ridges(year = 2021:2022, range_position = 1:10),
    "ggplot"
  )
  
})