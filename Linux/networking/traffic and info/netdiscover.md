Here’s a focused, no-fluff guide to using **Netdiscover** on Ubuntu. It overlaps with `arp-scan` conceptually but is more interactive and reconnaissance-oriented.

---

## 1) Install

```bash
sudo apt update
sudo apt install netdiscover
```

Verify:

```bash
netdiscover -h
```

---

## 2) What Netdiscover Does

`netdiscover` is a passive/active **ARP-based scanner**:

* Detects hosts on a LAN via ARP traffic
* Can **passively sniff** without sending packets
* Displays results in real-time (like a console dashboard)

Think: lightweight LAN recon + monitoring.

---

## 3) Basic Usage

### 🔹 Auto mode (fastest way)

```bash
sudo netdiscover
```

* Picks an interface automatically
* Scans common private ranges

---

### 🔹 Specify interface

```bash
sudo netdiscover -i wlan0
```

---

### 🔹 Specify network range

```bash
sudo netdiscover -r 192.168.1.0/24
```

---

## 4) Passive Mode (stealthy)

```bash
sudo netdiscover -p
```

* No packets sent
* Only listens to existing ARP traffic
* Slower but quiet (useful in monitored environments)

---

## 5) Output Explained

Typical table:

```
IP            MAC Address         Count     Len  MAC Vendor
192.168.1.1   aa:bb:cc:dd:ee:ff   10        60   Cisco Systems
```

Fields:

* **IP** → device address
* **MAC** → hardware address
* **Count** → packets seen (activity indicator)
* **Vendor** → manufacturer via OUI

---

## 6) Key Options

### 🔹 Scan range + interface

```bash
sudo netdiscover -i eth0 -r 192.168.1.0/24
```

---

### 🔹 Disable name resolution (faster)

```bash
sudo netdiscover -n
```

---

### 🔹 Increase scan intensity

```bash
sudo netdiscover -f
```

---

### 🔹 Time-limited scan

```bash
sudo netdiscover -r 192.168.1.0/24 -c 10
```

(Stops after packet count threshold)

---

## 7) Real-World Workflows

### 🔹 Quick LAN discovery

```bash
sudo netdiscover -r 192.168.1.0/24
```

---

### 🔹 Stealth monitoring (who appears on network)

```bash
sudo netdiscover -p
```

---

### 🔹 Identify unknown devices

Look for:

* new MAC addresses
* unusual vendors
* spikes in packet count

---

## 8) Netdiscover vs arp-scan (when to use which)

| Feature        | netdiscover | arp-scan |
| -------------- | ----------- | -------- |
| Real-time UI   | ✅           | ❌        |
| Passive mode   | ✅           | ❌        |
| Speed (active) | ⚡           | ⚡⚡       |
| Scriptability  | ❌           | ✅        |

**Rule of thumb:**

* Use `arp-scan` → fast enumeration / scripting
* Use `netdiscover` → live monitoring / recon

---

## 9) Limitations

* Only works on **local network (Layer 2)**
* Needs `sudo` (raw sockets)
* Passive mode depends on existing traffic
* IPv4 only (ARP-based)

---

## 10) Practical Combo (recommended)

1. Discover hosts:

   ```bash
   sudo netdiscover -r 192.168.1.0/24
   ```

2. Investigate targets with:

   ```bash
   nmap -sV <ip>
   ```

3. Optionally correlate MAC vendor info to identify device type

---

## 11) Subtle but Useful Insight

Because `netdiscover` tracks **ARP traffic frequency**, the “Count” column can hint at:

* active devices (high count)
* dormant devices (low count)
* network chatter patterns (gateways usually dominate)

That’s something `arp-scan` doesn’t expose as naturally.

---

If you want, I can map out a full **LAN reconnaissance workflow** combining:

* `netdiscover`
* `arp-scan`
* `nmap`
* and passive sniffing tools for deeper visibility
