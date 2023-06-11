testthat::test_that("returns a 7 column data frame", {
  
  testthat::expect_equal(
    ncol(boston_position(gender = "both", year = 2022, position = 1:2)),
    7
  )
  
  })
