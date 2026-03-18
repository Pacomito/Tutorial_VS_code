# Resources & Next Steps

**⏱️ Workshop Section 5: 10-15 minutes**

Congratulations on completing the workshop! Here's everything you need to continue your journey.

## 🎉 What You've Accomplished

You now know how to:
- ✅ Set up VS Code for R data analysis
- ✅ Use GitHub Copilot's different modes effectively
- ✅ Follow a systematic data analysis workflow
- ✅ Create visualizations and perform statistical analyses
- ✅ Verify and validate AI-generated code
- ✅ Apply best practices for reproducible research

---

## 🆘 Troubleshooting Guide

### Common Issues and Solutions

#### VS Code Issues

**Problem: R Extension Not Working**
```
Symptoms: R code doesn't run, no syntax highlighting
Solutions:
1. Check R is installed: Open terminal, type 'R --version'
2. Reinstall R extension in VS Code
3. Reload VS Code window: Ctrl+Shift+P → "Reload Window"
4. Check R path in settings: Search for "r.rpath.linux" in settings
```

**Problem: Terminal Won't Open R**
```
Symptoms: Nothing happens when running R code
Solutions:
1. Open terminal manually: Ctrl+`
2. Type 'R' to start R manually
3. Check if R is in your PATH
4. Restart VS Code
```

**Problem: Plots Don't Appear**
```
Symptoms: Code runs but no visualization shows
Solutions:
1. Install httpgd: install.packages("httpgd")
2. Check if plot viewer panel is open
3. Use X11() or other graphics device explicitly
4. Save plots to file instead: ggsave("plot.png")
```

#### GitHub Copilot Issues

**Problem: Copilot Not Suggesting Code**
```
Symptoms: No gray text suggestions appear
Solutions:
1. Check Copilot icon in status bar (bottom right)
2. Verify you're signed in to GitHub
3. Check subscription is active: github.com/settings/copilot
4. Disable and re-enable Copilot extension
5. Try Ctrl+Shift+P → "Copilot: Enable"
```

**Problem: Chat Panel Won't Open**
```
Symptoms: Can't access Copilot chat
Solutions:
1. Install "GitHub Copilot Chat" extension
2. Sign in to GitHub in VS Code
3. Try Ctrl+Alt+I to open chat
4. Check View → Chat menu option
```

**Problem: Suggestions Are Irrelevant**
```
Symptoms: Copilot suggests wrong code
Solutions:
1. Provide more context in comments
2. Be more specific in prompts
3. Select relevant code before asking
4. Reject and try rephrasing your request
```

#### R Package Issues

**Problem: Package Installation Fails**
```
Symptoms: Error messages during install.packages()
Solutions:
1. Check internet connection
2. Try different CRAN mirror: chooseCRANmirror()
3. Install system dependencies (Linux):
   - For tidyverse: sudo apt-get install libcurl4-openssl-dev libssl-dev libxml2-dev
