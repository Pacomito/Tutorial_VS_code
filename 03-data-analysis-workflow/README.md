# Data Analysis Workflow

**⏱️ Workshop Section 3: 60-90 minutes**

This is the heart of the workshop! You'll learn a systematic approach to analyzing data and apply it to the ovarian cancer dataset.

## 🎯 Learning Goals

- Follow a structured approach to data analysis
- Apply each step to real clinical data
- Use AI effectively at each stage
- Develop critical thinking about results

---

## The Systematic Approach

When you receive a new dataset, follow this workflow:

```
1. UNDERSTAND YOUR DATA
   ↓
2. EXPLORE DESCRIPTIVELY
   ↓
3. CHECK DATA QUALITY
   ↓
4. ANSWER RESEARCH QUESTIONS
   ↓
5. DOCUMENT & COMMUNICATE
```

Let's explore each step in detail.

---

## Step 1: Understand Your Data 📋

### Questions to Ask

Before opening the data file, think about:

- **What is this dataset about?**
  - Study design? Observational or experimental?
  - Population studied?
  - Time period?

- **What variables do I have?**
  - What was measured?
  - What do the column names mean?
  
- **What types of variables?**
  - Categorical (groups, categories)
  - Continuous (measurements, numbers)
  - Time-related (dates, survival times)
  - Binary (yes/no, 0/1)

- **What is my research question?**
  - What do I want to know?
  - What comparisons matter?

### 💡 Using AI for This Step

**Chat prompt:**
```
"I have a dataset about [topic] with variables [list]. 
Can you help me understand what type of analysis would 
be appropriate?"
```

---

## Step 2: Explore Descriptively 📊

### Core Questions

- How many observations (rows) do I have?
- How many variables (columns)?
- What does the data look like?
- What are the basic statistics for each variable?

### Tasks

1. **Load the data**
2. **View first/last rows**
3. **Check structure and types**
4. **Calculate summary statistics**
5. **Understand distributions**

### 💡 Using AI for This Step

**Agent prompt:**
```
"Load the file [filename]. Show me:
1. The first 10 rows
2. The structure of the dataset
3. Summary statistics for all variables
4. The number of observations per group/category"
```

---

## Step 3: Check Data Quality 🔍

### Critical Checks

✅ **Missing data** - Are there NA values? How many? Where?  
✅ **Impossible values** - Negative ages? Dates in future?  
✅ **Outliers** - Values that seem wrong or extreme  
✅ **Consistency** - Do related variables make sense together?  
✅ **Duplicates** - Are there repeated observations?

### 💡 Using AI for This Step

**Agent prompt:**
```
"Check this dataset for data quality issues:
1. Count missing values per variable
2. Check for impossible or extreme values
3. Identify potential outliers
4. Look for duplicate rows"
```

**Important:** AI can find issues, but YOU decide if they're real problems or valid data!

---

## Step 4: Answer Research Questions 🎯

### Process

1. **Write specific questions** before analyzing
2. **Choose appropriate methods** (ask AI if unsure)
3. **Create visualizations** to understand patterns
4. **Perform statistical tests** if needed
5. **Interpret results** in context

### Example Questions

- "Is there a difference in survival between treatment groups?"
- "Do high-risk patients have shorter survival times?"
- "What's the median survival time in each group?"

### 💡 Using AI for This Step

**For each question, use Agent mode:**
```
"Research question: [your question]

Using the dataset, please:
1. Create appropriate visualizations
2. Calculate relevant statistics
3. Perform appropriate statistical tests
4. Explain the results in plain language"
```

---

## Step 5: Document & Communicate 📝

### What to Document

- Where the data came from
- What cleaning/filtering was done
- What analyses were performed
- What the results mean
- Limitations or caveats

### Best Practices

- **Add comments** to explain WHY you did something
- **Use meaningful variable names**
- **Save your script** - you'll need to run it again!
- **Create a README** if sharing with others

---

## 🧬 Ovarian Cancer Dataset Walkthrough

Now let's apply this workflow to real data!

### About the Dataset

This is simulated ovarian cancer clinical trial data with:

- **Treatment**: 0 = control, 1 = experimental treatment
- **HighRisk**: 0 = low risk, 1 = high risk patient
- **Time**: Survival time in months
- **Status**: 0 = censored (still alive/lost to follow-up), 1 = event (death)

**Research Context:** In survival analysis, we want to know if the treatment improves survival, and whether this differs by risk group.

---

## 📝 Guided Analysis

Create a new file: `ovarian_analysis.R`

We'll work through this together, step by step.

### Part 1: Understand & Load

```r
# Ovarian Cancer Dataset Analysis
# Date: [today's date]
# Analyst: [your name]

# Load required libraries
library(tidyverse)  # For data manipulation and visualization
library(survival)   # For survival analysis
library(survminer)  # For beautiful survival plots

# Set working directory (adjust to your path)
# The data folder should be in your tutorial folder
```

