````markdown
## OpenSSH

### 1. Installing OpenSSH (client and server)

#### Ubuntu
```bash
sudo apt update && sudo apt install openssh-server openssh-client
````

#### CentOS

```bash
sudo dnf install openssh-server openssh-clients
```

#### Connecting to the server

```bash
ssh -p 22 username@server_ip        # Example: ssh -p 2267 john@192.168.0.100
ssh -p 22 -l username server_ip
ssh -v -p 22 username@server_ip     # verbose
```

---

### 2. Controlling the SSH daemon (sshd)

#### Check status

```bash
sudo systemctl status ssh    # Ubuntu
sudo systemctl status sshd   # CentOS
```

#### Stop the daemon

```bash
sudo systemctl stop ssh    # Ubuntu
sudo systemctl stop sshd   # CentOS
```

#### Restart the daemon

```bash
sudo systemctl restart ssh    # Ubuntu
sudo systemctl restart sshd   # CentOS
```

#### Enable at boot

```bash
sudo systemctl enable ssh    # Ubuntu
sudo systemctl enable sshd   # CentOS

sudo systemctl is-enabled ssh    # Ubuntu
sudo systemctl is-enabled sshd   # CentOS
```

---

### 3. Securing the SSH daemon

Edit the configuration file `/etc/ssh/sshd_config`, then restart the service:

```bash
man sshd_config
```

#### a) Change the port

```text
Port 2278
```

#### b) Disable direct root login

```text
PermitRootLogin no
```

#### c) Limit users’ SSH access

```text
AllowUsers stud u1 u2 john
```

#### d) Filter SSH access at the firewall level (iptables)

#### e) Enable public key authentication and disable password authentication

#### f) Use only SSH protocol version 2

#### g) Other configurations

```text
ClientAliveInterval 300
ClientAliveCountMax 0
MaxAuthTries 2
MaxStartUps 3
LoginGraceTime 20
```

```
```
