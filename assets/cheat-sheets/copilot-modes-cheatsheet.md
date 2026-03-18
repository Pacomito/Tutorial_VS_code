# GitHub Copilot Modes - Quick Reference

## When to Use Each Mode

| Mode | Use When | Shortcut |
|------|----------|----------|
| 💬 **Chat** | Ask questions, get explanations | `Ctrl+Alt+I` |
| ✏️ **Edit** | Modify existing code | Select code + `Ctrl+I` |
| 🤖 **Agent** | Complex multi-step tasks | Chat with `@workspace` |
| ✨ **Autocomplete** | Writing code line-by-line | Automatic (press `Tab`) |

---

## Quick Prompts

### Chat Mode
```
"What does this function do?"
"How do I [task] in R?"
"Explain this error: [paste error]"
"What's the difference between X and Y?"
```

### Edit Mode
```
Select code, then:
"Change color to blue"
"Add error handling"
"Make variable names more descriptive"
"Add comments explaining each step"
```

### Agent Mode
```
"@workspace Load [file], create summary statistics, and visualize [variables]"
"Generate complete exploratory data analysis for [dataset]"
"Create publication-quality plots for all numeric variables"
```

---

## Decision Flowchart

```
START: What do you need?

Question/Explanation? → CHAT
    ↓
Modify existing code? → EDIT
    ↓
Multi-step task? → AGENT
    ↓
Writing new code? → AUTOCOMPLETE (automatic)
```

---

## Tips for Better Results

✅ **Be specific**: "Create a blue scatter plot" not "make a plot"
✅ **Give context**: "This is clinical data with..." 
✅ **Break it down**: Complex tasks → smaller steps
✅ **Iterate**: First attempt → refine → perfect
✅ **Verify**: Always check AI output!

---

**Print this and keep it visible during analysis!**