**�� Ask Copilot Chat:**
"How do I set my working directory to where my data file is located?"

**🤖 Use Agent mode:**
```
"Load the ovarian.csv file from the data folder. 
Show me the first 10 rows and the structure of the data."
```

### Part 2: Explore the Data

**Your turn! Ask Agent mode:**

```
"For the ovarian dataset, please:
1. Count total number of patients
2. Show how many patients in each treatment group
3. Show how many patients in each risk category
4. Show the cross-tabulation of treatment by risk group
5. Calculate mean, median, min, and max survival time"
```

**Checkpoint Questions:**
- How many patients received treatment?
- How many patients are high risk?
- What's the range of survival times?

### Part 3: Data Quality

**Ask Agent mode:**

```
"Check the ovarian dataset for:
1. Any missing values in any column
2. Any negative values in Time
3. Any Status values other than 0 or 1
4. Any Treatment values other than 0 or 1
5. Summary of data completeness"
```

**Checkpoint:** Are there any data quality issues? (There shouldn't be in this clean dataset!)

### Part 4: Visualizations

**Ask Agent mode (one at a time):**

**Visualization 1:**
```
"Create a histogram of survival Time, colored by Treatment group. 
Add a title and proper axis labels."
```

**Visualization 2:**
```
"Create a boxplot comparing survival Time between Treatment groups. 
Use different colors for each group and add a title."
```

**Visualization 3:**
```
"Create a boxplot showing survival Time by both Treatment and HighRisk. 
This should show 4 groups: Control-LowRisk, Control-HighRisk, 
Treatment-LowRisk, Treatment-HighRisk."
```

**Checkpoint Questions:**
- Which group appears to have longest survival?
- Are there visible differences between groups?
- Do you see any outliers?

### Part 5: Survival Analysis

This is the main analysis for this type of data!

**Ask Agent mode:**

```
"Create a Kaplan-Meier survival curve for the ovarian dataset:
1. Compare survival between Treatment groups
2. Include confidence intervals
3. Add a risk table below the plot
4. Use professional colors and labels
5. Add a title: 'Survival by Treatment Group'"
```

**Then ask:**
```
"Perform a log-rank test to compare survival between 
treatment groups. Explain what the p-value means in 
plain language."
```

**Checkpoint Questions:**
- Does treatment appear to improve survival?
- Is the difference statistically significant?
- What does the p-value tell you?

**Advanced question for Agent mode:**
```
"Create a Kaplan-Meier plot showing survival for all 4 groups:
Control-LowRisk, Control-HighRisk, Treatment-LowRisk, 
Treatment-HighRisk. Use different colors and line types."
```

### Part 6: Summary Statistics Table

**Ask Agent mode:**

```
"Create a publication-quality summary table with these columns:
- Group (Treatment 0/1, HighRisk 0/1)
- N (number of patients)
- Events (number of deaths)
- Median survival (months)
- 95% CI for median survival

Format it nicely and save as a data frame called summary_table."
```

---

## ✅ Verification at Each Step

After AI generates code:

1. **Read the code** - Understand what it does
2. **Run section by section** - Don't run everything at once
3. **Check outputs** - Do numbers make sense?
4. **Ask questions** - If confused, ask Copilot to explain
5. **Modify if needed** - Use Edit mode to adjust

### Red Flags 🚩

- Plots with no labels or titles
- Statistics that seem impossible (negative survival, etc.)
- Code that gives warnings or errors
- Results that contradict your visual inspection

---

## 🎯 Practice Exercises

### Exercise 1: Modify the Analysis

Select one of the visualizations you created and use **Edit mode** to:
- Change colors to a professional palette
- Increase font sizes for readability
- Add grid lines
- Change the theme

### Exercise 2: New Research Question

Come up with your own question about the data, such as:
- "What proportion of high-risk patients survive past 20 months?"
- "Is there a difference in censoring rates between groups?"

Use Agent mode to answer your question.

### Exercise 3: Export Results

Ask Agent mode:
```
"Save the summary_table to a CSV file called 
'ovarian_summary.csv' and save the survival plot 
as a high-quality PNG image."
```

---

## 🎓 Key Takeaways

✅ Always follow a systematic workflow  
✅ Understand your data BEFORE analyzing  
✅ Check data quality - don't assume it's clean  
✅ Visualize before testing  
✅ Verify every AI output  
✅ Document your work with comments  
✅ Ask specific, detailed questions to AI

---

## 📚 What We Learned

- How to structure a complete data analysis
- Loading and exploring clinical datasets
- Creating visualizations for different purposes
- Performing survival analysis with R
- Using AI effectively at each step
- Critical thinking about results

---

**Next:** [Best Practices →](../04-best-practices/README.md)
