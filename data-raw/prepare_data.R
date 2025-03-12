# Script to prepare example datasets for the brms tutorial
library(brms)
library(dplyr)
library(palmerpenguins)

# Load the penguins dataset
data(penguins)
# Clean the data (remove NA values)
penguins_clean <- na.omit(penguins)

# Pre-fit models to save time during the tutorial
# Simple linear regression model (body mass predicted by flipper length)
if (!file.exists("inst/tutorials/intro_to_brms/prefit_model1.rds")) {
  prefit_model1 <- brm(body_mass_g ~ flipper_length_mm, data = penguins_clean, 
                      family = gaussian(), 
                      file = "inst/tutorials/intro_to_brms/prefit_model1",
                      seed = 123)
  saveRDS(prefit_model1, "inst/tutorials/intro_to_brms/prefit_model1.rds")
}

# Multiple regression model (body mass predicted by flipper length and bill length)
if (!file.exists("inst/tutorials/intro_to_brms/prefit_model2.rds")) {
  prefit_model2 <- brm(body_mass_g ~ flipper_length_mm + bill_length_mm, 
                      data = penguins_clean, 
                      family = gaussian(), 
                      file = "inst/tutorials/intro_to_brms/prefit_model2",
                      seed = 456)
  saveRDS(prefit_model2, "inst/tutorials/intro_to_brms/prefit_model2.rds")
}

# Create a small sample dataset with a non-linear relationship
set.seed(789)
n <- 100
x <- runif(n, 0, 10)
y <- 20 * exp(-0.5 * x) + rnorm(n, 0, 1)
nonlinear_data <- data.frame(x = x, y = y)

# Save the datasets to the package's data directory using usethis
# First, ensure we're in the package directory
# Setting internal = FALSE makes these datasets available to package users
usethis::use_data(nonlinear_data, overwrite = TRUE, internal = FALSE)

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

# Save the dataset
usethis::use_data(multilevel_data, overwrite = TRUE, internal = FALSE)

# Create a sample dataset for logistic regression (modeling penguin sex)
# Using bill depth and bill length to predict sex
set.seed(202)
penguins_sex <- penguins %>%
  filter(!is.na(sex)) %>%
  select(sex, bill_depth_mm, bill_length_mm) %>%
  mutate(sex = factor(sex, levels = c("female", "male")))

# Save the dataset
usethis::use_data(penguins_sex, overwrite = TRUE, internal = FALSE)

# Save clean penguins data for the tutorial
usethis::use_data(penguins_clean, overwrite = TRUE, internal = FALSE)

# Print a confirmation message
cat("All datasets have been saved to the package data directory.\n") 