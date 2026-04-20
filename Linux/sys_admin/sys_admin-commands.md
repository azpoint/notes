Here’s a **sysadmin-focused Linux system commands guide**, distilled to the **80/20 that actually runs production systems**. This is organized by operational domains (processes, networking, storage, etc.) and biased toward **debugging, recovery, and control**.

---

# ⚙️ Linux System Commands (Sysadmin 80/20)

## 🧠 Core Mental Model

You’re constantly answering:

* *What’s running?*
* *Why is it broken?*
* *How do I fix it safely?*

So the toolkit revolves around:

* **inspection → filtering → action**

---

# 🔄 Process & CPU Management

```bash
ps aux                 # Snapshot of all processes
top                    # Real-time view
htop                   # Better UI (if installed)

kill <pid>             # Graceful terminate (SIGTERM)
kill -9 <pid>          # Force kill (SIGKILL)
killall <name>         # Kill by process name
```

### High-Value Patterns

```bash
ps aux | grep nginx
```

```bash
top -o %CPU
```

### Insight

* Always try `kill` before `kill -9`
* `top` = live state, `ps` = static snapshot

---

# ⚙️ Services & Init (systemd)

Core tool: systemd

```bash
systemctl status nginx
systemctl start nginx
systemctl stop nginx
systemctl restart nginx
systemctl enable nginx
systemctl disable nginx
```

---

### Debugging

```bash
systemctl status <service>
journalctl -u <service>
journalctl -xe
```

### Insight

* `status` gives immediate health + last logs
* `journalctl` is the real source of truth

---

# 📜 Logs & Observability

```bash
journalctl              # All logs
journalctl -f           # Follow logs
journalctl -u nginx     # Logs for service

tail -f /var/log/syslog
tail -f /var/log/auth.log
```

---

### Pattern: Real-Time Debugging

```bash
journalctl -f | grep ERROR
```

---

# 🌐 Networking

```bash
ip a                    # Show interfaces
ip route                # Routing table
ss -tuln                # Open ports (modern netstat)

ping <host>
curl <url>
```

---

### Port Debugging

```bash
ss -tulnp | grep 80
```

---

### Insight

* `ss` replaces `netstat`
* `curl` is your API/network debugger

---

# 💾 Disk & Filesystem

```bash
df -h                   # Disk usage
du -sh *                # Directory sizes
lsblk                   # Block devices
mount                   # Mounted filesystems
umount                  # Unmount
```

---

### Find Disk Hogs

```bash
du -sh /var/* | sort -h
```

---

### Insight

* `df` = filesystem level
* `du` = file/directory level

---

# 👤 Users & Permissions

```bash
whoami
id                      # User + groups

adduser <user>
deluser <user>

passwd <user>
```

---

### Permissions

```bash
chmod 755 file
chown user:group file
```

---

# 🔐 Privilege Escalation

```bash
sudo <command>
sudo -i                 # Root shell
```

---

### Pattern

```bash
sudo !!
```

---

# 📦 Package Management (Debian/Ubuntu)

```bash
apt update
apt upgrade
apt install <pkg>
apt remove <pkg>
```

---

### Debug Packages

```bash
dpkg -l | grep nginx
```

---

# 🔍 Search & Text Processing

```bash
grep "error" file
grep -r "error" /var/log

find / -name "*.log"
```

---

### Combine Powerfully

```bash
find /var/log -name "*.log" | xargs grep ERROR
```

---

# 🔧 System Info & Diagnostics

```bash
uname -a                # Kernel info
uptime                  # Load + uptime
free -h                 # Memory usage
```

---

### CPU & Load Insight

```bash
uptime
```

→ shows load averages (1, 5, 15 min)

---

# 🔌 Hardware & Kernel

```bash
dmesg                   # Kernel ring buffer
dmesg | tail
```

---

### Insight

* First place to look for:

  * disk errors
  * driver issues
  * boot problems

---

# 🔁 Job & Background Control

```bash
jobs
bg
fg
```

---

### Pattern

```bash
command &
```

→ run in background

---

# ⚡ High-Value Operational Patterns

## 1. Service is down

```bash
systemctl status nginx
journalctl -u nginx
```

---

## 2. Port not accessible

```bash
ss -tulnp | grep 80
ip a
```

---

## 3. Disk full

```bash
df -h
du -sh /var/*
```

---

## 4. High CPU

```bash
top
ps aux --sort=-%cpu | head
```

---

## 5. Memory issues

```bash
free -h
```

---

## 6. Failing login / SSH

```bash
tail -f /var/log/auth.log
```

---

# 🧩 Minimal Core (Must-Know Commands)

If you compress everything:

* Processes: `ps`, `top`, `kill`
* Services: `systemctl`, `journalctl`
* Disk: `df`, `du`, `lsblk`
* Network: `ip`, `ss`, `curl`
* Files: `ls`, `cp`, `mv`, `rm`
* Search: `grep`, `find`
* System: `uptime`, `free`, `uname`

---

# 🧠 Sysadmin Mental Models

### 1. Logs First, Not Guessing

Always:

```bash
journalctl -xe
```

---

### 2. Verify Before Acting

* Check process
* Check port
* Check logs

---

### 3. Prefer Graceful Operations

* `systemctl restart` > kill
* `kill` > `kill -9`

---

### 4. Everything Is Composable

The real power:

```bash
ps aux | grep | sort | head
```

---

# 🚀 Optional Next Layer (High ROI)

Once solid:

* `lsof` → open files & ports
* `strace` → syscall tracing
* `tcpdump` → packet capture
* `watch` → repeat commands
* `nc` (netcat) → raw network debugging

