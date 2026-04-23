`netstat` is one of those tools where 90% of the interface is noise unless you know exactly what signal you’re extracting. The 80/20 is about **seeing connections, listening ports, and which processes own them**—fast.

---

# The 80/20 Guide to netstat

## Mental Model (core idea)

`netstat` = **snapshot of your machine’s network state**

It answers:

* What connections exist?
* What ports are open?
* Which processes are responsible?

Think: `ps` but for network sockets.

---

## The One Command to Remember

```bash
netstat -tulnp
```

This gives you:

* TCP + UDP
* Listening sockets
* Numeric output (fast, no DNS lag)
* Process IDs

### Flag breakdown:

* `-t` → TCP
* `-u` → UDP
* `-l` → listening only
* `-n` → numeric (no DNS resolution)
* `-p` → process (PID/program name)

If something is “running on a port,” this command finds it.

---

## The 3 Core Use Cases

## 1. “What’s running on this machine?”

```bash
netstat -tulnp
```

Typical output:

```
tcp   0   0 0.0.0.0:80   0.0.0.0:*   LISTEN   1234/nginx
```

Interpretation:

* `0.0.0.0:80` → listening on all interfaces
* `LISTEN` → waiting for connections
* `nginx` → owning process

---

## 2. “What connections are active?”

```bash
netstat -tn
```

Shows:

* Established outbound/inbound connections
* No DNS lookup (fast)

Example:

```
192.168.1.10:52344 → 142.250.74.14:443 ESTABLISHED
```

---

## 3. “Who is using this port?”

```bash
netstat -tulnp | grep :3000
```

This is the go-to debugging move.

---

## Understanding the Output (minimal decoding)

### Key columns:

* **Local Address** → your machine (IP:port)
* **Foreign Address** → remote endpoint
* **State** → connection lifecycle
* **PID/Program** → owner

---

## The Only States You Really Need

Ignore the rest—focus on these:

* `LISTEN` → server waiting for connections
* `ESTABLISHED` → active connection
* `TIME_WAIT` → recently closed (normal, not a problem)

---

## High-Value Patterns

### Check if a server started correctly

```bash
netstat -tulnp | grep :80
```

---

### Debug “port already in use”

```bash
netstat -tulnp | grep :PORT
```

Then kill:

```bash
kill -9 <PID>
```

---

### See all outbound connections

```bash
netstat -tn
```

---

### Count connections (quick load check)

```bash
netstat -tn | wc -l
```

---

## Performance Insight

DNS lookups are slow. Always prefer:

```bash
netstat -n
```

Without it, `netstat` tries reverse DNS resolution → delays + noise.

---

## Common Pitfalls

### 1. Forgetting `-n`

Leads to slow, cluttered output with hostnames.

---

### 2. Missing `-p` (no process info)

Without it, you lose the most useful debugging signal.

---

### 3. Running without sudo

```bash
sudo netstat -tulnp
```

Needed to see all processes.

---

## Modern Replacement (important context)

On many systems, `netstat` is deprecated in favor of:

* ss

Example equivalent:

```bash
ss -tulnp
```

Why `ss` is better:

* Faster (no `/proc` parsing overhead)
* More detailed
* Actively maintained

---

## Minimal Cheat Sheet

```bash
# show listening ports + processes
netstat -tulnp

# show active connections
netstat -tn

# find process using port
netstat -tulnp | grep :PORT

# faster output
netstat -n

# full visibility
sudo netstat -tulnp
```

---

## Final Takeaway

You don’t need to memorize `netstat`—you need to **pattern-match quickly**:

* “What’s listening?” → `-tulnp`
* “What’s connected?” → `-tn`
* “Who owns this port?” → `grep :PORT`

That’s the operational core.


