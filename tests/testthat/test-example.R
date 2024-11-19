test_that("QY_lm works correctly with completedata", {
  # Load the dataset
  library(haven)
  data <- read_sas("/Users/qingyu/Desktop/Umich/研一上/BIO650 Linear Reg/completedata.sas7bdat")

  # Ensure the data is loaded as a data frame
  expect_true(is.data.frame(data))

  # Update formula with actual variable names
  formula <- NIHScore ~ Age + Depression + Optimism  # Response: NIHScore, Predictors: Age, Depression, Optimism
  result <- QY_lm(data, formula)

  # Check the structure of the return value
  expect_type(result, "list") # Ensure the result is a list
  expect_true("coefficients" %in% names(result)) # Check if coefficients are included
  expect_true("R_squared" %in% names(result)) # Check if R-squared is included

  # Validate the range of R-squared
  expect_true(result$R_squared >= 0 && result$R_squared <= 1)

  # Check residual standard error
  expect_true(result$RSE > 0)

  # Verify degrees of freedom
  n <- nrow(data)
  p <- length(result$coefficients)
  expect_equal(result$df_residual, n - p) # Degrees of freedom should match
})
