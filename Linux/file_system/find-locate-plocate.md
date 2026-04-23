Here it is reorganized into a clean, structured Markdown reference:

---

# 🔎 Finding Files (`find`, `locate` / `plocate`)

---

## ⚡ Locate (`plocate` backend)

```bash id="k7v2mz"
# Note:
# locate is typically a symlink to plocate
```

### 🗄️ Update Database

```bash id="p3x9qn"
sudo updatedb
```

---

### 🔍 Search by Filename

```bash id="y6t4lc"
locate filename          # Implicitly matches *filename*
locate -i filename       # Case-insensitive
locate -r '/filename$'   # Exact match using regex
```

---

### 📌 Search Variants

```bash id="m2v8sr"
locate -b filename       # Match basename only
locate -r 'regex'        # Use regular expressions
locate -e filename       # Show only existing files
```

---

### 🧭 Locate Command Paths

```bash id="z5q1xp"
which command
which -a command
```

---

## 🧠 Find (Real-Time Filesystem Search)

### 🧾 Basic Syntax

```bash id="g9k3zm"
find PATH [OPTIONS]
```

---

### 📂 Example

```bash id="n4x7qd"
# Find files larger than 1MB in home directory
find ~ -type f -size +1M
```

---

### ⚙️ Common Options

```bash id="t8p2wf"
-type f        # File
-type d        # Directory
-type l        # Symlink
-type s        # Socket
-type p        # Named pipe

-name filename     # Match name
-iname filename    # Case-insensitive name

-size n            # Exact size
-size +n           # Greater than n
-size -n           # Less than n

-perm permissions  # Match permissions

-links n           # Number of links
-links +n / -n     # More / less than n links

-atime n           # Access time (days)
-mtime n           # Modify time
-ctime n           # Change time

-user owner        # File owner
-group group_owner # Group owner
```

