# Best Practices for AI-Assisted Data Analysis

**⏱️ Workshop Section 4: 20-30 minutes**

Now that you know HOW to use AI for analysis, let's focus on using it WELL and SAFELY.

## 🎯 Learning Goals

- Develop critical thinking about AI outputs
- Avoid common pitfalls
- Build good habits for reproducible research
- Know when to trust vs. verify

---

## ✅ The Verification Checklist

**Use this EVERY TIME you run AI-generated code:**

### Before Running Code

- [ ] **Read and understand** - Can you explain what the code does?
- [ ] **Check variable names** - Do they match your dataset?
- [ ] **Look for hardcoded values** - Are file paths correct?
- [ ] **Check for required packages** - Are they installed?

### While Running Code

- [ ] **Run incrementally** - One section at a time
- [ ] **Watch for errors** - Red text = something's wrong
- [ ] **Check warnings** - Yellow text = potential issues
- [ ] **Monitor outputs** - Do intermediate results look right?

### After Running Code

- [ ] **Verify numbers** - Do they make biological/clinical sense?
- [ ] **Check sample sizes** - Match your expectations?
- [ ] **Inspect visualizations** - Axes labeled? Legend clear?
- [ ] **Validate statistics** - P-values, confidence intervals reasonable?
- [ ] **Compare methods** - Does the approach match your question?

---

## 🚨 Common Pitfalls and How to Avoid Them

### Pitfall 1: Blind Trust in AI

**Problem:** Running code without understanding it.

**Example:**
```r
# AI might generate:
model <- glm(Status ~ Time, family = binomial)
```

**Why it's wrong:** This models Status (outcome) as a function of Time (which is backwards for survival data).

**Solution:** Always ask yourself: "Does this make scientific sense?"

### Pitfall 2: Ignoring Data Types

**Problem:** AI assumes variable types that may be wrong.

**Example:**
```r
# Your Treatment is coded 0/1, but AI treats it as numeric
mean(data$Treatment)  # Gives 0.5, which is meaningless
```

**Solution:** Convert categorical variables explicitly:
```r
data$Treatment <- factor(data$Treatment, 
                         levels = c(0, 1), 
                         labels = c("Control", "Treatment"))
```

### Pitfall 3: Missing Data Ignored

**Problem:** AI code doesn't handle missing values.

**Example:**
```r
mean(data$Age)  # Returns NA if any missing values
```

**Solution:** Be explicit about missing data:
```r
mean(data$Age, na.rm = TRUE)  # Remove NAs
# OR first check: sum(is.na(data$Age))
```

### Pitfall 4: Wrong Statistical Test

**Problem:** AI chooses inappropriate tests.

**Example:** Using t-test on non-normal data, or not checking assumptions.

**Solution:** Always ask AI: "What are the assumptions of this test? Should we check them?"

### Pitfall 5: Over-Complicated Code

**Problem:** AI generates complex code for simple tasks.

**Example:**
```r
# Complex version
result <- data %>% 
  group_by(Treatment) %>% 
  summarise(n = n()) %>% 
  ungroup() %>% 
  mutate(prop = n/sum(n))

# Simple version
table(data$Treatment)
```

**Solution:** Ask AI: "Can you simplify this code?"

---

## 💡 Good Habits to Develop

### 1. Comment Your Code

**Bad:**
```r
data <- read.csv("ovarian.csv")
data$Treatment <- factor(data$Treatment)
summary(data)
```

**Good:**
```r
# Load ovarian cancer dataset
data <- read.csv("data/ovarian.csv")

# Convert treatment to factor for proper analysis
# 0 = Control, 1 = Treatment
data$Treatment <- factor(data$Treatment, 
                         levels = c(0, 1),
                         labels = c("Control", "Treatment"))

# Check data structure and summary statistics
summary(data)
```

### 2. Use Meaningful Variable Names

**Bad:**
```r
x <- read.csv("ovarian.csv")
y <- subset(x, x$Treatment == 1)
z <- mean(y$Time)
```

