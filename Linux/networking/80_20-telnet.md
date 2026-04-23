`telnet` survives not because it’s modern—it survives because it’s the **simplest possible way to manually speak TCP**. The 80/20 is about using it as a **raw connectivity probe and protocol debugger**, not as a login tool.

---

# The 80/20 Guide to telnet

## Mental Model (core idea)

`telnet` = **open a TCP socket and type into it**

That’s it.

No abstraction, no protocol safety—just:

* connect to `host:port`
* send bytes
* read response

Think: **manual network debugging REPL**

---

## The One Command to Remember

```bash id="8s5n9z"
telnet host port
```

Examples:

```bash id="q6x9wl"
telnet google.com 80
telnet localhost 3000
```

If it connects, the port is open. If not, it’s blocked/refused.

---

## The 3 Core Use Cases

## 1. “Is this port reachable?”

```bash id="y4wdlq"
telnet example.com 443
```

### Outcomes:

* ✅ `Connected to ...` → port is open
* ❌ `Connection refused` → service not running
* ❌ hangs → firewall or network issue

This is the fastest sanity check in networking.

---

## 2. “Is my local service actually listening?”

```bash id="h3nq7w"
telnet localhost 3000
```

If it fails:

* app didn’t start
* wrong port
* bound to wrong interface

---

## 3. “What does this service actually return?”

You can manually speak protocols.

### HTTP example:

```bash id="g1w7c1"
telnet example.com 80
```

Then type:

```id="lq3yqj"
GET / HTTP/1.1
Host: example.com

```

(Important: blank line at the end)

You’ll get raw HTTP response headers + body.

---

## Why This Matters

You bypass:

* browsers
* clients
* libraries

You see the **wire-level truth**.

---

## High-Value Patterns

### Debug a web server

```bash id="7b2m8v"
telnet localhost 8080
```

Send:

```id="k2v8pb"
GET /health HTTP/1.1
Host: localhost

```

---

### Test SMTP (mail servers)

```bash id="t8s2yu"
telnet mail.server.com 25
```

You’ll see:

```id="0r5h5m"
220 mail.server.com ESMTP
```

---

### Check if firewall blocks a port

```bash id="6kmr9v"
telnet remote.host 22
```

* connects → open
* hangs → filtered

---

## Output Signals (minimal decoding)

### Success

```id="9hh7mv"
Connected to host.
```

### Refused

```id="vdf3r9"
Connection refused
```

### Timeout / hang

→ packets dropped (firewall)

---

## Limitations (important)

### 1. No encryption

`telnet` is plaintext only.

So:

* ❌ HTTPS (443) → won’t work meaningfully
* ❌ SSH (22) → binary protocol, unreadable

---

### 2. Deprecated for login

Do NOT use it for remote shells.

Replaced by:

* SSH

---

### 3. No UDP support

TCP only.

---

## Better Alternatives (know when to switch)

### For quick port checks:

```bash id="4ph3q3"
nc -vz host port
```

Tool: netcat

---

### For HTTP specifically:

```bash id="qj6f9q"
curl -v http://host
```

Tool: curl

---

### For socket inspection:

Use ss instead

---

## Pitfalls to Avoid

### 1. Forgetting the blank line (HTTP)

Requests won’t send without it.

---

### 2. Trying encrypted protocols

You’ll see garbage or nothing useful.

---

### 3. Assuming silence = success

A hanging connection usually means **blocked**, not working.

---

## Minimal Cheat Sheet

```bash id="9chrxg"
# connect to a port
telnet host port

# test local service
telnet localhost 3000

# manual HTTP request
GET / HTTP/1.1
Host: example.com

```

---

## Final Takeaway

You’re not using `telnet` for telnet.

You’re using it to:

* verify connectivity
* manually poke services
* observe raw protocol behavior

If you remember:

* `telnet host port`
* how to send a basic HTTP request
* how to interpret connect/refuse/hang

…you’ve captured almost all of its practical value.

---

If you want, I can build a **“network debugging stack” playbook** combining `ss`, `telnet`, `nc`, and `tcpdump` into a tight workflow.
