Here it is reorganized into clean Markdown:

---

# 🔍 Searching for Text Patterns (`grep`)

## 🧾 Basic Syntax

```bash id="g4k9zm"
grep [OPTIONS] pattern file
```

---

## ⚙️ Common Options

```bash id="p2x7qn"
-n      # Show line numbers
-i      # Case-insensitive search
-v      # Invert match (show non-matching lines)
-w      # Match whole words only
-a      # Treat binary files as text
-R      # Recursive search in directories
-c      # Count matches only
-C n    # Show n lines of context before and after match
```

---

## 📂 Recursive Search Example

```bash id="y8t3lc"
grep -R "pattern" /path/to/directory
```

---

## 🔢 Count Matches

```bash id="m6v2sr"
grep -c "pattern" file
```

---

## 🧠 Binary File Inspection

```bash id="z1q5xp"
# Extract printable (ASCII) strings from a binary file
strings binary_file
```
