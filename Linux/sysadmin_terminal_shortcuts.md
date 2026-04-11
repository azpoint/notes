Here’s a **sysadmin-focused terminal shortcuts guide**, optimized for real operational work: incident response, log analysis, remote sessions, and high-speed command editing.

This goes beyond generic Bash shortcuts and emphasizes **what actually saves time under pressure**.

---

# ⚡ Terminal Shortcuts (Sysadmin 80/20)

## 🧠 Core Mental Model

You’re optimizing for:

* **Speed under repetition** (logs, retries, fixes)
* **Minimal retyping**
* **Safe interruption & recovery**

---

# 🔎 History & Command Recall (🔥 Highest ROI)

```bash
CTRL + R      # Reverse search command history
!!            # Repeat last command
!$            # Last argument of previous command
!n            # Run command number n
!string       # Last command starting with "string"
```

### Real Use

```bash
sudo !!
```

→ rerun previous command with sudo

```bash
mkdir project
cd !$
```

---

## ✏️ Fast Command Editing

```bash
CTRL + A   # Start of line
CTRL + E   # End of line
ALT + B    # Back one word
ALT + F    # Forward one word

CTRL + U   # Delete to start
CTRL + K   # Delete to end
CTRL + W   # Delete previous word
CTRL + Y   # Paste (yank)
```

### Sysadmin Context

* Fix long `ssh`, `docker`, or `kubectl` commands instantly
* Modify only the tail of a command instead of rewriting

---

## 🔁 Process Control (Critical in Production)

```bash
CTRL + C   # Interrupt process (SIGINT)
CTRL + Z   # Suspend process
```

Then:

```bash
fg         # Resume foreground
bg         # Resume background
jobs       # List jobs
```

### Real Use Cases

* Stop a hanging `curl` or script
* Pause `vim` or `top` temporarily
* Resume safely without killing state

---

## 🧹 Terminal Control

```bash
CTRL + L   # Clear screen
clear      # Same effect
```

---

## 📜 Output Control (Underrated)

```bash
CTRL + S   # Freeze terminal output
CTRL + Q   # Resume output
```

### Why this matters

* When logs flood your screen (`tail -f`)
* Prevents losing visual context

---

## 🔍 Log & Debug Workflow Shortcuts

### Combine with commands:

```bash
tail -f /var/log/syslog
```

Then:

* `CTRL + C` → stop following
* `CTRL + R` → instantly recall the command

---

## 🔄 Command Chaining & Reuse

```bash
CTRL + T   # Swap last two characters (fix typos fast)
```

---

## 🧭 Cursor Precision (for long commands)

```bash
CTRL + XX   # Jump between start and current cursor
```

---

## 🧠 Session Management (Advanced but High ROI)

### Screen / tmux (must for sysadmins)

Even though these are not “shortcuts” per se, they are essential.

## With tmux

```bash
CTRL + B, C     # New window
CTRL + B, N     # Next window
CTRL + B, D     # Detach session
CTRL + B, %     # Vertical split
CTRL + B, "     # Horizontal split
```

### Why it matters

* Persistent sessions (SSH disconnect safe)
* Parallel monitoring (logs, metrics, shell)

---

## 🌐 SSH Efficiency

```bash
CTRL + D   # Exit remote session
```

Combine with:

```bash
~.          # Kill SSH session (escape sequence)
```

---

## ⚡ High-Value Sysadmin Patterns

### 1. Fix permission error instantly

```bash
sudo !!
```

---

### 2. Re-run complex command

```bash
CTRL + R
```

---

### 3. Inspect logs repeatedly

```bash
CTRL + R → tail -f
```

---

### 4. Interrupt safely

```bash
CTRL + C
```

(not `kill -9` unless necessary)

---

### 5. Background a long task

```bash
CTRL + Z
bg
```

---

## 🧩 Minimal Core (Muscle Memory Set)

If you only lock in a few:

* Recall: `CTRL + R`, `!!`, `!$`
* Edit: `CTRL + A`, `CTRL + E`, `CTRL + W`, `CTRL + K`
* Control: `CTRL + C`, `CTRL + Z`
* Screen: `CTRL + L`
* Navigation: `ALT + B`, `ALT + F`

---

## 🧠 Sysadmin-Specific Mental Models

### 1. Never Retype

If you’re typing the same command twice → you’re losing time.

---

### 2. Interrupt ≠ Kill

* `CTRL + C` → graceful stop
* `kill -9` → last resort

---

### 3. History Is Your Memory

Your shell history is effectively your **operational database**.

---

### 4. Multiplexing Is Mandatory

Using tools like tmux is not optional in serious environments.

---

## 🚀 Optional Next Layer

If you want to level up further:

* Custom keybindings (`.inputrc`)
* `tmux` scripting + layouts
* Zsh widgets (`zle`)
* Fuzzy finders (`fzf` with CTRL+R override)

---

If you want, I can turn this into:

* a **real incident-response workflow simulation**, or
* a **“zero-to-hero terminal setup”** (aliases, tmux config, prompt, history tuning) that sysadmins actually use in production.