**Good:**
```r
ovarian_data <- read.csv("data/ovarian.csv")
treatment_group <- subset(ovarian_data, Treatment == 1)
mean_survival_treatment <- mean(treatment_group$Time)
```

### 3. Save Your Work Incrementally

- **Save your script frequently** (`Ctrl+S`)
- **Test code as you go** - don't write 100 lines then run
- **Keep versions** - if making big changes, save a copy first

### 4. Organize Your Files

```
my_project/
├── data/
│   └── ovarian.csv
├── scripts/
│   ├── 01_data_cleaning.R
│   ├── 02_exploratory_analysis.R
│   └── 03_statistical_tests.R
├── output/
│   ├── figures/
│   └── tables/
└── README.md
```

### 5. Document Your Decisions

At the top of your script:
```r
# Ovarian Cancer Analysis
# Date: 2026-03-18
# Analyst: Your Name
# 
# Purpose: Analyze survival differences between treatment groups
#
# Data source: Cancer Informatics simulated dataset
# 
# Key decisions:
# - Excluded patients with Time < 0 (n=0, none found)
# - Used log-rank test for group comparison (appropriate for survival data)
# - Alpha level: 0.05
```

---

## 🔍 How to Verify Statistical Results

### Sanity Checks

**Sample sizes:**
```r
# Always check your Ns
table(data$Treatment)
# Do these match what you expect?
```

**Ranges:**
```r
# Check for impossible values
summary(data$Time)
# Can survival time be negative? No!
# Are there values > study duration? Check!
```

**Percentages:**
```r
# Proportions should sum to 100%
prop.table(table(data$Treatment, data$Status))
```

### Cross-Validation Methods

**Compare visualizations with statistics:**
- If boxplot shows overlap, don't expect p < 0.001
- If survival curves are identical, p-value should be high
- If you see clear separation, expect significant p-value

**Use multiple approaches:**
```r
# Compare methods:
# Method 1: Kaplan-Meier with log-rank test
# Method 2: Cox proportional hazards
# Results should generally agree
```

**Calculate by hand (for key results):**
```r
# AI says: mean survival = 18.5 months
# Verify: mean(data$Time)
```

---

## 🎯 When to Use Each AI Mode (Review)

### Use Chat Mode When:
- ✅ You need to understand a concept
- ✅ You're getting an error and don't know why
- ✅ You want to know if an approach is appropriate
- ✅ You need to choose between methods

### Use Edit Mode When:
- ✅ You have working code that needs small changes
- ✅ You want to adjust plot aesthetics
- ✅ You need to rename variables consistently
- ✅ You want to add error handling

### Use Agent Mode When:
- ✅ Starting a new analysis from scratch
- ✅ You need multiple steps completed
- ✅ Creating standard reports or summaries
- ✅ Generating boilerplate code

### Use Autocomplete When:
- ✅ You know what you want to write
- ✅ You're typing function names
- ✅ You want to speed up coding
- ✅ You're following a pattern

---

## 🚩 Red Flags: When to Stop and Question

Stop and verify carefully if you see:

1. **P-value = 0.000** - Very unlikely; probably means p < 0.001
2. **Perfect correlation (r = 1.0)** - Rare in real data; check for duplicates
3. **Huge effect sizes** - Are they biologically plausible?
4. **No missing data mentioned** - Real data often has missing values
5. **Warnings ignored** - Warnings are there for a reason
6. **Conflicting results** - Plot shows no difference but p < 0.05?

---

## 💬 Prompts for Quality Control

After getting results, ask Copilot:

**"Check my analysis:"**
```
"Review this code and tell me:
1. Are there any statistical issues?
2. Am I handling missing data appropriately?
3. Are the assumptions for this test met?
4. Should I be concerned about anything?"
```

**"Explain the results:"**
```
"Explain these results in plain language:
[paste your output]

What does this mean for the research question?
Are there limitations I should mention?"
```

**"Validate my interpretation:"**
```
"I interpret this p-value of 0.023 to mean that treatment 
significantly improves survival. Is this correct? 
What caveats should I include?"
```

---

## 🎓 Principles of Reproducible Research

### Make Your Analysis Reproducible

