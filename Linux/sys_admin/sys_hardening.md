Below is a **practical privilege escalation & hardening guide** for Linux systems, tuned for real sysadmin work: controlling *who can become root*, *how they do it*, and *how you audit and reduce risk*.

---

# 🔐 Privilege Escalation & Hardening (Sysadmin Guide)

## 🧠 Core Model

You’re managing three things:

1. **Entry points** → SSH, console, services
2. **Escalation paths** → `sudo`, `su`, SUID binaries
3. **Audit surface** → logs, commands, sessions

Goal:

> Minimize paths → constrain usage → log everything

---

# ⚙️ 1. `sudo` Hardening (Primary Control Plane)

## 🔍 Inspect Current Access

```bash
sudo -l
```

---

## 🛠️ Edit Safely

```bash
visudo
```

---

## 🔐 Principle of Least Privilege

### ❌ Bad (too broad)

```text
user ALL=(ALL) ALL
```

### ✅ Better (restricted command)

```text
user ALL=(ALL) /usr/bin/systemctl restart nginx
```

---

## 🧩 Use Groups Instead of Users

```text
%devops ALL=(ALL) ALL
```

---

## 🔒 Require TTY (prevents some automation abuse)

```text
Defaults requiretty
```

---

## ⏱️ Reduce sudo timeout

```text
Defaults timestamp_timeout=5
```

---

## 🧾 Log Everything

```text
Defaults logfile="/var/log/sudo.log"
```

---

## 🚫 Prevent Shell Escapes

Some binaries allow shell breakout (`vim`, `less`, etc.)

Restrict like:

```text
Defaults noexec
```

---

# 🔑 2. Root Account Security

## 🔒 Disable Root Login (Recommended)

In `/etc/ssh/sshd_config`:

```text
PermitRootLogin no
```

---

## 🔐 Lock Root Account

```bash
sudo passwd -l root
```

---

## ⚠️ When to Enable Root?

Only in:

* recovery scenarios
* single-user environments

---

# 🌐 3. SSH Hardening (Primary Attack Surface)

## 🔐 Key-Based Authentication Only

```text
PasswordAuthentication no
PubkeyAuthentication yes
```

---

## 🚫 Disable Root Login

```text
PermitRootLogin no
```

---

## 🧍 Limit Users

```text
AllowUsers user1 user2
```

---

## 🔢 Change Default Port (minor security-through-obscurity)

```text
Port 2222
```

---

## 🛡️ Idle Timeout

```text
ClientAliveInterval 300
ClientAliveCountMax 0
```

---

## Apply Changes

```bash
systemctl restart ssh
```

⚠️ Always keep an active session when testing SSH changes

---

# 🧨 4. SUID/SGID Risk Management

## 🔍 Find SUID binaries

```bash
find / -perm -4000 -type f 2>/dev/null
```

---

## Why It Matters

* SUID binaries run as **root**
* Exploitable → full privilege escalation

---

## 🛠️ Action

* Audit regularly
* Remove unnecessary SUID bits:

```bash
chmod -s /path/to/binary
```

---

# 📦 5. File Permissions & Ownership

## 🔍 Find world-writable files

```bash
find / -type f -perm -002 2>/dev/null
```

---

## 🔍 Find world-writable dirs

```bash
find / -type d -perm -002 2>/dev/null
```

---

## 🔐 Key Rule

* No sensitive files should be writable by others

---

# 🧾 6. Auditing & Logging

## 🔍 Auth Logs

```bash
tail -f /var/log/auth.log
```

---

## 🔍 Sudo Logs

```bash
tail -f /var/log/sudo.log
```

---

## 🔍 systemd Logs

```bash
journalctl -xe
journalctl -u ssh
```

---

## 🧠 What to Look For

* Repeated failed logins
* Unexpected sudo usage
* Unknown users

---

# 🧑‍💻 7. Environment Hardening

## 🔒 Restrict Dangerous Variables

In `sudoers`:

```text
Defaults env_reset
Defaults secure_path="/usr/sbin:/usr/bin:/sbin:/bin"
```

---

## Why

Prevents:

* PATH hijacking
* malicious env injection

---

# 🔁 8. Cron & Scheduled Tasks

## 🔍 Inspect system cron

```bash
cat /etc/crontab
ls /etc/cron.*
```

---

## 🔍 User cron jobs

```bash
crontab -l
```

---

## ⚠️ Risks

* Running scripts as root
* Writable scripts = privilege escalation

---

# 🧪 9. Process & Runtime Inspection

## 🔍 Running as root

```bash
ps aux | grep root
```

---

## 🔍 Open files & ports

```bash
lsof -i
```

---

## 🔍 Listening services

```bash
ss -tulnp
```

---

# 🧱 10. Defense-in-Depth Additions

## 🛡️ Fail2Ban

* Blocks brute-force attempts

## 🔥 Firewall

```bash
ufw enable
ufw allow ssh
```

---

## 🔐 File Integrity

* `AIDE` or `tripwire`

---

## 📊 Monitoring

* CPU, memory, login patterns

---

# ⚡ High-Value Hardening Checklist

## Minimum baseline

* [ ] Disable root SSH login
* [ ] Use SSH keys only
* [ ] Restrict sudo access
* [ ] Enable logging
* [ ] Audit SUID binaries
* [ ] Check world-writable files
* [ ] Lock unused accounts
* [ ] Configure firewall

---

# 🧠 Sysadmin Mental Models

## 1. Assume Breach Paths Exist

Focus on:

* limiting blast radius
* detecting misuse early

---

## 2. Least Privilege Everywhere

* Users → minimal sudo
* Services → minimal permissions

---

## 3. Logs = Security Signals

No logs → no visibility → no control

---

## 4. Root Is a Liability

Treat root like:

> a loaded weapon — only use when necessary

---

# 🚀 Optional Next Layer (Advanced)

* PAM hardening (`/etc/pam.d/`)
* SELinux / AppArmor
* Centralized logging (SIEM)
* Hardware-backed keys (YubiKey)
* Zero-trust SSH (e.g., short-lived certs)


