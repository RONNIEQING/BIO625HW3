#' QY Linear Regression Model
#'
#' @param data A data frame containing the dataset.
#' @param formula A formula specifying the model (e.g., y ~ x1 + x2).
#' @return A list containing regression results: coefficients, R-squared,
#'         residual standard error, degrees of freedom, and more.
#' @export
QY_lm <- function(data, formula) {
  # Parse formula and extract response and predictors
  mf <- model.frame(formula, data)
  y <- model.response(mf)
  X <- model.matrix(formula, data)

  # Compute coefficients
  beta <- solve(t(X) %*% X) %*% t(X) %*% y

  # Compute fitted values and residuals
  fitted_values <- X %*% beta
  residuals <- y - fitted_values

  # Degrees of freedom
  n <- length(y)          # Number of observations
  p <- ncol(X)            # Number of predictors (including intercept)
  df_residual <- n - p    # Residual degrees of freedom

  # Residual standard error
  RSS <- sum(residuals^2) # Residual sum of squares
  RSE <- sqrt(RSS / df_residual)

  # R-squared and Adjusted R-squared
  TSS <- sum((y - mean(y))^2) # Total sum of squares
  R_squared <- 1 - RSS / TSS
  adj_R_squared <- 1 - (1 - R_squared) * ((n - 1) / df_residual)

  # Standard errors of coefficients
  sigma_squared <- RSS / df_residual
  var_beta <- sigma_squared * solve(t(X) %*% X)
  se_beta <- sqrt(diag(var_beta))

  # Return results
  return(list(
    coefficients = beta,
    fitted_values = fitted_values,
    residuals = residuals,
    R_squared = R_squared,
    adj_R_squared = adj_R_squared,
    standard_errors = se_beta,
    df_residual = df_residual,
    RSE = RSE
  ))
}
