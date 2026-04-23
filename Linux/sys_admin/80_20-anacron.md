Here’s a tight, high-signal 80/20 guide to **anacron** on Ubuntu—focused on what actually matters in real admin work.

---

# 🧠 What anacron *is* (and why you care)

**anacron** is a job scheduler like `cron`, but with one key difference:

> It guarantees jobs run *eventually*, even if the machine was off at the scheduled time.

That makes it ideal for:

* laptops
* dev machines
* intermittently powered servers

Whereas `cron` is time-precise, **anacron is reliability-focused**.

---

# ⚙️ Core Concepts (the 20% that gives 80% value)

### 1. Main config file

```
/etc/anacrontab
```

Typical structure:

```
period   delay   job-id     command
```

Example:

```
7        10      weekly     /usr/local/bin/cleanup.sh
```

* **period** → days between runs
* **delay** → minutes after boot before running
* **job-id** → unique name (used for tracking)
* **command** → what runs

---

### 2. How execution actually works

At boot:

1. anacron checks timestamps in:

   ```
   /var/spool/anacron/
   ```
2. If a job hasn’t run in its period → it gets queued
3. After the delay → job runs

👉 This is the *entire mental model*. No need to overcomplicate it.

---

### 3. Default Ubuntu setup

Ubuntu wires `anacron` into `cron`:

* `/etc/crontab` calls:

  ```
  25 6 * * * root test -x /usr/sbin/anacron || run-parts /etc/cron.daily
  ```

Meaning:

* If anacron exists → it handles periodic jobs
* If not → cron fallback runs

---

# 🔧 Practical Admin Examples

## Example 1 — Reliable daily backup (laptop/server)

```
1    5    backup-job    rsync -a /data /backup
```

Behavior:

* Runs **once per day**
* If system was off → runs next boot
* Waits 5 minutes after boot

👉 This is the canonical anacron use case.

---

## Example 2 — Weekly log cleanup

```
7    15    log-clean    find /var/log -type f -mtime +14 -delete
```

* Runs weekly
* Cleans logs older than 14 days
* Safe for machines not always online

---

## Example 3 — Monthly apt maintenance

```
30    10    apt-maint    apt-get update && apt-get -y upgrade
```

* Runs every 30 days
* Good for non-critical machines
* Add logging if you care about auditability

---

## Example 4 — Staggered heavy jobs (important trick)

```
1    5    job1    /script1.sh
1    20   job2    /script2.sh
1    40   job3    /script3.sh
```

👉 Avoids CPU/disk spikes after boot.

---

## Example 5 — Wrap jobs with logging (do this in real life)

```
1    5    backup-job    /usr/local/bin/backup.sh >> /var/log/backup.log 2>&1
```

Or better:

```
/usr/bin/logger "Backup started"
```

---

# 🧪 Testing & Debugging

### Run manually (foreground debug)

```
sudo anacron -fn
```

Flags:

* `-f` → force run
* `-n` → no delay

---

### Check last run timestamps

```
ls -l /var/spool/anacron/
```

---

### Logs

```
grep anacron /var/log/syslog
```

---

# ⚠️ Common Pitfalls (where people mess up)

### ❌ Expecting exact timing

Anacron is **not precise**. It’s:

* “run sometime after boot”
* not “run at 03:00”

Use `cron` for exact timing.

---

### ❌ Long-running jobs blocking others

Anacron runs jobs **serially by default**.

👉 If one job hangs → others wait.

Solution:

```
command &
```

or better: manage via systemd timers.

---

### ❌ No environment variables

Minimal environment.

Always use full paths:

```
/usr/bin/rsync
```

---

# 🔄 When to use what

| Tool             | Use case                       |
| ---------------- | ------------------------------ |
| `cron`           | precise scheduling             |
| `anacron`        | guaranteed execution           |
| `systemd timers` | modern, flexible, best overall |

👉 In modern Ubuntu, **systemd timers often replace both**, but anacron is still widely used and simpler.

---

# 🧩 Pro-Level Insight

Anacron is essentially:

> a persistence layer on top of time-based scheduling

It tracks *“last execution”* rather than *“next execution”*.

That’s why it survives downtime naturally.

---

# 🚀 Minimal “Best Practice” Setup

If you only remember one pattern, use this:

```
1    5    daily-maint    /usr/local/bin/daily.sh >> /var/log/daily.log 2>&1
7    10   weekly-maint   /usr/local/bin/weekly.sh >> /var/log/weekly.log 2>&1
```

Simple, reliable, production-safe.

---