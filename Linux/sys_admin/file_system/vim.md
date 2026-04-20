Here it is reorganized into a clean, structured Markdown reference:

---

# 📝 VIM Cheat Sheet

## ⚙️ Modes of Operation

```id="q8n2mz"
Command Mode     # Default mode
Insert Mode      # For editing text
Last Line Mode   # For commands (":" mode)
```

**Config file:**

```bash id="v4x7kp"
~/.vimrc
```

---

## ✍️ Entering Insert Mode (from Command Mode)

```bash id="y2k9tr"
i   # Insert before cursor
I   # Insert at beginning of line
a   # Insert after cursor
A   # Insert at end of line
o   # Insert on next line
```

---

## 📟 Entering Last Line Mode

```bash id="c6m1zb"
:
```

---

## 🔙 Returning to Command Mode

```bash id="r9d4sj"
ESC
```

---

## 🧾 Last Line Mode Shortcuts

```bash id="t5w8xn"
w!      # Save (write)
q!      # Quit without saving
wq!     # Save and quit
e!      # Revert to last saved version

set nu      # Show line numbers
set nonu    # Hide line numbers

syntax on   # Enable syntax highlighting
syntax off  # Disable syntax highlighting

%s/search/replace/g   # Replace all occurrences
```

---

## ⌨️ Command Mode Shortcuts

```bash id="p3k7vy"
x       # Delete character under cursor
dd      # Cut current line
5dd     # Cut 5 lines

ZZ      # Save and quit
u       # Undo

G       # Go to end of file
$       # Go to end of line
0 or ^  # Go to beginning of line

:n      # Go to line n (e.g., :10)

Shift+v # Select current line

y       # Yank (copy)
p       # Paste after cursor
P       # Paste before cursor

/string # Search forward
?string # Search backward
n       # Next match
N       # Previous match
```

---

## 🗂️ Working with Multiple Files

### Open files in split windows

```bash id="f1z6qc"
vim -o file1 file2
```

### Diff mode (compare files)

```bash id="h7x2ld"
vim -d file1 file2
```

### Navigate between splits

```bash id="k4n9br"
Ctrl + w
```