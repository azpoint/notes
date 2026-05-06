Here’s a compact, technically grounded guide to **Netfilter** on Ubuntu—focusing on how it actually works and how you use it in practice.

---

# 1) What Netfilter Is (architecture-level)

Netfilter is **inside the Linux kernel**, not a standalone tool. It provides hooks in the networking stack where packets can be:

* inspected
* modified
* accepted or dropped

User-space tools configure it:

* **iptables** (legacy but still common)
* **nftables** (current standard)

---

# 2) Packet Flow (critical mental model)

Packets traverse predefined chains:

```
Incoming:
  PREROUTING → INPUT → (local process)

Forwarded:
  PREROUTING → FORWARD → POSTROUTING

Outgoing:
  (local process) → OUTPUT → POSTROUTING
```

Each step is a **hook** where rules apply.

---

# 3) Tables (what type of processing happens)

### 🔹 filter (default firewalling)

* INPUT
* OUTPUT
* FORWARD

### 🔹 nat (address translation)

* PREROUTING (DNAT)
* POSTROUTING (SNAT/MASQUERADE)

### 🔹 mangle (packet modification)

* TTL, QoS, marks

### 🔹 raw (connection tracking control)

---

# 4) Core Concepts

* **Rule** → condition + action
* **Chain** → ordered list of rules
* **Table** → category of rules
* **Target** → action (ACCEPT, DROP, REJECT, etc.)

---

# 5) Using Netfilter via iptables (quick start)

### 🔹 List rules

```bash
sudo iptables -L -v -n
```

---

### 🔹 Allow SSH (port 22)

```bash
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

---

### 🔹 Allow established connections (very important)

```bash
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
```

---

### 🔹 Drop everything else

```bash
sudo iptables -P INPUT DROP
```

---

### 🔹 Allow localhost

```bash
sudo iptables -A INPUT -i lo -j ACCEPT
```

---

## Minimal safe firewall sequence

```bash
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -P INPUT DROP
```

---

# 6) NAT Example (very common)

Enable IP forwarding:

```bash
sudo sysctl -w net.ipv4.ip_forward=1
```

Masquerade (typical router setup):

```bash
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```

---

# 7) Using nftables (modern approach)

Ubuntu is moving toward **nftables**, which replaces iptables.

### 🔹 Basic config file

```bash
sudo nano /etc/nftables.conf
```

Example:

```nft
table inet filter {
  chain input {
    type filter hook input priority 0;

    iif lo accept
    ct state established,related accept
    tcp dport 22 accept

    drop
  }
}
```

Apply:

```bash
sudo nft -f /etc/nftables.conf
```

---

# 8) Persisting Rules

### iptables:

```bash
sudo apt install iptables-persistent
sudo netfilter-persistent save
```

### nftables:

```bash
sudo systemctl enable nftables
```

---

# 9) Debugging / Observability

### 🔹 Watch counters

```bash
sudo iptables -L -v
```

### 🔹 Log dropped packets

```bash
sudo iptables -A INPUT -j LOG --log-prefix "DROP: "
```

Logs:

```bash
journalctl -f
```

---

# 10) Common Pitfalls

* Locking yourself out (SSH rule missing before DROP)
* Rule order matters (first match wins)
* Mixing `iptables` and `nftables` inconsistently
* Forgetting persistence (rules vanish after reboot)

---

# 11) Mental Model Shortcut (useful)

Think of Netfilter as:

> **A deterministic packet-processing pipeline with programmable decision points**

Each packet:

1. enters a chain
2. hits rules in order
3. stops at first match (usually)

---

# 12) Practical Workflow

1. Define baseline:

   * allow loopback
   * allow established
2. explicitly allow needed services
3. default deny
4. add logging if needed
5. persist rules

---

