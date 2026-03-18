# Understanding AI Assistant Modes

**⏱️ Workshop Section 2: 30-40 minutes**

GitHub Copilot is your AI programming assistant. Understanding its different modes will help you work more efficiently.

## 🎯 Learning Goals

- Understand the 4 modes of GitHub Copilot
- Know when to use each mode
- Practice effective prompting
- Build confidence working with AI

---

## The Four Modes of GitHub Copilot

### 1. 💬 **Chat Mode** - Ask Questions

**What it does:** Have a conversation with AI to understand code, get explanations, or ask for help.

**When to use it:**
- "What does this function do?"
- "How do I read a CSV file in R?"
- "What's wrong with this error message?"
- "Explain this statistical test to me"

**How to access:**
- Click the chat icon in the sidebar
- Or press `Ctrl+Alt+I` (Windows/Linux) / `Cmd+Alt+I` (Mac)

**Example conversation:**
```
You: "How do I calculate the mean of a column in R?"

Copilot: "You can use the mean() function. For example:
mean(data$column_name)
Or if you're using tidyverse:
data %>% summarize(avg = mean(column_name))"
```

---

### 2. ✏️ **Edit Mode** - Modify Existing Code

**What it does:** Makes changes to code you've already written.

**When to use it:**
- Change variable names
- Modify plot colors or styles
- Add error handling to existing code
- Refactor code to be cleaner

**How to access:**
1. **Select the code** you want to modify
2. Press `Ctrl+I` (Windows/Linux) / `Cmd+I` (Mac)
3. Type your instruction
4. Review and accept/reject changes

**Example:**
- Select: `plot(data$age)`
- Instruction: "Change color to blue and add a title"
- Copilot modifies the code accordingly

---

### 3. 🤖 **Agent Mode** - Complex Multi-Step Tasks

**What it does:** Handles complex tasks that require multiple steps, like creating entire analysis workflows.

**When to use it:**
- "Load this CSV and create a summary table"
- "Generate a complete exploratory data analysis"
- "Create visualizations for all numeric variables"
- "Perform a survival analysis with this dataset"

**How to access:**
- In the chat panel, click the **agent** icon or use `@workspace`
- Type your complex request

**Example:**
```
You: "@workspace Load the ovarian.csv file, summarize the data, 
and create a plot showing survival by treatment group"

Copilot: [Creates complete code with data loading, summary stats, 
and visualization]
```

---

### 4. ✨ **Autocomplete** - Inline Suggestions

**What it does:** Suggests code as you type, completing your thoughts.

**When to use it:**
- Always! It works automatically
- Helps you write code faster
- Reduces typos and syntax errors

**How it works:**
1. Start typing code
2. Copilot suggests completion in gray text
3. Press `Tab` to accept, or keep typing to ignore

**Example:**
```r
# You type:
data <- read.c

# Copilot suggests:
data <- read.csv("path/to/file.csv")
```

---

## 📊 Decision Tree: Which Mode to Use?

```
Do you have a question about code or concepts?
├─ YES → Use CHAT mode
└─ NO ↓

Do you have existing code to modify?
├─ YES → Use EDIT mode
└─ NO ↓

Do you need a complete multi-step analysis?
├─ YES → Use AGENT mode
└─ NO ↓

Are you writing code line by line?
└─ YES → Use AUTOCOMPLETE (automatic)
```

---

## 🎯 Effective Prompting

The quality of AI output depends on the quality of your instructions.

### ✅ Good Prompts

**Be specific:**
- ❌ "Make a plot"
- ✅ "Create a scatter plot of Time vs Age with different colors for Treatment groups"

**Provide context:**
- ❌ "Analyze this data"
- ✅ "This is clinical trial data. Create a summary table showing patient counts, mean age, and survival rate by treatment group"

**Break down complex tasks:**
- ❌ "Do a complete statistical analysis"
- ✅ "First, show me descriptive statistics. Then, create a Kaplan-Meier survival curve. Finally, perform a log-rank test comparing treatment groups"

**Include expected output format:**
- ❌ "Summarize the data"
- ✅ "Create a summary table with columns: Variable, N, Mean, SD, Min, Max"

