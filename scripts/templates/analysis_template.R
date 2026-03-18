# ==============================================================================
# Project: [Your Project Name]
# Script: [Script Purpose]
# Author: [Your Name]
# Date: [Date]
# ==============================================================================

# Purpose:
# [Describe what this script does]

# Input:
# - [List input files]

# Output:
# - [List output files/results]

# ==============================================================================
# 1. SETUP
# ==============================================================================

# Clear environment (optional - use with caution)
# rm(list = ls())

# Load required libraries
library(tidyverse)    # Data manipulation and visualization
library(here)         # File path management

# Set options
options(scipen = 999)  # Disable scientific notation
options(stringsAsFactors = FALSE)  # Don't auto-convert strings to factors

# ==============================================================================
# 2. LOAD DATA
# ==============================================================================

# Load your data
# Adjust the path to your data file
data <- read.csv(here("data", "your_data.csv"))

# Initial data inspection
cat("Dataset dimensions:", nrow(data), "rows x", ncol(data), "columns\n")
head(data)
str(data)

# ==============================================================================
# 3. DATA CLEANING
# ==============================================================================

# Check for missing values
cat("\nMissing values per column:\n")
colSums(is.na(data))

# Convert variables to appropriate types
# Example: data$category <- factor(data$category)

# Check for duplicates
duplicates <- sum(duplicated(data))
cat("\nNumber of duplicate rows:", duplicates, "\n")

# ==============================================================================
# 4. EXPLORATORY ANALYSIS
# ==============================================================================

# Summary statistics
summary(data)

# For categorical variables
# table(data$variable)

# For continuous variables
# hist(data$variable)

# ==============================================================================
# 5. STATISTICAL ANALYSIS
# ==============================================================================

# Your main analysis goes here

# ==============================================================================
# 6. VISUALIZATIONS
# ==============================================================================

# Create your plots here

# ==============================================================================
# 7. SAVE RESULTS
# ==============================================================================

# Save processed data
# write.csv(data_clean, here("data", "processed", "data_clean.csv"), 
#           row.names = FALSE)

# Save plots
# ggsave(here("output", "figures", "plot1.png"), 
#        width = 8, height = 6, dpi = 300)

# ==============================================================================
# 8. SESSION INFO
# ==============================================================================

# Document R version and packages used (important for reproducibility!)
sessionInfo()
