# Ovarian Cancer Dataset - Data Dictionary

## Overview

This is a **simulated dataset** from the Cancer Informatics project, representing a clinical trial for ovarian cancer patients. The data contains survival information for patients randomized to treatment vs. control, stratified by risk status.

**Source:** [Cancer Informatics - Ovarian Cancer Dataset](https://cancer-informatics.org/de/docs/using_R/ovarian%20cancer)

---

## Variables

### Treatment
- **Type:** Binary (Categorical)
- **Values:** 
  - `0` = Control (no treatment)
  - `1` = Treatment (experimental treatment)
- **Description:** Treatment group assignment in the clinical trial
- **Analysis note:** Should be converted to a factor for proper analysis

### HighRisk
- **Type:** Binary (Categorical)
- **Values:**
  - `0` = Low risk patient
  - `1` = High risk patient
- **Description:** Patient risk stratification based on clinical characteristics
- **Analysis note:** This is a stratification variable; analyses should consider both treatment and risk status

### Time
- **Type:** Continuous (Numeric)
- **Units:** Months
- **Range:** Positive values (minimum > 0)
- **Description:** Survival time or time to event/censoring
- **Interpretation:**
  - For patients with Status=1: Time from enrollment to death
  - For patients with Status=0: Time from enrollment to last follow-up (censored)
- **Analysis note:** This is the time variable for survival analysis

### Status
- **Type:** Binary (Categorical)
- **Values:**
  - `0` = Censored (patient still alive at last follow-up or lost to follow-up)
  - `1` = Event occurred (death)
- **Description:** Event status indicator for survival analysis
- **Analysis note:** This is the event indicator for survival analysis; censored observations provide partial information

---

## Dataset Characteristics

- **Total observations:** 638 patients
- **Study design:** Randomized controlled trial
- **Outcome:** Survival (time to death)
- **Primary comparison:** Treatment vs. Control
- **Stratification factor:** Risk status (High vs. Low)

---

## Typical Research Questions

1. **Primary question:** Does the experimental treatment improve survival compared to control?
2. **Secondary questions:**
   - Does treatment effect differ by risk status?
   - What is the median survival in each group?
   - What proportion of patients survive beyond a certain time point?

---

## Statistical Considerations

### Appropriate Analyses
- **Kaplan-Meier survival curves** - Visualize survival over time
- **Log-rank test** - Compare survival between groups
- **Cox proportional hazards** - Model effects of treatment and risk
- **Median survival estimates** - Summary measure for each group

### Important Notes
- **Censoring:** This is survival data with censoring; standard t-tests or linear regression are NOT appropriate
- **Time-to-event:** The outcome is not just "alive/dead" but the time until the event
- **Right censoring:** Some patients are still alive at study end (Status=0)

---

## Quality Checks to Perform

✅ No missing values (this is a complete dataset)  
✅ All Status values are 0 or 1  
✅ All Treatment values are 0 or 1  
✅ All HighRisk values are 0 or 1  
✅ All Time values are positive  
✅ No duplicate patient records  

---

## Example Code for Loading

```r
# Load the data
ovarian_data <- read.csv("data/ovarian.csv")

# Convert to factors with meaningful labels
ovarian_data$Treatment <- factor(ovarian_data$Treatment,
                                  levels = c(0, 1),
                                  labels = c("Control", "Treatment"))

ovarian_data$HighRisk <- factor(ovarian_data$HighRisk,
                                levels = c(0, 1),
                                labels = c("Low Risk", "High Risk"))

# View structure
str(ovarian_data)
```

---

## References

- Original source: Cancer Informatics Project
- URL: https://cancer-informatics.org/de/docs/using_R/ovarian%20cancer
- R survival package documentation: https://cran.r-project.org/web/packages/survival/
