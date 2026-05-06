# NMAP Quick Guide

---

## 1) Install on Ubuntu

```bash
sudo apt update
sudo apt install nmap
```

Verify:

```bash
nmap --version
```

---

## 2) Core Concept (what Nmap actually does)

Nmap probes hosts using crafted packets and interprets responses to infer:

* host availability (ICMP / ARP / TCP probes)
* open/closed/filtered ports
* running services + versions
* OS fingerprint (TCP/IP stack behavior)

---

## 3) The Essential Commands

### 🔹 Basic host scan

```bash
nmap 192.168.1.1
```

* Default: top 1000 TCP ports
* Shows open ports + service names

---

### 🔹 Scan multiple targets

```bash
nmap 192.168.1.1 192.168.1.10
nmap 192.168.1.0/24
```

---

### 🔹 Ping scan (discover live hosts only)

```bash
nmap -sn 192.168.1.0/24
```

---

### 🔹 Scan all ports (1–65535)

```bash
nmap -p- 192.168.1.1
```

---

### 🔹 Scan specific ports

```bash
nmap -p 22,80,443 192.168.1.1
```

---

## 4) Service & OS Detection

### 🔹 Service version detection

```bash
nmap -sV 192.168.1.1
```

### 🔹 OS detection

```bash
sudo nmap -O 192.168.1.1
```

### 🔹 Aggressive scan (common combo)

```bash
sudo nmap -A 192.168.1.1
```

Includes:

* OS detection
* version detection
* script scanning
* traceroute

---

## 5) Scan Types (important)

### 🔹 TCP SYN scan (stealthy, default with sudo)

```bash
sudo nmap -sS 192.168.1.1
```

### 🔹 TCP connect scan (no sudo)

```bash
nmap -sT 192.168.1.1
```

### 🔹 UDP scan (slow but useful)

```bash
sudo nmap -sU 192.168.1.1
```

---

## 6) Nmap Scripting Engine (NSE)

Run default scripts:

```bash
nmap -sC 192.168.1.1
```

Run specific script:

```bash
nmap --script http-title 192.168.1.1
```

List scripts:

```bash
ls /usr/share/nmap/scripts/
```

---

## 7) Output Options (for reporting)

### 🔹 Save normal output

```bash
nmap -oN scan.txt 192.168.1.1
```

### 🔹 XML (for tools)

```bash
nmap -oX scan.xml 192.168.1.1
```

### 🔹 All formats

```bash
nmap -oA scan 192.168.1.1
```

---

## 8) Speed & Timing

```bash
nmap -T4 192.168.1.1
```

* `-T0` → paranoid (very slow)
* `-T5` → aggressive (fast but noisy)

---

## 9) Useful Combos (real-world)

### Quick network overview

```bash
nmap -sn 192.168.1.0/24
```

### Find services fast

```bash
nmap -T4 -F 192.168.1.1
```

### Full recon

```bash
sudo nmap -sS -sV -O -p- -T4 192.168.1.1
```

---

## 10) Read Results Like a Pro

Example:

```
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 8.2
80/tcp open  http    Apache 2.4.41
```

* **open** → service accepts connections
* **closed** → reachable but no service
* **filtered** → firewall interference

---

## 11) Legal + Practical Note

Only scan:

* systems you own
* systems you have explicit permission to test

Unauthorized scanning can trigger IDS alerts or legal issues.

---

## 12) If You Want to Go Deeper

You can explore:

* evasion (`--spoof-mac`, decoys)
* firewall bypass techniques
* vulnerability scanning scripts (`vuln` category)

---

