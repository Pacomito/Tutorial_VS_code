# Prerequisites & Setup

**⏱️ Time needed: 30-45 minutes (complete BEFORE the workshop)**

## ✅ Checklist

Before attending the workshop, please complete all items below:

- [ ] VS Code installed
- [ ] R and R extension installed in VS Code
- [ ] GitHub account created
- [ ] GitHub Copilot access verified

---

## 1. Install Visual Studio Code

### Download and Install

1. Go to [code.visualstudio.com](https://code.visualstudio.com/)
2. Download VS Code for your operating system
3. Run the installer and follow the prompts
4. Launch VS Code

**✓ Verification:** You should see the VS Code welcome screen.

---

## 2. Install R

### Download R

1. Go to [r-project.org](https://www.r-project.org/)
2. Click "Download R" → Select a CRAN mirror near you
3. Choose your operating system
4. Download and install the latest version (R 4.3+ recommended)

### Verify R Installation

Open a terminal and type:
```bash
R --version
```

You should see the R version information.

**✓ Verification:** R version displayed without errors.

---

## 3. Install R Extension in VS Code

### Steps

1. Open VS Code
2. Click the **Extensions** icon in the left sidebar (or press `Ctrl+Shift+X` / `Cmd+Shift+X`)
3. Search for **"R"** by REditorSupport
4. Click **Install**
5. Also install **"R Debugger"** (optional but helpful)

### Install Required R Packages

Open VS Code terminal (`Ctrl+` ` or View → Terminal) and run R:

```r
R
```

Then install these packages:

```r
install.packages(c("languageserver", "httpgd", "tidyverse", "survival", "survminer"))
```

Type `q()` to exit R when done.

**✓ Verification:** Extensions show as installed with green checkmark.

---

## 4. Create GitHub Account

### Why GitHub?

GitHub Copilot (our AI assistant) requires a GitHub account. If you already have one, skip to step 5.

### Steps

1. Go to [github.com](https://github.com/)
2. Click **Sign up**
3. Enter your email address
4. Create a password
5. Choose a username
6. Verify your account via email

**✓ Verification:** You can log in to github.com

---

## 5. Set Up GitHub Copilot

### Subscribe to Copilot

1. Log in to [github.com](https://github.com/)
2. Go to [github.com/features/copilot](https://github.com/features/copilot)
3. Click **"Start free trial"** or **"Subscribe"**
4. Choose the individual plan (30-day free trial available)
5. Complete the subscription

### Install GitHub Copilot in VS Code

1. Open VS Code
2. Go to Extensions (`Ctrl+Shift+X` / `Cmd+Shift+X`)
3. Search for **"GitHub Copilot"**
4. Click **Install**
5. Also install **"GitHub Copilot Chat"**
6. When prompted, sign in to GitHub
7. Authorize VS Code to access your GitHub account

### Verify Copilot Works

1. In VS Code, press `Ctrl+Shift+P` / `Cmd+Shift+P` (Command Palette)
2. Type "Copilot: Chat" and select it
3. A chat panel should open on the right
4. Try typing: "Hello, can you help me analyze data with R?"
5. You should get a response from Copilot

**✓ Verification:** Copilot responds to your message in the chat panel.

---

## 6. Configure VS Code for R

### Create a Test R Script

1. In VS Code, create a new file (`Ctrl+N` / `Cmd+N`)
2. Save it as `test.R` (`Ctrl+S` / `Cmd+S`)
3. Type this code:

```r
# Test script
x <- c(1, 2, 3, 4, 5)
mean(x)
print("R is working!")
```

4. Right-click in the editor and select **"Run Source"** or **"Run Selection/Line in Active Terminal"**

**✓ Verification:** You should see the output `3` and `"R is working!"` in the terminal.

---

## 🎉 You're Ready!

If all checkboxes are complete, you're ready for the workshop!

### Common Issues

**"R not found"**
- Make sure R is installed and in your system PATH
- Restart VS Code after installing R

**"Copilot not responding"**
- Check that you're signed in to GitHub in VS Code
- Verify your Copilot subscription is active
- Try reloading VS Code window (`Ctrl+Shift+P` → "Reload Window")

**"Extensions won't install"**
- Check your internet connection
- Try restarting VS Code
- Check VS Code logs: `View → Output → Select "Extensions"`

### Need Help?

Bring these issues to the workshop - we'll help you troubleshoot!

---

**Next:** [Getting Started with VS Code →](../01-getting-started/README.md)
