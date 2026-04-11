Here’s a **clean, high-signal 80/20 guide to Linux system files**—focused on what actually matters in a sysadmin workflow. This is structured around *real operational domains* (identity, networking, services, etc.), not just a flat list.

---

# 🗂️ Linux System Files (80/20 for Sysadmins)

## 🧠 Core Mental Model

* `/etc` → **configuration (static, human-edited)**
* `/var` → **runtime data (logs, state, caches)**
* `/proc` → **kernel + process runtime view (virtual FS)**
* `/sys` → **hardware + kernel interface**
* `/home` → **user space**
* `/bin`, `/usr/bin` → **executables**

Think:

> `/etc = intent`, `/var = reality`

---

# 👤 Identity & Authentication

## Critical Files

```bash
/etc/passwd     # User accounts (public info)
/etc/shadow     # Password hashes (root-only)
/etc/group      # Group definitions
/etc/sudoers    # sudo permissions
```

### What Matters

### `/etc/passwd`

```text
user:x:1000:1000:User Name:/home/user:/bin/bash
```

* Structure: `username:password:UID:GID:comment:home:shell`
* `x` → actual password is in `/etc/shadow`

---

### `/etc/shadow`

* Stores hashed passwords + aging policies
* Only readable by root

---

### `/etc/sudoers`

Edit with:

```bash
visudo
```

Example:

```bash
user ALL=(ALL) ALL
```

**Rule**: never edit directly → syntax errors = broken sudo

---

# 🌐 Networking

## Core Files

```bash
/etc/hosts         # Static hostname resolution
/etc/hostname      # System hostname
/etc/resolv.conf   # DNS servers
```

---

### `/etc/hosts`

```text
127.0.0.1 localhost
192.168.1.10 myserver
```

* Overrides DNS
* Useful for testing or internal mapping

---

### `/etc/resolv.conf`

```text
nameserver 8.8.8.8
```

⚠️ Often managed by:

* NetworkManager
* systemd-resolved

---

# ⚙️ Services & Init System (systemd)

## Key Locations

```bash
/etc/systemd/system/     # Custom services
/lib/systemd/system/     # Installed services
```

---

### Service File Example

```ini
[Unit]
Description=My App

[Service]
ExecStart=/usr/bin/myapp

[Install]
WantedBy=multi-user.target
```

---

### Core Commands

```bash
systemctl status nginx
systemctl start nginx
systemctl enable nginx
```

---

# 📜 Logs & Observability

## Key Locations

```bash
/var/log/syslog     # General logs (Debian/Ubuntu)
/var/log/auth.log   # Authentication logs
/var/log/kern.log   # Kernel logs
```

---

### systemd Journal

```bash
journalctl
journalctl -u nginx
journalctl -f
```

**Insight**:

* Modern systems rely more on `journalctl` than raw log files.

---

# 💾 Disk & Filesystems

## Core Files

```bash
/etc/fstab     # Mount configuration
```

---

### `/etc/fstab`

```text
UUID=xxx / ext4 defaults 0 1
```

Controls:

* What mounts at boot
* Where and how

⚠️ Misconfig → system may fail to boot

---

### Useful Commands

```bash
mount
umount
lsblk
df -h
```

---

# 🔐 Security & Access Control

## Important Files

```bash
/etc/ssh/sshd_config   # SSH server config
/etc/hosts.allow       # TCP wrappers (legacy)
/etc/hosts.deny
```

---

### `/etc/ssh/sshd_config`

Key settings:

```text
PermitRootLogin no
PasswordAuthentication no
```

After changes:

```bash
systemctl restart ssh
```

---

# 🌍 Environment & Shell

## Global Config

```bash
/etc/environment     # Global env variables
/etc/profile         # Login shell config
/etc/bash.bashrc     # System-wide bash config
```

---

## User-Level

```bash
~/.bashrc
~/.profile
```

---

# 📦 Package Management

## Debian/Ubuntu

```bash
/etc/apt/sources.list
/etc/apt/sources.list.d/
```

Defines:

* Package repositories
* Mirrors

---

# 🔧 Kernel & System Tuning

## Key File

```bash
/etc/sysctl.conf
```

Apply changes:

```bash
sysctl -p
```

Example:

```text
net.ipv4.ip_forward=1
```

---

# 🔌 Hardware & Kernel Interfaces

## Virtual Filesystems

```bash
/proc    # Process + kernel info
/sys     # Hardware + kernel interface
```

---

### Examples

```bash
cat /proc/cpuinfo
cat /proc/meminfo
```

---

# ⚡ High-Value Operational Patterns

## 1. Debug Login Issues

* Check:

  * `/etc/passwd`
  * `/etc/shadow`
  * `/var/log/auth.log`

---

## 2. Debug Service Failure

```bash
systemctl status <service>
journalctl -u <service>
```

---

## 3. Fix DNS Issues

* Inspect:

  * `/etc/resolv.conf`
  * `/etc/hosts`

---

## 4. Disk Not Mounting

* Check:

  * `/etc/fstab`
  * `lsblk`

---

## 5. SSH Access Broken

* Inspect:

  * `/etc/ssh/sshd_config`
  * logs (`auth.log`)

---

# 🧩 Minimal Core (Must-Know Files)

If you compress everything:

* Identity: `/etc/passwd`, `/etc/shadow`
* Privileges: `/etc/sudoers`
* Networking: `/etc/hosts`, `/etc/resolv.conf`
* Services: `/etc/systemd/system/`
* Logs: `/var/log/`, `journalctl`
* Storage: `/etc/fstab`
* SSH: `/etc/ssh/sshd_config`
* Env: `/etc/environment`

---

# 🧠 Mental Models That Matter

### 1. `/etc` is Source of Truth

If something behaves oddly → config likely lives here.

---

### 2. Logs Are Ground Truth

Never guess:

```bash
journalctl -xe
```

---

### 3. systemd Owns the System

* Services
* Boot process
* Logging (partially)

---

### 4. Boot Is Fragile

* `fstab`, `grub`, `init` configs → high risk

---

# 🚀 Optional Next Layer (High ROI)

Once solid on the above:

* `/etc/nginx/` → web servers
* `/etc/docker/` → containers
* `/var/lib/` → app state
* `/boot/` → kernel + bootloader
* `crontab` / `/etc/cron.*` → scheduling

---

If you want, I can take this further into:

* a **“day in the life of a sysadmin” debugging flow**, or
* a **production hardening checklist** (SSH, firewall, fail2ban, kernel tuning, etc.) which builds directly on these files.
