# Getting Started with VS Code

**⏱️ Workshop Section 1: 30 minutes**

Now that you have everything installed, let's explore VS Code and get comfortable with the interface.

## 🎯 Learning Goals

- Navigate the VS Code interface confidently
- Use essential keyboard shortcuts
- Work with R scripts effectively
- Understand the terminal

---

## The VS Code Interface

When you open VS Code, you'll see several key areas:

### Left Sidebar (Activity Bar)

The icons on the far left give you access to different views:

- **📁 Explorer** - View and manage your files and folders
- **🔍 Search** - Find text across all your files
- **🌿 Source Control** - Git integration (we won't use this today)
- **▶️ Run and Debug** - For running code with debugging
- **🧩 Extensions** - Install and manage extensions
- **💬 GitHub Copilot Chat** - Your AI assistant (important!)

### Main Editor Area

The center area where you write and edit code. You can:
- Open multiple files in tabs
- Split the editor to view files side-by-side
- Scroll, search, and edit

### Bottom Panel

Shows different information:
- **Terminal** - Run R commands directly
- **Problems** - Shows errors and warnings
- **Output** - Messages from extensions
- **Debug Console** - For debugging

### Status Bar (Bottom)

Shows useful information like:
- Current file type
- Line and column number
- Spaces/tabs settings
- Git branch (if applicable)

---

## Essential Keyboard Shortcuts

Learn these shortcuts to work faster:

| Action | Windows/Linux | Mac |
|--------|---------------|-----|
| Command Palette | `Ctrl+Shift+P` | `Cmd+Shift+P` |
| Open file | `Ctrl+P` | `Cmd+P` |
| New file | `Ctrl+N` | `Cmd+N` |
| Save file | `Ctrl+S` | `Cmd+S` |
| Open terminal | `` Ctrl+` `` | `` Cmd+` `` |
| Toggle sidebar | `Ctrl+B` | `Cmd+B` |
| Find in file | `Ctrl+F` | `Cmd+F` |
| Replace in file | `Ctrl+H` | `Cmd+H` |
| Comment line | `Ctrl+/` | `Cmd+/` |
| Run R line/selection | `Ctrl+Enter` | `Cmd+Enter` |

**💡 Tip:** The Command Palette (`Ctrl+Shift+P`) is your best friend! Type what you want to do, and VS Code will show you the command.

---

## Working with R in VS Code

### Create Your First R Script

1. **Create a new file**: `Ctrl+N` / `Cmd+N`
2. **Save it as R file**: `Ctrl+S` / `Cmd+S` → name it `my_first_script.R`
3. **Notice**: The file icon changes to R logo, and syntax highlighting appears

### Running R Code

There are several ways to run R code:

#### Method 1: Run Selected Lines (Most Common)
1. Select one or more lines of code
2. Press `Ctrl+Enter` / `Cmd+Enter`
3. The code runs in the R terminal below

#### Method 2: Run Entire Script
1. Right-click in the editor
2. Select **"Run Source"** or **"Run Source with Echo"**

#### Method 3: Use the Terminal
1. Open terminal: `` Ctrl+` ``
2. Type `R` to start R
3. Type commands directly
4. Type `q()` to exit R

### Try It Now!

Create a new file `practice.R` and type:

```r
# My first R script in VS Code
# Let's do some basic calculations

# Create a vector
numbers <- c(10, 20, 30, 40, 50)

# Calculate the mean
average <- mean(numbers)
print(paste("The average is:", average))

# Create a simple plot
plot(numbers, type = "b", col = "blue", main = "My First Plot")
```

**Exercise:** Run each section line by line using `Ctrl+Enter`

---

## Understanding the Terminal

The terminal is where your R code actually runs. Think of it as a direct conversation with R.

### Terminal Tips

- **Clear the terminal**: Type `clear` (or `Ctrl+L`)
- **Stop running code**: Press `Ctrl+C`
- **Previous command**: Press `Up Arrow`
- **New terminal**: Click the `+` icon in terminal panel

### R Console vs R Terminal

When you run R code in VS Code:
1. It opens an R terminal automatically
2. Your commands are sent there
3. Results appear in the same terminal
4. You can type directly in the terminal too

---

## Organizing Your Workspace

### Working with Folders

It's best to organize each project in its own folder:

1. **Open a folder**: `File → Open Folder`
2. **All files in that folder** appear in the Explorer sidebar
3. **Navigate easily** between related scripts and data

### File Management

- **Create new file**: Right-click in Explorer → New File
- **Create new folder**: Right-click in Explorer → New Folder
- **Rename**: Right-click → Rename
- **Delete**: Right-click → Delete

---

## Customizing VS Code (Optional)

### Changing the Theme

1. `Ctrl+Shift+P` / `Cmd+Shift+P`
2. Type "Color Theme"
3. Browse and select your preferred theme

### Adjusting Font Size

1. `File → Preferences → Settings` (or `Ctrl+,`)
2. Search for "font size"
3. Adjust "Editor: Font Size"

### R-Specific Settings

1. Open Settings (`Ctrl+,`)
2. Search for "R"
3. Useful settings:
   - **R: Bracket Completion** - Auto-close brackets
   - **R: Always Use ActiveTerminal** - Use the same R session

---

## 🎯 Practice Exercise

### Exercise 1: Create a Simple Analysis

Create a new file called `temperature_analysis.R`:

```r
# Temperature data analysis
# Monthly average temperatures (Celsius)

temperatures <- c(5, 6, 10, 14, 18, 22, 25, 24, 20, 15, 9, 6)
months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

# Calculate statistics
mean_temp <- mean(temperatures)
max_temp <- max(temperatures)
min_temp <- min(temperatures)

# Print results
cat("Average temperature:", mean_temp, "°C\n")
cat("Highest temperature:", max_temp, "°C\n")
cat("Lowest temperature:", min_temp, "°C\n")

# Create a visualization
barplot(temperatures, names.arg = months, 
        col = "steelblue",
        main = "Monthly Average Temperatures",
        ylab = "Temperature (°C)",
        xlab = "Month")
```

**Tasks:**
1. Create the file
2. Type or paste the code
3. Run it section by section
4. Observe the output in the terminal
5. See the plot appear

### Exercise 2: Fix Some Errors

Copy this code (it has intentional errors):

```r
# This code has errors - can you find them?

numberss <- c(1, 2, 3, 4, 5
average <- mean(numbers)
print(average)
```

**Tasks:**
1. Run the code
2. Read the error messages
3. Fix the errors (Hint: there are 2 errors)
4. Run again until it works

<details>
<summary>Click here for the solution</summary>

Errors:
1. Missing closing parenthesis on line 1: `c(1, 2, 3, 4, 5)` 
2. Variable name mismatch: line 1 uses `numberss` but line 2 uses `numbers`

Fixed code:
```r
numbers <- c(1, 2, 3, 4, 5)
average <- mean(numbers)
print(average)
```
</details>

---

## 🎓 Key Takeaways

✅ VS Code has 4 main areas: Sidebar, Editor, Bottom Panel, Status Bar  
✅ Use `Ctrl+Shift+P` to access any command  
✅ Run R code with `Ctrl+Enter` for selected lines  
✅ The terminal shows R output and allows direct interaction  
✅ Organize projects in folders for easier management

---

## 🆘 Common Issues

**"R terminal won't start"**
- Check that R is installed (`R --version` in a regular terminal)
- Restart VS Code
- Check R extension is installed and enabled

**"Plot doesn't appear"**
- Install the `httpgd` package: `install.packages("httpgd")`
- Plots should open in a new viewer panel

**"Code runs but no output"**
- Check the terminal panel is visible (`` Ctrl+` ``)
- Make sure the R terminal is active (check terminal dropdown)

---

**Next:** [AI Assistant Modes →](../02-ai-assistant/README.md)
