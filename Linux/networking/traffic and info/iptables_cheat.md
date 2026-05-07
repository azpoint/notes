# iptables Practical Cheat Sheet (Ubuntu)

## 1) Golden Rule (don’t lock yourself out)

Always allow:

```bash
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
```

---

## 2) Minimal Secure Baseline (server-safe)

```bash
# Allow loopback
sudo iptables -A INPUT -i lo -j ACCEPT

# Allow existing connections
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow SSH
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Default deny
sudo iptables -P INPUT DROP
```

👉 This is the smallest “usable” firewall.

---

## 3) Common Allow Rules

### Allow HTTP/HTTPS

```bash
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
```

### Allow specific IP

```bash
sudo iptables -A INPUT -s 192.168.1.100 -j ACCEPT
```

### Allow subnet

```bash
sudo iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT
```

---

## 4) Blocking Traffic

### Block an IP

```bash
sudo iptables -A INPUT -s 1.2.3.4 -j DROP
```

### Reject (more explicit than DROP)

```bash
sudo iptables -A INPUT -s 1.2.3.4 -j REJECT
```

---

## 5) Rate Limiting (anti-bruteforce)

### Limit SSH attempts

```bash
sudo iptables -A INPUT -p tcp --dport 22 -m limit --limit 5/min -j ACCEPT
```

---

## 6) NAT (router / VM host scenario)

Enable forwarding:

```bash
sudo sysctl -w net.ipv4.ip_forward=1
```

Masquerade outbound traffic:

```bash
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```

---

## 7) Port Forwarding (DNAT)

Forward port 80 → internal host:

```bash
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.1.10:80
```

---

## 8) Logging (debugging rules)

```bash
sudo iptables -A INPUT -j LOG --log-prefix "IPTables-Dropped: "
```

View logs:

```bash
journalctl -f
```

---

## 9) Rule Management

### List rules

```bash
sudo iptables -L -v -n
```

### Delete rule

```bash
sudo iptables -D INPUT 1
```

### Flush all rules

```bash
sudo iptables -F
```

---

## 10) Save Rules (important!)

```bash
sudo apt install iptables-persistent
sudo netfilter-persistent save
```

---

## 11) Mental Model (fast recall)

Every packet:

1. Hits a **chain** (INPUT, OUTPUT, FORWARD)
2. Goes rule-by-rule (top → bottom)
3. Stops at first match

👉 Order matters more than anything.

---

## 12) High-Value Patterns (real-world)

### 🔹 “Allow few, block everything”

```bash
ALLOW → ALLOW → ALLOW → DROP
```

### 🔹 “Stateful firewall”

```bash
ESTABLISHED,RELATED first
```

### 🔹 “Expose only what’s needed”

Only open ports you explicitly use.

---

## 13) Quick Debug Checklist

* Can’t connect? → check rule order
* Locked out? → missing ESTABLISHED rule
* Rule not working? → wrong chain or interface
* NAT broken? → forgot IP forwarding

---

## 14) Nerd Insight (useful)

`conntrack` turns iptables from a stateless filter into a **stateful firewall**. Without it, you'd have to manually allow return traffic for every connection—painful and error-prone.

---

## 15) One-Liner Reset (safe-ish)

If things go sideways:

```bash
sudo iptables -F && sudo iptables -P INPUT ACCEPT
```
