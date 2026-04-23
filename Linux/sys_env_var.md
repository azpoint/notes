Here’s a cleaned, structured, and practical reference for **Linux environment variables**—with emphasis on how they actually behave at the process level and which ones matter most in daily work.

---

# 🌍 Linux Environment Variables (80/20 Practical Guide)

## 🧠 What They Actually Are

Environment variables are **key-value pairs attached to a process**.
They form part of the process’s execution context (alongside argv, cwd, file descriptors, etc.).

* Inherited **parent → child** (fork/exec model)
* Not global to the system (despite common misconception)
* Shell variables ≠ environment variables (until exported)

---

## 🔍 Viewing Variables

```bash
printenv            # List environment variables
env                 # Similar to printenv

echo $HOME          # Print specific variable
echo $PATH
```

### Notes

* `env` also runs commands with modified environments.
* `set` shows *all* shell variables (including non-exported).

---

## ✏️ Setting Variables

### Temporary (current shell only)

```bash
MY_VAR="hello"
```

### Export to child processes

```bash
export MY_VAR="hello"
```

### Inline (single command scope)

```bash
MY_VAR="hello" command
```

### Remove variable

```bash
unset MY_VAR
```

---

## 📌 Persistence (Where to Define Them)

| Scope                    | File                              |
| ------------------------ | --------------------------------- |
| User (interactive shell) | `~/.bashrc`                       |
| Login shell              | `~/.profile` or `~/.bash_profile` |
| System-wide              | `/etc/environment`                |

### Notes

* `~/.bashrc` → most commonly used
* `/etc/environment` → no shell expansion (pure key=value)

---

## ⚙️ Core Environment Variables (80/20 Set)

### 🧭 Navigation & Paths

```bash
PATH        # Directories searched for executables
HOME        # User home directory
PWD         # Current working directory
OLDPWD      # Previous directory
```

### Example

```bash
echo $PATH
```

**Insight**: The shell resolves commands by scanning `PATH` left → right.

---

### 👤 User Context

```bash
USER        # Current username
LOGNAME     # Login name
UID         # User ID (not always exported)
```

---

### 🌐 Locale & Language

```bash
LANG        # Default locale
LC_ALL      # Override all locale settings
```

---

### 🖥️ Shell & Session

```bash
SHELL       # Default shell
TERM        # Terminal type (e.g., xterm-256color)
```

---

### 🗂️ Temporary & Runtime

```bash
TMPDIR      # Temp directory
```

---

### 🔐 Privilege Context

```bash
SUDO_USER   # Original user when using sudo
```

---

## 🧪 PATH Deep Dive (High Leverage)

```bash
export PATH="$HOME/bin:$PATH"
```

### Key Properties

* Ordered lookup
* First match wins
* Misordering can shadow system binaries

### Debugging

```bash
which python
type python
```

---

## 🔄 Process-Level Behavior

### Inheritance Model

```bash
export A=1
bash
echo $A   # visible
```

```bash
A=1
bash
echo $A   # NOT visible
```

**Reason**: Only exported variables are passed via `execve`.

---

## 🔗 Using `env` for Isolation

```bash
env -i bash   # Start shell with empty environment
```

Useful for:

* Debugging config pollution
* Reproducibility

---

## 📦 Common Dev Variables

### 🐍 Python

```bash
PYTHONPATH     # Module lookup path
VIRTUAL_ENV    # Active virtualenv
```

### 🟢 Node.js

```bash
NODE_ENV       # development / production
```

### 🔑 General Config

```bash
DEBUG=1
API_KEY=xxx
```

---

## 🔁 Command Substitution & Expansion

```bash
echo "$HOME"        # Safe (quoted)
echo $HOME          # Works, but unsafe in edge cases
```

### Why quoting matters

```bash
FILE="my file.txt"
rm $FILE     # breaks
rm "$FILE"   # correct
```

---

## 🔧 Advanced but Useful (Still 80/20-ish)

### Default Values

```bash
echo ${VAR:-default}
```

### Assign if Unset

```bash
: ${VAR:=default}
```

---

## ⚡ High-Value Patterns

### 1. Temporary Config

```bash
NODE_ENV=production node app.js
```

---

### 2. Extend PATH Safely

```bash
export PATH="$HOME/.local/bin:$PATH"
```

---

### 3. Debug Environment

```bash
env | sort
```

---

### 4. Clean Execution

```bash
env -i PATH=$PATH bash -c 'command'
```

---

## 🧩 Minimal Core (Must-Know)

If you compress everything:

* Inspection: `env`, `printenv`, `echo $VAR`
* Setting: `VAR=value`, `export VAR=value`
* Scope: inline vs exported
* Persistence: `~/.bashrc`
* Critical vars: `PATH`, `HOME`, `SHELL`

---

## 🧠 Mental Models That Matter

### 1. Environment ≠ Global State

Each process gets a **copy**, not a shared reference.

---

### 2. Export = API Boundary

`export` defines what your process exposes to children.

---

### 3. PATH = Resolver

Think of it as a **search algorithm**, not just a string.

---

### 4. Shell Startup Matters

Different files load depending on:

* login vs non-login
* interactive vs non-interactive

---

## 🚀 Optional Next Layer

If you want to go deeper:

* `.inputrc` → readline behavior
* `direnv` → per-directory environments
* `dotenv` → app-level env management
* systemd `Environment=` directives
