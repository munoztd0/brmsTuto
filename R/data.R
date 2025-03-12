#' @title Generate and Save Package Data
#' @description This function generates and saves all the datasets needed for the tutorial.
#' It should be run during package development, not by end users.
#' @export
generate_package_data <- function() {
  # Ensure palmerpenguins is available
  if (!requireNamespace("palmerpenguins", quietly = TRUE)) {
    install.packages("palmerpenguins")
  }
  
  # Load the penguins dataset
  data("penguins", package = "palmerpenguins")
  
  # Clean the data (remove NA values)
  penguins_clean <- na.omit(penguins)
  
  # Create a small sample dataset with a non-linear relationship
  set.seed(789)
  n <- 100
  x <- runif(n, 0, 10)
  y <- 20 * exp(-0.5 * x) + rnorm(n, 0, 1)
  nonlinear_data <- data.frame(x = x, y = y)
  
  # Create a simulated hierarchical dataset using penguins species as inspiration
  set.seed(101)
  n_groups <- 3  # 3 penguin species
  n_per_group <- 50
  group_id <- rep(1:n_groups, each = n_per_group)
  group_intercepts <- c(3700, 4300, 5100)  # Approximating Adelie, Chinstrap, Gentoo masses
  x <- runif(n_groups * n_per_group, 180, 230)  # Range of flipper lengths
  sigma_group <- c(350, 400, 450)  # Different variability by species
  y <- rep(0, n_groups * n_per_group)
  for (i in 1:length(y)) {
    g <- group_id[i]
    y[i] <- group_intercepts[g] + 25 * (x[i] - 200) + rnorm(1, 0, sigma_group[g])
  }
  species_names <- c("Adelie", "Chinstrap", "Gentoo")
  multilevel_data <- data.frame(
    species = factor(species_names[group_id]),
    flipper_length_mm = x,
    body_mass_g = y
  )
  
  # Create a sample dataset for logistic regression (modeling penguin sex)
  # Using bill depth and bill length to predict sex
  set.seed(202)
  if (requireNamespace("dplyr", quietly = TRUE)) {
    penguins_sex <- dplyr::filter(penguins, !is.na(sex)) %>%
      dplyr::select(sex, bill_depth_mm, bill_length_mm) %>%
      dplyr::mutate(sex = factor(sex, levels = c("female", "male")))
  } else {
    # Fallback without dplyr
    penguins_sex <- penguins[!is.na(penguins$sex), c("sex", "bill_depth_mm", "bill_length_mm")]
    penguins_sex$sex <- factor(penguins_sex$sex, levels = c("female", "male"))
  }
  
  # Save all data objects to the package data directory
  save(penguins_clean, file = "data/penguins_clean.rda")
  save(nonlinear_data, file = "data/nonlinear_data.rda")
  save(multilevel_data, file = "data/multilevel_data.rda")
  save(penguins_sex, file = "data/penguins_sex.rda")
  
  # Print confirmation
  cat("Data objects have been generated and saved successfully.\n")
}

# Immediately generate the data when this file is sourced during build
# This will ensure the data is available when the package is installed
if (FALSE) {  # Only run manually, not during package loading
  generate_package_data()
} 