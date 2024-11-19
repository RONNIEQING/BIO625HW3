
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BIO625HW3

<!-- badges: start -->
<!-- badges: end -->

The goal of BIO625HW3 is to provide a simple linear regression function
QY_lm for analyzing datasets. This package implements a linear
regression model (`QY_lm`) using ordinary least squares. It provides
detailed outputs such as coefficients, R-squared, residuals, and more.

## Installation

You can install the development version of BIO625HW3 from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("RONNIEQING/BIO625HW3")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(BIO625HW3)

# Load your dataset (assuming completedata.sas7bdat is available)
library(haven)
data <- read_sas("/Users/qingyu/Desktop/Umich/研一上/BIO650 Linear Reg/completedata.sas7bdat")

# Run the QY_lm function
result <- QY_lm(data, NIHScore ~ Age + Depression + Optimism)

# Print the regression results
print(result$coefficients)
#>                     [,1]
#> (Intercept)  3.671288226
#> Age         -0.006601987
#> Depression   0.046604166
#> Optimism     0.007182162
print(result$R_squared)
#> [1] 0.00378264
print(result$adj_R_squared)
#> [1] -0.001132906
```

This example demonstrates how to load your data and run a simple
regression analysis using QY_lm.

What is special about using `README.Rmd` instead of just `README.md`?
With README.Rmd, you can include R code chunks that automatically run
and generate output, such as this example:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

Using README.Rmd allows you to dynamically generate content, such as
tables, plots, or results, ensuring your documentation is always
up-to-date. To keep README.md consistent, simply re-render README.Rmd
when needed.

## Vignettes

To learn more about how to use the `BIO625HW3` package, check out the
vignette:

``` r
browseVignettes("BIO625HW3")
```

## License

This package is licensed under the MIT License. See the LICENSE file for
details.
