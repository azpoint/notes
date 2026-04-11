Below is a cleaned, structured, and pragmatic Linux command reference—focused on the commands that actually carry most day-to-day work (the 80/20 core), with concise explanations and useful flags.

---

# 🐧 Linux Commands (80/20 Practical Reference)

## 📁 File & Directory Management

```bash
pwd            # Print current working directory
ls             # List files
ls -lah        # Detailed list (human-readable, includes hidden files)

cd <dir>       # Change directory
cd ..          # Go up one level
cd ~           # Go to home directory

mkdir <dir>    # Create directory
rm <file>      # Remove file
rm -r <dir>    # Remove directory recursively
rm -rf <dir>   # Force remove (⚠️ dangerous)

cp <src> <dst> # Copy file
cp -r <src> <dst> # Copy directory

mv <src> <dst> # Move or rename
```

### Notes

* `ls -lah` is the default “human-friendly” view.
* `rm -rf` bypasses safeguards—no undo, no prompt.
* `mv` doubles as rename when destination is same directory.

---

## 📄 File Viewing & Inspection

```bash
cat <file>     # Print entire file
less <file>    # Scrollable viewer (preferred for large files)
head <file>    # First 10 lines
tail <file>    # Last 10 lines
tail -f <file> # Follow file in real-time (logs)
```

### Notes

* `less` is superior to `cat` for anything non-trivial.
* `tail -f` is essential for debugging logs.

---

## 🔍 Search & Filtering

```bash
grep "text" <file>        # Search for text
grep -r "text" .          # Recursive search
grep -i "text" <file>     # Case-insensitive

find . -name "*.txt"      # Find files by name
find . -type f            # Find only files
```

### Notes

* `grep` = content search.
* `find` = filesystem traversal.
* Combine them:

```bash
find . -name "*.log" | xargs grep "ERROR"
```

---

## 🔧 Permissions & Ownership

```bash
chmod +x file        # Make executable
chmod 755 file       # rwxr-xr-x

chown user file      # Change owner
chown user:group file
```

### Mental Model

* `r = 4`, `w = 2`, `x = 1`
* `755 = owner (7), group (5), others (5)`

---

## 📦 Package Management (Debian/Ubuntu)

```bash
sudo apt update        # Refresh package index
sudo apt upgrade       # Upgrade installed packages
sudo apt install pkg   # Install package
sudo apt remove pkg    # Remove package
```

*(On other distros: `dnf`, `yum`, `pacman` equivalents)*

---

## ⚙️ Processes & System Monitoring

```bash
ps aux              # List processes
top                 # Real-time process monitor
kill <pid>          # Terminate process
kill -9 <pid>       # Force kill (SIGKILL)

htop                # Better interactive monitor (if installed)
```

### Notes

* Prefer `kill` before `kill -9` (graceful vs forced).
* `top` is ubiquitous; `htop` is ergonomic.

---

## 🌐 Networking

```bash
ping <host>         # Check connectivity
curl <url>          # Fetch URL (API/debugging)
wget <url>          # Download file

ip a                # Show IP addresses
```

---

## 📊 Disk & Storage

```bash
df -h               # Disk usage (human-readable)
du -sh <dir>        # Directory size
```

---

## 🔗 Pipes & Redirection (Core Shell Mechanics)

```bash
command > file      # Redirect output (overwrite)
command >> file     # Append output
command | other     # Pipe output to another command
```

### Example

```bash
ps aux | grep nginx
```

---

## 🧪 Command Chaining

```bash
cmd1 && cmd2    # Run cmd2 only if cmd1 succeeds
cmd1 || cmd2    # Run cmd2 if cmd1 fails
```

---

# ⚡ High-Leverage Patterns (Real Usage)

### 1. Find + Act

```bash
find . -name "*.log" -delete
```

### 2. Logs + Filtering

```bash
tail -f app.log | grep ERROR
```

### 3. Quick Backup

```bash
cp -r project project_backup
```

### 4. Bulk Rename (simple case)

```bash
for f in *.txt; do mv "$f" "${f%.txt}.md"; done
```

---

# 🧠 Mental Models That Matter

### 1. Everything is a File

* Devices, processes, sockets → all exposed as files.

### 2. Small Tools, Composed

* `grep`, `awk`, `sed`, `sort` → designed to be chained.

### 3. Streams

* stdin (0), stdout (1), stderr (2)

```bash
command 2> error.log
```

---

# 🧩 Minimal Core (If You Only Learn ~15 Commands)

These cover most real-world usage:

* Navigation: `ls`, `cd`, `pwd`
* File ops: `cp`, `mv`, `rm`, `mkdir`
* Viewing: `less`, `tail -f`
* Search: `grep`, `find`
* System: `ps`, `top`, `kill`
* Network: `curl`
* Disk: `df`, `du`
* Shell glue: `|`, `>`, `&&`

---

# 🚀 Optional Next Layer (High ROI)

Once comfortable, add:

* `awk` → structured text processing
* `sed` → inline editing
* `xargs` → argument builder
* `tar` → archiving
* `ssh` → remote access

---

If you want, I can:

* Turn this into a **task-oriented cheat sheet** (e.g., “debugging a server”, “cleaning disk”, “finding bugs in logs”), or
* Do a **zsh + modern CLI stack** version (`bat`, `exa`, `ripgrep`, etc.), which is what many power users run today.
