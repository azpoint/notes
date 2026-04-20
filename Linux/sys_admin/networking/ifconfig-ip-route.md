Here’s your text reorganized into clean, structured Markdown:

---

# 🖧 Network Interface Commands

## 📡 Getting Information About Network Interfaces

### Show interface details

```bash
# Enabled interfaces
ifconfig

# All interfaces (enabled + disabled)
ifconfig -a
ip address show
```

### Show a specific interface

```bash
ifconfig enp0s3
ip addr show dev enp0s3
```
### NetworkManager

```bash
systemctl status NetworkManager 
systemctl stop/start NetworkManager #solves network
systemctl enable/disable NetworkManager #enable disable with system restart
```

### Filter by IP version

```bash
# IPv4 only
ip -4 address

# IPv6 only
ip -6 address
```

### Layer 2 (MAC address, link info)

```bash
ip link show
ip link show dev enp0s3
```

### Routing / Default gateway

```bash
route
route -n    # numerical output
ip route show
```

### DNS configuration

```bash
resolvectl status
```

---

## ⚙️ Configuring Network Interfaces

### Enable / Disable interfaces

```bash
# Disable
ifconfig enp0s3 down
ip link set enp0s3 down

# Enable
ifconfig enp0s3 up
ip link set enp0s3 up
```

### Check interface status

```bash
ifconfig -a
ip link show dev enp0s3
```

### Assign IP addresses

```bash
# Assign IP
ifconfig enp0s3 192.168.0.222/24 up

# Remove and add IP (ip command)
ip address del 192.168.0.111/24 dev enp0s3
ip address add 192.168.0.112/24 dev enp0s3
```

### Add secondary IP (alias)

```bash
ifconfig enp0s3:1 10.0.0.1/24
```

### Manage default gateway

```bash
# Using route
route del default gw 192.168.0.1
route add default gw 192.168.0.2

# Using ip
ip route del default
ip route add default via 192.168.0.1
```

### Change MAC address

```bash
# Using ifconfig
ifconfig enp0s3 down
ifconfig enp0s3 hw ether 08:00:27:51:05:a1
ifconfig enp0s3 up

# Using ip
ip link set dev enp0s3 address 08:00:27:51:05:a3
```
