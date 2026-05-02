Here it is reorganized into a clean, structured Markdown reference:

---

# 👤 Account Management

## 📂 Important System Files

```bash
/etc/passwd   # User accounts:
              # username:x:uid:gid:comment:home_directory:login_shell

/etc/shadow   # Encrypted passwords

/etc/group    # Group definitions
```

---

## ➕ Creating Users

```bash
useradd [OPTIONS] username
```

### Common Options

```bash
-m              # Create home directory
-d directory    # Custom home directory
-c "comment"    # Description (e.g., role)
-s shell        # Login shell
-G groups       # Secondary groups (must exist)
-g group        # Primary group (must exist)
```

### Example

```bash
useradd -m -d /home/john -c "C++ Developer" -s /bin/bash -G sudo,adm,mail john
```

---

## 🔧 Modifying Users

```bash
usermod [OPTIONS] username
```

### Example

```bash
# Add user to additional groups
usermod -aG developers,managers john
```

---

## ❌ Deleting Users

```bash
userdel -r username   # -r removes home directory
```

---

## 👥 Group Management

### Create a group

```bash
groupadd group_name
```

### Delete a group

```bash
groupdel group_name
```

### List all groups

```bash
cat /etc/group
```

### Show groups of a user

```bash
groups
```

---

## 🛡️ Administrative Privileges

```bash
# Add user to admin group
# Ubuntu: sudo group
# CentOS: wheel group

usermod -aG sudo john
```

---

## 📊 Monitoring Users

### Logged-in users

```bash
who -H
```

### Current user info

```bash
id        # UID, GID, groups
whoami    # Effective user ID (EUID)
```

### Active sessions and load

```bash
w         # Who is logged in + current processes
uptime    # System load and uptime
```

### Login history

```bash
last
last -u username
```