4. Restart R session
```

**Problem: Library Won't Load**
```
Symptoms: Error: there is no package called 'X'
Solutions:
1. Install the package first: install.packages("package_name")
2. Check spelling of package name
3. Make sure installation completed successfully
4. Update packages: update.packages()
```

#### Data Loading Issues

**Problem: File Not Found**
```
Symptoms: Error: cannot open file 'data.csv'
Solutions:
1. Check file path is correct
2. Use relative paths: "data/file.csv" not full paths
3. Check working directory: getwd()
4. Set working directory: setwd("path/to/project")
5. Use here package: library(here); here("data", "file.csv")
```

**Problem: Data Loads but Looks Wrong**
```
Symptoms: Weird column names, wrong separators
Solutions:
1. Check file encoding
2. Specify separator: read.csv("file.csv", sep = ";")
3. Use read.csv2() for European format
4. Try readr::read_csv() for better auto-detection
5. Open CSV in text editor to inspect format
```

---

## 📚 Learning Resources

### R Basics

**Official R Documentation**
- R Project: https://www.r-project.org/
- CRAN Task Views: https://cran.r-project.org/web/views/

**Online Tutorials**
- R for Data Science (free book): https://r4ds.had.co.nz/
- Swirl (interactive R tutorials): https://swirlstats.com/

### Statistics for Clinical Research

**Survival Analysis**
- Survival Analysis in R: https://www.emilyzabor.com/tutorials/survival_analysis_in_r_tutorial.html
- STHDA Survival Analysis: http://www.sthda.com/english/wiki/survival-analysis

**Clinical Trial Analysis**
- Cancer Informatics: https://cancer-informatics.org/
- Clinical Trials with R and Shiny: https://clinicaltrials.gov/

### VS Code Tips

**VS Code Documentation**
- Official docs: https://code.visualstudio.com/docs
- R in VS Code: https://code.visualstudio.com/docs/languages/r

**Keyboard Shortcuts**
- Windows/Linux: Ctrl+K Ctrl+S to view all shortcuts
- Mac: Cmd+K Cmd+S

### GitHub Copilot

**Learning Resources**
- Copilot documentation: https://docs.github.com/copilot
- Prompt engineering guide: https://github.blog/category/engineering/copilot/

---

## 🔧 Template for Your Own Projects

### Project Structure Template

Create this structure for each new analysis:

```
my_analysis_project/
├── data/
│   ├── raw/              # Original data (never modify!)
│   │   └── my_data.csv
│   └── processed/        # Cleaned data
│       └── my_data_clean.csv
├── scripts/
│   ├── 01_load_and_clean.R
│   ├── 02_exploratory_analysis.R
│   ├── 03_statistical_tests.R
│   └── 04_create_figures.R
├── output/
│   ├── figures/
│   │   ├── fig1_demographics.png
│   │   └── fig2_survival_curve.png
│   └── tables/
│       └── table1_summary.csv
├── README.md             # Project description
└── analysis_notes.md     # Your working notes
```

### Script Template

Save this as `template_analysis.R`:

```r
# ==============================================================================
# Project: [Project Name]
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

# Clear environment (optional)
rm(list = ls())

# Load required libraries
library(tidyverse)    # Data manipulation and visualization
library(here)         # File path management
# Add other libraries as needed

# Set options
options(scipen = 999)  # Disable scientific notation

# ==============================================================================
# 2. LOAD DATA
# ==============================================================================

# Load data
data <- read.csv(here("data", "raw", "my_data.csv"))

# Check data structure
str(data)
head(data)

# ==============================================================================
# 3. DATA CLEANING
# ==============================================================================

# Check for missing values
colSums(is.na(data))

# Convert variables to appropriate types
# [Your code here]

# ==============================================================================
# 4. EXPLORATORY ANALYSIS
# ==============================================================================

# Summary statistics
summary(data)

# Visualizations
# [Your code here]

# ==============================================================================
# 5. STATISTICAL ANALYSIS
# ==============================================================================

# [Your analysis here]

# ==============================================================================
# 6. SAVE RESULTS
# ==============================================================================

# Save processed data
# write.csv(data_clean, here("data", "processed", "data_clean.csv"), row.names = FALSE)

# Save plots
# ggsave(here("output", "figures", "plot1.png"), width = 8, height = 6)

# ==============================================================================
# 7. SESSION INFO
# ==============================================================================

# Document R version and packages used
sessionInfo()
```

### README Template

Save this as your project `README.md`:

```markdown
# [Project Title]

## Overview
Brief description of the project and research question.

## Data
- **Source**: Where the data came from
- **Variables**: List of key variables and their meanings
- **Sample size**: N = XXX

## Analysis Plan
1. Data cleaning and preparation
2. Descriptive statistics
3. [Specific analyses]

## Scripts
- `01_load_and_clean.R` - Data loading and cleaning
- `02_exploratory_analysis.R` - Descriptive statistics and plots
- `03_statistical_tests.R` - Hypothesis testing

## Key Findings
[To be completed after analysis]