**What this means:** Someone else (including future you!) can run your code and get the same results.

**How to achieve it:**

1. **Use relative paths:**
   ```r
   # Bad:
   data <- read.csv("/home/john/Desktop/ovarian.csv")
   
   # Good:
   data <- read.csv("data/ovarian.csv")
   ```

2. **Set random seeds (when using randomization):**
   ```r
   set.seed(123)  # Makes random results reproducible
   ```

3. **Document your R version and packages:**
   ```r
   sessionInfo()  # Run at end of script
   ```

4. **Don't manually edit data:**
   - If you need to exclude observations, do it in code
   - Document WHY you excluded them

---

## ✨ Pro Tips from Experienced Researchers

### 1. The "Explain to a Colleague" Test
If you can't explain what your code does to a colleague, you don't understand it well enough.

### 2. The "Six Months Later" Test
Will you understand this code in six months? Add comments for future you.

### 3. The "Too Good to Be True" Test
If results seem perfect, they probably aren't. Look for errors.

### 4. The "One Change at a Time" Principle
If code breaks after changes, you'll know which change caused it.

### 5. Always Plot First
Visualize before running statistical tests. Your eyes are powerful statistical tools.

---

## 📋 Quick Reference: Analysis Checklist

Print this and keep it next to you during analysis:

```
□ Data loaded correctly (right file, right format)
□ Variables have correct types (factor vs numeric)
□ Missing data checked and handled
□ Sample sizes verified (N in each group)
□ Distributions visualized
□ Outliers identified and addressed
□ Assumptions checked (for statistical tests)
□ Results match visualizations
□ Effect sizes make clinical/biological sense
□ Code is commented and organized
□ Analysis can be reproduced
□ Results interpreted in context
□ Limitations documented
```

---

## 🎯 Practice Exercise

### Exercise: Review This Code

Look at this AI-generated code. What's wrong with it?

```r
# Load data
data <- read.csv("ovarian.csv")

# Analyze survival
result <- t.test(Time ~ Treatment, data = data)
print(result)

# Make plot
plot(data$Treatment, data$Time)
```

<details>
<summary>Click for issues and fixes</summary>

**Issues:**

1. **Wrong test:** t-test is inappropriate for survival data (ignores censoring)
2. **No path:** File path should be "data/ovarian.csv"
3. **No factor conversion:** Treatment should be a factor
4. **Missing Status variable:** Survival analysis needs to know who had events
5. **Poor visualization:** This plot type doesn't show survival well
6. **No comments:** What's the purpose? What do results mean?
7. **No verification:** No checks of assumptions or data quality

**Better version:**

```r
# Ovarian Cancer Survival Analysis
# Compare survival between treatment groups

# Load required libraries
library(survival)
library(survminer)

# Load data
ovarian_data <- read.csv("data/ovarian.csv")

# Convert to factors
ovarian_data$Treatment <- factor(ovarian_data$Treatment,
                                  levels = c(0, 1),
                                  labels = c("Control", "Treatment"))

# Check data
summary(ovarian_data)
table(ovarian_data$Treatment, ovarian_data$Status)

# Create survival object (accounts for censoring)
surv_obj <- Surv(time = ovarian_data$Time, 
                 event = ovarian_data$Status)

# Kaplan-Meier survival curves
km_fit <- survfit(surv_obj ~ Treatment, data = ovarian_data)

# Visualize
ggsurvplot(km_fit, 
           data = ovarian_data,
           pval = TRUE,
           conf.int = TRUE,
           title = "Survival by Treatment Group")

# Log-rank test (appropriate for survival data)
survdiff(surv_obj ~ Treatment, data = ovarian_data)
```

</details>

---

## 🎓 Key Takeaways

✅ Always verify AI outputs - you're the expert on your data  
✅ Use the verification checklist every time  
✅ Develop good coding habits: comments, organization, reproducibility  
✅ Question results that seem too good or don't match expectations  
✅ Choose the right AI mode for each task  
✅ Plot first, test second  
✅ Document your decisions and limitations

---

**Next:** [Resources & Next Steps →](../05-resources/README.md)
