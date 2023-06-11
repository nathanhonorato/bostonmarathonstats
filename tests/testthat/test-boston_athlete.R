testthat::test_that("returns a 5 column data frame", {
 
  testthat::expect_equal(
    ncol(boston_athlete("Kipruto")),
    5
  )
  
})