## Notes
- [Any important notes or decisions]
```

---

## 🎯 Next Steps: Your Action Plan

### Week 1: Practice with Tutorial Data
- [ ] Re-run the ovarian cancer analysis on your own
- [ ] Modify the visualizations to your preferences
- [ ] Try different statistical approaches
- [ ] Experiment with all Copilot modes

### Week 2: Explore Your Own Data
- [ ] Set up a project folder for your data
- [ ] Load your dataset into VS Code
- [ ] Perform exploratory analysis
- [ ] Create basic visualizations

### Week 3: Deepen Your Skills
- [ ] Learn one new R package relevant to your work
- [ ] Create a reusable template for your analyses
- [ ] Practice writing better prompts for Copilot
- [ ] Document your code with clear comments

### Ongoing
- [ ] Join R/stats communities (R-bloggers, Stack Overflow)
- [ ] Keep a "learning log" of new techniques
- [ ] Share your progress with colleagues
- [ ] Ask for help when stuck (it's normal!)

---

## 💬 Prompts Library

Save these prompts for common tasks:

### Data Loading and Cleaning
```
"Load the CSV file [filename]. Check for missing values, 
show summary statistics, and identify any potential data quality issues."
```

### Descriptive Statistics
```
"Create a comprehensive summary table for [dataset] with:
- Variable names
- N (total observations)
- N missing
- Mean and SD (for continuous variables)
- Frequencies (for categorical variables)"
```

### Group Comparisons
```
"Compare [variable] between [groups]. Create an appropriate 
visualization and perform a statistical test. Explain which 
test was used and why."
```

### Survival Analysis
```
"Perform survival analysis on [dataset] with time variable [time_var] 
and event variable [event_var]. Create Kaplan-Meier curves for [groups] 
and perform log-rank test. Include confidence intervals and risk tables."
```

### Data Visualization
```
"Create a publication-quality [plot type] showing [variables]. 
Use a professional color scheme, add clear labels, and include 
a descriptive title. Make it suitable for a research presentation."
```

### Troubleshooting
```
"I'm getting this error: [paste error message]. 
What does it mean and how do I fix it?"
```

---

## 🤝 Getting Help

### When You're Stuck

1. **Read the error message carefully** - It often tells you exactly what's wrong
2. **Ask Copilot Chat** - Paste the error and ask for help
3. **Google the error** - Add "R" to your search
4. **Check Stack Overflow** - Lots of R questions answered there
5. **Ask a colleague** - Fresh eyes help!

### How to Ask Good Questions

When seeking help online or from Copilot:

**Include:**
- What you're trying to do
- What you've tried
- The exact error message
- A minimal reproducible example

**Example good question:**
```
I'm trying to create a boxplot comparing survival times between 
treatment groups in R. I used this code:

boxplot(Time ~ Treatment, data = ovarian_data)

But I get this error:
"Error in eval(expr, envir, enclos): object 'ovarian_data' not found"

I've already loaded the data with read.csv(). What am I missing?
```

---

## 🎓 Final Tips for Success

### Remember:
1. **Everyone starts somewhere** - You're already ahead by taking this workshop
2. **Mistakes are learning** - Every error teaches you something
3. **AI is a tool, not magic** - It helps, but you're in control
4. **Practice regularly** - Even 30 minutes/week maintains skills
5. **Community matters** - Don't hesitate to ask for help

### You Can Do This!

Data analysis is a skill that improves with practice. You now have:
- The tools (VS Code, R, Copilot)
- The knowledge (workflow, best practices)
- The resources (this tutorial, prompts, templates)

The rest is practice and persistence. Good luck!

---

## 📧 Workshop Feedback

We'd love to hear from you!

**What worked well?**
**What was confusing?**
**What would you like to learn next?**

[Your feedback helps us improve future workshops]

---

## 🌟 Keep Learning!

Recommended next topics:
- Advanced ggplot2 for publication-quality figures
- Writing functions to automate repetitive tasks
- Creating reproducible reports with R Markdown
- Version control with Git (when you're ready)
- Interactive visualizations with Shiny

---

**Congratulations on completing the workshop! 🎉**

You're now equipped to independently analyze your clinical and biological data. Remember: this tutorial will always be here as a reference. Come back to it whenever you need a refresher.

Happy analyzing! 📊🔬
