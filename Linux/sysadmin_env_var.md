Here’s a **sysadmin-focused environment variables guide**, distilled to the **80/20 variables that actually impact system behavior, debugging, services, and production environments**.

This is not just a list—it's organized by **operational relevance**.

---

# 🌍 Sysadmin Environment Variables (80/20)

## 🧠 Core Mental Model

Environment variables influence:

* **Execution** (what binary runs)
* **Identity** (who you are)
* **Networking** (how you reach things)
* **Runtime behavior** (debug, config, paths)

Think:

> Env vars = *runtime configuration layer injected into processes*

---

# ⚙️ Core System Variables (Always Relevant)

```bash
PATH        # Executable lookup paths
HOME        # User home directory
PWD         # Current working directory
OLDPWD      # Previous directory
SHELL       # Default shell
TERM        # Terminal type
```

---

## 🔬 Why `PATH` is Critical

```bash
echo $PATH
```

Controls command resolution order:

```bash
/usr/local/bin:/usr/bin:/bin
```

### High-Impact Insight

* First match wins → can override system binaries
* Common debugging:

```bash
which python
type python
```

---

# 👤 Identity & Privilege

```bash
USER        # Current user
LOGNAME     # Login name
UID         # User ID (not always exported)

SUDO_USER   # Original user (when using sudo)
SUDO_UID
SUDO_GID
```

---

## 🔐 Sysadmin Insight

When running:

```bash
sudo command
```

* `USER=root`
* `SUDO_USER=original_user`

👉 Critical for scripts that need to know the real user.

---

# 🌐 Networking & Remote Access

```bash
HOSTNAME    # System hostname
SSH_CLIENT  # Client IP + ports
SSH_TTY     # TTY used in SSH session
```

---

## Real Use

```bash
echo $SSH_CLIENT
```

→ Identify who is connected

---

# 🌍 Locale & Encoding

```bash
LANG
LC_ALL
LC_TIME
LC_NUMERIC
```

---

## Why It Matters

* Affects sorting, parsing, scripting
* Common bug source in automation

---

# 📦 Execution & Runtime Control

```bash
EDITOR      # Default editor (vim, nano)
VISUAL      # Preferred visual editor
PAGER       # Paging program (less, more)
```

---

## Real Use

```bash
export EDITOR=vim
```

Used by tools like:

* git
* crontab
* system utilities

---

# 📁 Temporary & Runtime Paths

```bash
TMPDIR      # Temporary directory
```

---

## Why It Matters

* Some services rely on writable temp dirs
* Debug disk or permission issues

---

# 🔧 Debugging & Development Variables

```bash
DEBUG=1
ENV=production
```

---

## Common Patterns

```bash
NODE_ENV=production
PYTHONUNBUFFERED=1
```

---

# 🐍 Python-Specific (Common in Infra)

```bash
PYTHONPATH     # Module lookup path
VIRTUAL_ENV    # Active virtual environment
```

---

# 🟢 Node / JS Ecosystem

```bash
NODE_ENV       # dev / production
PORT           # Service port
```

---

# 🐳 Container / DevOps Context

```bash
HOSTNAME       # Container hostname
```

---

## Insight

Inside containers:

* `HOSTNAME` often = container ID
* Env vars are primary config injection mechanism

---

# 🔗 Dynamic Loader & Libraries

```bash
LD_LIBRARY_PATH
```

---

## Why It Matters

* Controls shared library lookup
* Misconfig = binaries fail to run

---

# ⚡ High-Impact Operational Patterns

## 1. Override config per command

```bash
ENV=production ./app
```

---

## 2. Debug PATH issues

```bash
echo $PATH
which <command>
```

---

## 3. Detect SSH session

```bash
if [ -n "$SSH_CLIENT" ]; then echo "remote"; fi
```

---

## 4. Preserve environment with sudo

```bash
sudo -E command
```

---

## 5. Clean environment

```bash
env -i bash
```

---

# 🔒 Security-Sensitive Variables

```bash
API_KEY
SECRET_KEY
TOKEN
PASSWORD
```

---

## Sysadmin Rule

* Never log them
* Never expose via `ps` or history
* Prefer:

  * `.env` files (restricted perms)
  * secret managers

---

# 🧩 Minimal Core (Must-Know)

If you compress everything:

* Execution: `PATH`
* Identity: `USER`, `SUDO_USER`
* Location: `HOME`, `PWD`
* Session: `SHELL`, `TERM`
* Networking: `HOSTNAME`, `SSH_CLIENT`
* Runtime: `EDITOR`, `TMPDIR`

---

# 🧠 Sysadmin Mental Models

### 1. PATH = Control Plane

If something “weird” runs → check `PATH` first.

---

### 2. sudo Changes Context

Environment is partially reset unless:

```bash
sudo -E
```

---

### 3. Env = Hidden Config Layer

Many bugs = invisible env differences between:

* shell
* cron
* systemd

---

### 4. systemd != shell

Services do NOT inherit your shell env.

Set explicitly in:

```ini
Environment=KEY=value
```

---

# 🚀 Optional Next Layer

If you want to go deeper:

* systemd `EnvironmentFile=`
* `.env` + `direnv`
* container env injection (Docker/Kubernetes)
* secure secret management (Vault, SSM)

---

If you want, I can turn this into:

* a **debugging checklist (env-related failures)**, or
* a **real production setup guide (systemd + env + secrets)** which is where most sysadmins get burned.
