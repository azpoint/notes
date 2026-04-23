Here’s a Nano cheat sheet structured the same way:

---

# 📝 Nano Cheat Sheet

## ⚙️ Modes of Operation

```id="n8k2mv"
Nano is modeless:
# You can edit text and execute commands without switching modes
```

**Config file:**

```bash id="v2p7lx"
~/.nanorc
```

---

## ✍️ Basic Editing

```bash id="y5t1rc"
# Just start typing to insert text

Backspace / Delete   # Remove characters
Enter                # New line
```

---

## 📟 Command Execution (Ctrl-based Shortcuts)

```bash id="c3m9zb"
Ctrl (^) is used for most commands
Example: ^X means Ctrl + X
```

---

## 🔙 Exit / Save Operations

```bash id="r1d6sj"
^O      # Write (save) file
^X      # Exit
```

### Save & Exit Flow

```bash id="t2w8xn"
^X      # Exit
Y       # पुष्टि save changes
Enter   # Confirm filename
```

---

## 🔍 Navigation

```bash id="p6k7vy"
^A      # Move to beginning of line
^E      # Move to end of line
^Y      # Page up
^V      # Page down

^_      # Go to line number
```

---

## ✂️ Cut / Copy / Paste

```bash id="u3z4qa"
^K      # Cut current line
^U      # Paste

Alt + A # Start selection (mark text)
^K      # Cut selected text
```

---

## 🔎 Search & Replace

```bash id="s8n5xr"
^W              # Search forward
Alt + W         # Find next occurrence

^\              # Search and replace
```

---

## 🧾 Display Options

```bash id="m4q2cz"
Alt + #     # Toggle line numbers (if supported)
^C          # Show cursor position
```

---

## 🗂️ Working with Files

```bash id="g7n9xr"
nano file.txt          # Open/create file
nano -o file.txt       # Open with backup (varies by config)
```

---

## 🛡️ Helpful Shortcuts

```bash id="h6k4yb"
^G      # Help menu
^T      # Spell check (if enabled)
^J      # Justify (format paragraph)
^L      # Refresh screen
```
