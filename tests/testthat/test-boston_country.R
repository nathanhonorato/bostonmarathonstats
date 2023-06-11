testthat::test_that("returns a 7 column data frame", {
  
  testthat::expect_equal(
    ncol(boston_country(gender = "both", year = 2022, "Brazil")),
    7
  )
  
})
