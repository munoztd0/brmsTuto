#' Access the clean penguins dataset
#'
#' @return The penguins dataset with NA values removed
#' @export
get_penguins_clean <- function() {
  # In case the data wasn't lazy-loaded
  if (!exists("penguins_clean", envir = .GlobalEnv)) {
    data("penguins_clean", package = "brmsTutorial", envir = environment())
  }
  return(penguins_clean)
}

#' Access the nonlinear example dataset
#'
#' @return A dataset with a nonlinear relationship
#' @export
get_nonlinear_data <- function() {
  if (!exists("nonlinear_data", envir = .GlobalEnv)) {
    data("nonlinear_data", package = "brmsTutorial", envir = environment())
  }
  return(nonlinear_data)
}

#' Access the multilevel penguins example dataset
#'
#' @return A dataset suitable for multilevel modeling
#' @export
get_multilevel_data <- function() {
  if (!exists("multilevel_data", envir = .GlobalEnv)) {
    data("multilevel_data", package = "brmsTutorial", envir = environment())
  }
  return(multilevel_data)
}

#' Access the penguin sex prediction dataset
#'
#' @return A dataset for binary classification
#' @export
get_penguins_sex <- function() {
  if (!exists("penguins_sex", envir = .GlobalEnv)) {
    data("penguins_sex", package = "brmsTutorial", envir = environment())
  }
  return(penguins_sex)
} 