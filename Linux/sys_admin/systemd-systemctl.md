## Service Management using systemd and systemctl

### Boot Process Analysis

```bash
systemd-analyze
systemd-analyze blame
```

### Listing Units

```bash
systemctl list-units
systemctl list-units | grep ssh
```

### Service Status

```bash
sudo systemctl status nginx.service
```

### Stopping a Service

```bash
sudo systemctl stop nginx
```

### Starting a Service

```bash
sudo systemctl start nginx
```

### Restarting a Service

```bash
sudo systemctl restart nginx
```

### Reloading Configuration

```bash
sudo systemctl reload nginx
sudo systemctl reload-or-restart nginx
```

### Enable at Boot

```bash
sudo systemctl enable nginx
```

### Disable at Boot

```bash
sudo systemctl disable nginx
```

### Check if Enabled at Boot

```bash
sudo systemctl is-enabled nginx
```

### Masking a Service

```bash
sudo systemctl mask nginx
```

### Unmasking a Service

```bash
sudo systemctl unmask nginx
```
