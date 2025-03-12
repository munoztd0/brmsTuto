# Create sample data files for the package
# Run this file directly to generate the data

# Load required packages
if (!requireNamespace("palmerpenguins", quietly = TRUE)) {
  install.packages("palmerpenguins")
}
library(palmerpenguins)

# Load and clean the penguins dataset
data("penguins")
penguins_clean <- na.omit(penguins)

# Create nonlinear data
set.seed(789)
n <- 100
x <- runif(n, 0, 10)
y <- 20 * exp(-0.5 * x) + rnorm(n, 0, 1)
nonlinear_data <- data.frame(x = x, y = y)

# Create multilevel data
set.seed(101)
n_groups <- 3
n_per_group <- 50
group_id <- rep(1:n_groups, each = n_per_group)
group_intercepts <- c(3700, 4300, 5100)
x <- runif(n_groups * n_per_group, 180, 230)
sigma_group <- c(350, 400, 450)
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

# Create penguin sex data
penguins_sex <- penguins[!is.na(penguins$sex), c("sex", "bill_depth_mm", "bill_length_mm")]
penguins_sex$sex <- factor(penguins_sex$sex, levels = c("female", "male"))

# Save all data objects
save(penguins_clean, file = "data/penguins_clean.rda")
save(nonlinear_data, file = "data/nonlinear_data.rda")
save(multilevel_data, file = "data/multilevel_data.rda")
save(penguins_sex, file = "data/penguins_sex.rda")

cat("Data files created successfully in the data/ directory.\n") 