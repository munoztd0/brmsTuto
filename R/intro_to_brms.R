#' Introduction to Bayesian Regression with brms
#'
#' This tutorial provides an interactive introduction to Bayesian regression modeling 
#' using the brms package. It covers the fundamentals of Bayesian statistics, 
#' model specification, fitting, interpretation, and comparison using brms.
#'
#' @name intro_to_brms
#' @docType data
#' @keywords tutorials
#' 
#' @examples
#' if (interactive()) {
#'   learnr::run_tutorial("intro_to_brms", package = "brmsTutorial")
#' }
NULL

#' Palmer Penguins Dataset (cleaned)
#'
#' A cleaned version of the Palmer Penguins dataset with NA values removed.
#'
#' @format A data frame with penguin measurements:
#' \describe{
#'   \item{species}{a factor denoting penguin species (Adelie, Chinstrap, Gentoo)}
#'   \item{island}{a factor denoting island in Palmer Archipelago, Antarctica}
#'   \item{bill_length_mm}{a number denoting bill length (millimeters)}
#'   \item{bill_depth_mm}{a number denoting bill depth (millimeters)}
#'   \item{flipper_length_mm}{an integer denoting flipper length (millimeters)}
#'   \item{body_mass_g}{an integer denoting body mass (grams)}
#'   \item{sex}{a factor denoting penguin sex (female, male)}
#'   \item{year}{an integer denoting study year (2007, 2008, 2009)}
#' }
#' @source Horst AM, Hill AP, Gorman KB (2020). palmerpenguins: Palmer
#'  Archipelago (Antarctica) penguin data. R package version 0.1.0.
#'  https://allisonhorst.github.io/palmerpenguins
"penguins_clean"

#' Nonlinear example data
#'
#' A dataset with a nonlinear relationship between x and y.
#'
#' @format A data frame with 100 rows and 2 variables:
#' \describe{
#'   \item{x}{predictor variable}
#'   \item{y}{response variable, following an exponential decay with noise}
#' }
"nonlinear_data"

#' Multilevel penguins example data
#'
#' A simulated dataset with penguin-like measurements for demonstrating multilevel models.
#'
#' @format A data frame with 150 rows and 3 variables:
#' \describe{
#'   \item{species}{penguin species factor (Adelie, Chinstrap, Gentoo)}
#'   \item{flipper_length_mm}{flipper length in millimeters}
#'   \item{body_mass_g}{body mass in grams, varying by species with realistic relationships}
#' }
"multilevel_data"

#' Penguin sex prediction dataset
#'
#' A subset of the Palmer Penguins dataset for demonstrating logistic regression with binary outcomes.
#'
#' @format A data frame with penguin measurements:
#' \describe{
#'   \item{sex}{binary factor (female/male)}
#'   \item{bill_depth_mm}{bill depth in millimeters}
#'   \item{bill_length_mm}{bill length in millimeters}
#' }
#' @source Horst AM, Hill AP, Gorman KB (2020). palmerpenguins: Palmer
#'  Archipelago (Antarctica) penguin data. R package version 0.1.0. 
"penguins_sex" 