It’s purpose-built for fast Layer-2 host discovery on local networks.

---

## 1) Install

```bash
sudo apt update
sudo apt install arp-scan
```

Verify:

```bash
arp-scan --version
```

---

## 2) What arp-scan actually does

Unlike tools that rely on ICMP/TCP, `arp-scan` uses **ARP (Address Resolution Protocol)** at Layer 2:

* Sends ARP requests across the local subnet
* Any active device must reply with its MAC address
* Works even if ICMP (ping) is blocked

**Implication:** it only works on the **local broadcast domain** (same LAN/VLAN).

---

## 3) Basic Usage

### 🔹 Scan your local network

```bash
sudo arp-scan --localnet
```

---

### 🔹 Specify interface

```bash
sudo arp-scan --interface=wlan0 --localnet
```

Find interfaces:

```bash
ip a
```

---

### 🔹 Scan a specific subnet

```bash
sudo arp-scan 192.168.1.0/24
```

---

## 4) Output Breakdown

Example:

```
192.168.1.10    aa:bb:cc:dd:ee:ff    Apple, Inc.
```

Fields:

* **IP address**
* **MAC address**
* **Vendor** (from OUI database)

---

## 5) Useful Options

### 🔹 Faster scanning

```bash
sudo arp-scan --localnet --retry=2 --timeout=50
```

### 🔹 Ignore vendor lookup (faster)

```bash
sudo arp-scan --localnet --numeric
```

### 🔹 Limit bandwidth (stealthier)

```bash
sudo arp-scan --localnet --bandwidth=500k
```

---

## 6) Save Output

```bash
sudo arp-scan --localnet > scan.txt
```

CSV-style:

```bash
sudo arp-scan --localnet --plain > scan.csv
```

---

## 7) Real-World Use Cases

### 🔹 Find all devices on your Wi-Fi

```bash
sudo arp-scan --interface=wlan0 --localnet
```

### 🔹 Identify unknown devices

Look at:

* unfamiliar MAC vendors
* duplicate vendors (e.g., many “Espressif” = IoT devices)

### 🔹 Pre-scan before deeper probing

Use with **Nmap**:

```bash
nmap -sn 192.168.1.0/24
```

…but `arp-scan` is usually faster and more reliable on LAN.

---

## 8) Permissions Note

You almost always need:

```bash
sudo
```

because it uses raw packet sockets.

---

## 9) Limitations (important)

* ❌ Doesn’t work across routers (no WAN scanning)
* ❌ Won’t detect devices on different VLANs
* ❌ Can miss devices in power-saving / stealth modes
* ❌ IPv4-focused (ARP is not used in IPv6; that’s NDP)

---

## 10) Quick Workflow (practical)

1. Discover hosts:

   ```bash
   sudo arp-scan --localnet
   ```
2. Pick interesting IPs
3. Deep scan with:

   ```bash
   nmap -sV <ip>
   ```

---

## 11) Pro Tip (nerdy but useful)

ARP responses are deterministic at Layer 2—there’s no firewall concept like with TCP/ICMP. That’s why `arp-scan` often reveals devices that tools like `ping` or even basic `nmap` sweeps miss.

---

If you want, I can:

* show how to fingerprint devices from MAC patterns
* or build a combined arp-scan + nmap workflow for recon labs
