# ==============================================================================
# Ovarian Cancer Dataset - Complete Analysis Example
# ==============================================================================
# This is a complete example analysis that demonstrates the workflow
# You can use this as a reference during the workshop

# ==============================================================================
# SETUP
# ==============================================================================

library(tidyverse)
library(survival)
library(survminer)

# ==============================================================================
# LOAD AND INSPECT DATA
# ==============================================================================

# Load the ovarian cancer dataset
ovarian_data <- read.csv("data/ovarian.csv")

# View structure
str(ovarian_data)
head(ovarian_data, 10)

# Basic information
cat("Total number of patients:", nrow(ovarian_data), "\n")
cat("Number of variables:", ncol(ovarian_data), "\n")

# ==============================================================================
# DATA PREPARATION
# ==============================================================================

# Convert to factors with meaningful labels
ovarian_data$Treatment <- factor(ovarian_data$Treatment, 
                                  levels = c(0, 1),
                                  labels = c("Control", "Treatment"))

ovarian_data$HighRisk <- factor(ovarian_data$HighRisk,
                                levels = c(0, 1),
                                labels = c("Low Risk", "High Risk"))

ovarian_data$Status <- factor(ovarian_data$Status,
                               levels = c(0, 1),
                               labels = c("Censored", "Event"))

# ==============================================================================
# DESCRIPTIVE STATISTICS
# ==============================================================================

# Sample sizes by group
cat("\nPatients by Treatment Group:\n")
table(ovarian_data$Treatment)

cat("\nPatients by Risk Category:\n")
table(ovarian_data$HighRisk)

cat("\nCross-tabulation (Treatment x Risk):\n")
table(ovarian_data$Treatment, ovarian_data$HighRisk)

# Survival time statistics
cat("\nSurvival Time Statistics (months):\n")
summary(ovarian_data$Time)

# Event rates
cat("\nEvent Status:\n")
table(ovarian_data$Status)
cat("\nEvent rate:", 
    round(sum(ovarian_data$Status == "Event") / nrow(ovarian_data) * 100, 1), "%\n")

# ==============================================================================
# DATA QUALITY CHECKS
# ==============================================================================

# Check for missing values
cat("\nMissing values:\n")
colSums(is.na(ovarian_data))

# Check for impossible values
cat("\nRange of Time variable:", min(ovarian_data$Time), "to", max(ovarian_data$Time), "\n")

# ==============================================================================
# VISUALIZATIONS
# ==============================================================================

# Histogram of survival times by treatment
ggplot(ovarian_data, aes(x = Time, fill = Treatment)) +
  geom_histogram(bins = 30, alpha = 0.7, position = "identity") +
  labs(title = "Distribution of Survival Times by Treatment",
       x = "Survival Time (months)",
       y = "Count") +
  theme_minimal()

# Boxplot comparing groups
ggplot(ovarian_data, aes(x = Treatment, y = Time, fill = Treatment)) +
  geom_boxplot() +
  labs(title = "Survival Time by Treatment Group",
       x = "Treatment",
       y = "Survival Time (months)") +
  theme_minimal()

# Boxplot with all four groups
ovarian_data$Group <- paste(ovarian_data$Treatment, ovarian_data$HighRisk, sep = " - ")

ggplot(ovarian_data, aes(x = Group, y = Time, fill = Treatment)) +
  geom_boxplot() +
  labs(title = "Survival Time by Treatment and Risk Status",
       x = "Group",
       y = "Survival Time (months)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# ==============================================================================
# SURVIVAL ANALYSIS
# ==============================================================================

# Create survival object (convert factors back to numeric for survival package)
surv_obj <- Surv(time = ovarian_data$Time, 
                 event = as.numeric(ovarian_data$Status) - 1)  # 0=censored, 1=event

# Kaplan-Meier survival curves by treatment
km_treatment <- survfit(surv_obj ~ Treatment, data = ovarian_data)

# Plot survival curves
ggsurvplot(km_treatment, 
           data = ovarian_data,
           pval = TRUE,
           conf.int = TRUE,
           risk.table = TRUE,
           title = "Kaplan-Meier Survival Curves by Treatment",
           xlab = "Time (months)",
           ylab = "Survival Probability",
           legend.title = "Treatment",
           palette = c("blue", "red"))

# Log-rank test
survdiff_result <- survdiff(surv_obj ~ Treatment, data = ovarian_data)
print(survdiff_result)

# Summary statistics by group
summary(km_treatment)

# Median survival times
cat("\nMedian survival times:\n")
print(km_treatment)

# ==============================================================================
# SUMMARY TABLE
# ==============================================================================

# Create summary table
summary_table <- ovarian_data %>%
  mutate(Event_numeric = as.numeric(Status) - 1) %>%
  group_by(Treatment, HighRisk) %>%
  summarise(
    N = n(),
    Events = sum(Event_numeric),
    Censored = sum(1 - Event_numeric),
    Median_Survival = median(Time),
    Mean_Survival = mean(Time),
    SD_Survival = sd(Time),
    .groups = "drop"
  )

print(summary_table)

# ==============================================================================
# SESSION INFO
# ==============================================================================

sessionInfo()
