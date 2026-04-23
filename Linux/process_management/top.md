Here it is structured cleanly in Markdown, consistent with the previous ones:

---

# 📊 Dynamic Real-Time Process Monitoring (`top`)

## ▶️ Starting `top`

```bash id="zv0c9k"
top
```

---

## ⌨️ `top` Interactive Shortcuts

```bash id="3m8p1y"
h       # Help screen
space   # Manual refresh
d       # Set refresh delay (seconds)
q       # Quit

u       # Filter by user
m       # Toggle memory display
1       # Show per-CPU stats

x/y     # Highlight running process / sort column
b       # Toggle bold/text highlighting

<       # Move sort column left
>       # Move sort column right

F       # Field Management screen
W       # Save settings
```

---

## 🧾 Batch Mode (Non-Interactive)

```bash id="q7t6dl"
# 3 updates, 1-second interval, output to file
top -d 1 -n 3 -b > top_processes.txt
```

---

## 🚀 Alternative: `htop` (Enhanced Viewer)

```bash id="z2k9sx"
# Install htop
sudo apt update && sudo apt install htop

# Run htop
htop
```