### 📝 Prompt Templates

**For data exploration:**
```
"Load [filename], show the first few rows, 
check for missing values, and display summary statistics 
for all variables"
```

**For visualization:**
```
"Create a [plot type] showing [variables] with 
[color/style preferences]. Add a title and axis labels."
```

**For statistical analysis:**
```
"Perform [analysis type] on [variables]. 
Include [specific outputs]. Interpret the results 
in clinical terms."
```

---

## 🧪 Hands-On Practice

### Exercise 1: Chat Mode

Open the Copilot Chat and ask:

1. "What's the difference between `<-` and `=` in R?"
2. "How do I check for missing values in a dataset?"
3. "Explain what a p-value means in simple terms"

**Goal:** Get comfortable asking questions.

---

### Exercise 2: Autocomplete

Create a new file `autocomplete_practice.R` and start typing:

```r
# Type this slowly and watch for suggestions:
library(tidyv

# Type:
data <- read_

# Type:
summary_stats <- data %>%
  group_by(
```

**Goal:** Learn to recognize and accept helpful suggestions.

---

### Exercise 3: Edit Mode

Copy this code into a new file:

```r
# Simple plot
plot(c(1,2,3,4,5), c(2,4,6,8,10))
```

Now:
1. **Select the plot line**
2. Press `Ctrl+I` / `Cmd+I`
3. Type: "Add a title 'My Data', change points to red, and add grid lines"
4. Review the changes
5. Accept if correct

**Goal:** Practice modifying existing code efficiently.

---

### Exercise 4: Agent Mode

In the Chat panel, type:

```
@workspace Create an R script that:
1. Generates random temperature data for 12 months
2. Calculates mean, min, and max temperatures
3. Creates a line plot with markers
4. Adds appropriate labels and title
```

**Goal:** See how agent mode handles multi-step tasks.

---

## 🔍 Verifying AI-Generated Code

**IMPORTANT:** Always verify AI-generated code before using it for real analysis!

### Verification Checklist

✅ **Read the code** - Do you understand what it does?  
✅ **Check variable names** - Do they match your data?  
✅ **Run small sections** - Test incrementally  
✅ **Verify outputs** - Do results make sense?  
✅ **Check for errors** - Any warnings or messages?  
✅ **Validate assumptions** - Are statistical tests appropriate?

### Red Flags 🚩

- Code that runs without errors but produces strange numbers
- Missing data handling not addressed
- No comments or explanation
- Overly complex solutions for simple problems
- Statistical tests without checking assumptions

---

## 💡 Pro Tips

**1. Iterate and refine**
- First prompt: Get basic code
- Second prompt: "Add error handling"
- Third prompt: "Make the plot more readable"

**2. Ask for explanations**
- After getting code, ask: "Explain what each part does"
- Or: "Why did you use this approach?"

**3. Learn from Copilot**
- Study the code it generates
- Ask about unfamiliar functions
- Build your R knowledge gradually

**4. Use context**
- Select relevant code before asking questions
- Copilot sees what you've selected and provides better answers

**5. Don't be afraid to reject**
- If the code isn't right, reject it and rephrase your prompt
- Or ask: "Can you try a different approach?"

---

## 🎓 Key Takeaways

✅ **Chat** for questions and understanding  
✅ **Edit** for modifying existing code  
✅ **Agent** for complex multi-step tasks  
✅ **Autocomplete** works automatically as you type  
✅ Always verify AI output - you're the expert on your data  
✅ Good prompts = good results

---

## 🆘 Common Issues

**"Copilot isn't suggesting anything"**
- Check the Copilot icon in the status bar (bottom right)
- Make sure you're signed in to GitHub
- Try reloading the window: `Ctrl+Shift+P` → "Reload Window"

**"Suggestions are not relevant"**
- Provide more context in your prompt
- Select related code before making requests
- Break complex requests into smaller steps

**"I accidentally accepted wrong code"**
- Press `Ctrl+Z` / `Cmd+Z` to undo
- You can always undo AI changes!

---

**Next:** [Data Analysis Workflow →](../03-data-analysis-workflow/README.md)
