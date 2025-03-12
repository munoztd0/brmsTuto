# Introduction to Bayesian Regression with brms

This R package provides an interactive learnR tutorial for Bayesian regression modeling using the brms package. The tutorial covers the fundamental concepts of Bayesian statistics and teaches practical skills for fitting and interpreting Bayesian regression models using the Palmer Penguins dataset.

## Installation

You can install this tutorial package from GitHub:

```r
# Install remotes if necessary
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

# Install the tutorial package
remotes::install_github("your-username/brmsTutorial")
```

Or install it from your local directory:

```r
# Install the package from local directory
install.packages("path/to/brmsTutorial", repos = NULL, type = "source")
```

## Prerequisites

This tutorial requires the following R packages:

- learnr
- brms (>= 2.16.0)
- ggplot2
- dplyr
- tidyr
- bayesplot
- shiny
- rstan
- rstanarm
- posterior
- palmerpenguins

They will be installed automatically when you install this package.

## Running the Tutorial

After installing the package, you can run the tutorial with:

```r
learnr::run_tutorial("intro_to_brms", "brmsTutorial")
```

## Tutorial Content

The tutorial covers the following topics:

1. **Introduction to Bayesian Statistics** - Learn about the fundamental concepts of Bayesian inference, including prior and posterior distributions.

2. **Getting Started with brms** - An introduction to the brms package and its formula syntax.

3. **Building Your First Bayesian Model** - Step-by-step guide to fitting a simple linear regression model using brms and the Palmer Penguins dataset.

4. **Working with Priors** - Learn how to specify, check, and customize prior distributions.

5. **Multiple Predictors** - Extend your models to include multiple predictors.

6. **Posterior Predictive Checks** - Learn how to assess model fit and make predictions.

7. **Model Comparison** - Compare different models using information criteria.

8. **Advanced Topics** - Brief introduction to more advanced modeling capabilities in brms:
   - Different response distributions
   - Multilevel models
   - Non-linear models

## About the Dataset

This tutorial uses the Palmer Penguins dataset, which contains size measurements for three penguin species observed on three islands in the Palmer Archipelago, Antarctica. The dataset was collected by Dr. Kristen Gorman and the Palmer Station, Antarctica LTER.

Learn more about the dataset at [https://allisonhorst.github.io/palmerpenguins/](https://allisonhorst.github.io/palmerpenguins/)

## Feedback and Contributions

If you have suggestions for improvements or find bugs, please open an issue or submit a pull request on GitHub.

## License

This tutorial is licensed under the MIT License. 