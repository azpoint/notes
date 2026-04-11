Here’s a **refined, sysadmin-grade 80/20 guide to Linux system files**—focused on *what you actually touch in production*, with tighter structure, operational context, and failure-oriented thinking.

---

# 🗂️ Linux System Files (Sysadmin 80/20)

## 🧠 Core Mental Model

* `/etc` → **configuration (what should happen)**
* `/var` → **state (what is happening)**
* `/proc`, `/sys` → **live kernel view**
* `/usr` → **installed software**
* `/home` → **user domain**

Think:

> Debugging = comparing `/etc` (intent) vs `/var` (reality)

---

# 👤 Identity & Access Control

## Critical Files

```bash
/etc/passwd
/etc/shadow
/etc/group
/etc/sudoers
```

---

## 🔍 What Matters

### `/etc/passwd`

```text
user:x:1000:1000:Name:/home/user:/bin/bash
```

* Maps users → UID/GID, shell, home
* If login fails → start here

---

### `/etc/shadow`

* Password hashes + expiration
* Permissions: `root:shadow`
* Corruption = login failures

---

### `/etc/sudoers`

Edit ONLY with:

```bash
visudo
```

Example:

```text
user ALL=(ALL) ALL
```

⚠️ Misconfig → locked out of sudo

---

# 🌐 Networking

## Core Files

```bash
/etc/hosts
/etc/hostname
/etc/resolv.conf
```

---

### `/etc/hosts`

* Static DNS override
* Used before DNS queries

---

### `/etc/resolv.conf`

```text
nameserver 8.8.8.8
```

⚠️ Often overwritten by:

* NetworkManager
* systemd-resolved

---

### `/etc/hostname`

* System identity
* Used in prompts, logs, networking

---

# ⚙️ Services & Init (systemd)

## Locations

```bash
/etc/systemd/system/
/lib/systemd/system/
```

---

### What Matters

* `/etc/systemd/system/` → overrides & custom services
* `/lib/systemd/system/` → package-managed defaults

---

### Service Debug Flow

```bash
systemctl status nginx
journalctl -u nginx
```

---

# 📜 Logs (Where Reality Lives)

## Key Files

```bash
/var/log/syslog
/var/log/auth.log
/var/log/kern.log
```

---

## Modern Logging

```bash
journalctl
journalctl -xe
journalctl -u <service>
```

---

## Insight

* File logs = legacy but still useful
* `journalctl` = primary in modern systems

---

# 💾 Disk & Filesystems

## Critical File

```bash
/etc/fstab
```

---

### Example

```text
UUID=xxx / ext4 defaults 0 1
```

---

## Why It Matters

* Controls boot-time mounts
* Bad config → system may not boot

---

## Debug Flow

```bash
lsblk
mount
df -h
```

---

# 🔐 Security & Remote Access

## Key File

```bash
/etc/ssh/sshd_config
```

---

### High-Impact Settings

```text
PermitRootLogin no
PasswordAuthentication no
```

---

### Apply Changes

```bash
systemctl restart ssh
```

---

## Failure Mode

* Misconfig → SSH lockout (always keep an open session)

---

# 🌍 Environment & Shell

## System-Level

```bash
/etc/environment
/etc/profile
/etc/bash.bashrc
```

---

## User-Level

```bash
~/.bashrc
~/.profile
```

---

## Insight

* `/etc/environment` → no variable expansion
* Shell files → scripting + logic

---

# 📦 Package Management

## Debian/Ubuntu

```bash
/etc/apt/sources.list
/etc/apt/sources.list.d/
```

---

## Why It Matters

* Broken repos → cannot install/update
* Security updates depend on this

---

# 🔧 Kernel & System Tuning

## Core File

```bash
/etc/sysctl.conf
```

---

### Example

```text
net.ipv4.ip_forward=1
```

Apply:

```bash
sysctl -p
```

---

# 🔌 Runtime System Interfaces

## Virtual Filesystems

```bash
/proc
/sys
```

---

### Examples

```bash
cat /proc/cpuinfo
cat /proc/meminfo
```

---

## Insight

* Real-time kernel state
* No persistence

---

# 🕒 Scheduling & Automation

## Cron System

```bash
/etc/crontab
/etc/cron.d/
/etc/cron.daily/
/etc/cron.hourly/
```

---

## User Cron

```bash
crontab -e
```

---

## Failure Mode

* Jobs not running → check:

  * logs
  * environment differences

---

# ⚡ High-Value Debugging Patterns

## 1. User cannot login

Check:

```bash
/etc/passwd
/etc/shadow
/var/log/auth.log
```

---

## 2. Service not starting

```bash
systemctl status <service>
journalctl -u <service>
```

---

## 3. DNS broken

```bash
/etc/resolv.conf
/etc/hosts
```

---

## 4. Disk issues

```bash
/etc/fstab
lsblk
df -h
```

---

## 5. SSH failure

```bash
/etc/ssh/sshd_config
/var/log/auth.log
```

---

## 6. Cron job not running

Check:

```bash
/etc/crontab
journalctl
```

---

# 🧩 Minimal Core (Must-Know Files)

If you compress everything:

* Identity: `/etc/passwd`, `/etc/shadow`
* Privileges: `/etc/sudoers`
* Network: `/etc/hosts`, `/etc/resolv.conf`
* Services: `/etc/systemd/system/`
* Logs: `/var/log/`, `journalctl`
* Disk: `/etc/fstab`
* SSH: `/etc/ssh/sshd_config`
* Env: `/etc/environment`
* Scheduler: `/etc/crontab`

---

# 🧠 Sysadmin Mental Models

### 1. `/etc` is the Control Plane

If behavior is wrong → config is wrong.

---

### 2. Logs Are Truth

Never assume:

```bash
journalctl -xe
```

---

### 3. Boot Path is Fragile

Critical files:

* `/etc/fstab`
* bootloader configs (`/boot`)

---

### 4. Services Are Declarative

systemd defines:

* what runs
* how it restarts
* dependencies

---

### 5. Environment Differences Kill Systems

* shell ≠ cron ≠ systemd

---

# 🚀 Optional Next Layer (High ROI)

Once solid:

* `/etc/nginx/` → web servers
* `/etc/docker/` → containers
* `/var/lib/` → application state
* `/boot/` → kernel & initramfs
* `/etc/security/` → PAM configs

---

If you want, I can take this one step further into:

* a **full incident-response playbook (real scenarios)**, or
* a **production hardening checklist** (SSH, firewall, logging, auditing, fail2ban, etc.).
