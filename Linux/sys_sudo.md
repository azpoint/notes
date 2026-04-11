Here’s your section **cleaned, normalized, and structured**, with clearer distinctions between `sudo` and `su` (which is critical in sysadmin work):

---

# 🔐 Running Commands as Root (`sudo`, `su`)

## ⚡ Using `sudo` (Preferred)

```bash id="k2h8x9"
sudo command          # Run a single command as root
```

### Notes

* Requires user to be in:

  * `sudo` group (Ubuntu/Debian)
  * `wheel` group (CentOS/RHEL)
* Prompts for **your user password**, not root’s

---

## 🧑‍💻 Root Shell via `sudo`

```bash id="a7f3m1"
sudo -i               # Start a root login shell (recommended)
```

```bash id="p9x4t2"
sudo su               # Switch to root (less clean, but common)
```

### Key Difference

* `sudo -i` → loads root’s environment (cleaner)
* `sudo su` → mixes environments (can cause subtle issues)

---

## 🔑 Using `su` (Switch User)

```bash id="z8n2q5"
su                    # Switch to root user
```

### Notes

* Requires **root password**
* Often disabled by default on Ubuntu

---

## 🔐 Setting & Changing Passwords

```bash id="m4w7c8"
sudo passwd root      # Set or change root password
```

```bash id="q1v6d3"
passwd username       # Change password for a user
```

---

## 🔄 Switching to Another User

```bash id="x3k9p0"
su - username         # Switch to another user with login shell
```

---

## 🧠 Best Practices (Sysadmin Reality)

### Prefer `sudo` over `su`

* Better auditing (logged in `/var/log/auth.log`)
* Granular permissions (via `/etc/sudoers`)
* Reduced risk

---

### Avoid persistent root shells unless necessary

* Use:

```bash id="y7b2n6"
sudo command
```

instead of staying root for long sessions

---

### Always use `visudo` for sudo config

```bash id="r5t8c1"
visudo
```

---

## ⚡ High-Value Patterns

### 1. Fix permission error instantly

```bash id="d2j6f9"
sudo !!
```

---

### 2. Run command as another user

```bash id="c8n4v7"
sudo -u username command
```

---

### 3. Open root shell safely

```bash id="e6m1k3"
sudo -i
```

---

## 🧩 Minimal Core (Must-Know)

* `sudo command` → run as root
* `sudo -i` → root shell
* `su -` → switch user (root password required)
* `passwd` → manage passwords

---

## ⚠️ Common Pitfalls

* `sudo su` → environment contamination
* enabling root login unnecessarily → security risk
* forgetting you're root → accidental destructive commands (`rm -rf /` territory)

---

If you want, I can extend this into a **privilege escalation & hardening guide** (sudo policies, disabling root SSH, least privilege, auditing), which is a key part of real sysadmin work.
