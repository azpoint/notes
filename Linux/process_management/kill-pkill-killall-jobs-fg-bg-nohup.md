Here it is reorganized into clean Markdown with consistent structure:

---

# ⚙️ Process Management (kill, pkill, killall)

## 🔪 Killing Processes

### List available signals

```bash
kill -l
```

### Send signal to a process (by PID)

```bash
# Default signal: SIGTERM (15)
kill pid        # Example: kill 12547
```

### Send a signal to multiple processes

```bash
kill -SIGNAL pid1 pid2 pid3 ...
```

### Send a specific signal (SIGHUP)

```bash
kill -1 pid
kill -HUP pid
kill -SIGHUP pid
```

---

## 🎯 Kill Processes by Name

```bash
# Using pkill (by process name)
pkill process_name          # Example: pkill sleep

# Using killall
killall process_name

# Using pidof + kill
kill $(pidof process_name)  # Example: kill -HUP $(pidof sshd)
```

---

## 🧵 Job Control & Background Processes

### Run a process in the background

```bash
command &   # Example: sleep 100 &
```

### Show running jobs

```bash
jobs
```

### Pause a running process

```bash
Ctrl + Z
```

### Resume a process in the foreground

```bash
fg %job_id
```

### Resume a process in the background

```bash
bg %job_id
```

---

## 🛡️ Persistent Processes

### Run a process immune to SIGHUP

```bash
nohup command &     # Example: nohup wget http://site.com &
```


