Here it is reorganized into a clean, structured Markdown reference:

---

# 👤 Account Management

## 📂 Important System Files

```bash id="p4x9zd"
/etc/passwd   # User accounts:
              # username:x:uid:gid:comment:home_directory:login_shell

/etc/shadow   # Encrypted passwords

/etc/group    # Group definitions
```

---

## ➕ Creating Users

```bash id="v8q2lm"
useradd [OPTIONS] username
```

### Common Options

```bash id="k1r7sn"
-m              # Create home directory
-d directory    # Custom home directory
-c "comment"    # Description (e.g., role)
-s shell        # Login shell
-G groups       # Secondary groups (must exist)
-g group        # Primary group (must exist)
```

### Example

```bash id="x3t9af"
useradd -m -d /home/john -c "C++ Developer" -s /bin/bash -G sudo,adm,mail john
```

---

## 🔧 Modifying Users

```bash id="n6w2pb"
usermod [OPTIONS] username
```

### Example

```bash id="z7k4qc"
# Add user to additional groups
usermod -aG developers,managers john
```

---

## ❌ Deleting Users

```bash id="f2m8dx"
userdel -r username   # -r removes home directory
```

---

## 👥 Group Management

### Create a group

```bash id="c9y5tr"
groupadd group_name
```

### Delete a group

```bash id="u3h7vk"
groupdel group_name
```

### List all groups

```bash id="e5p1jn"
cat /etc/group
```

### Show groups of a user

```bash id="r8d2sx"
groups
```

---

## 🛡️ Administrative Privileges

```bash id="b4k6lw"
# Add user to admin group
# Ubuntu: sudo group
# CentOS: wheel group

usermod -aG sudo john
```

---

## 📊 Monitoring Users

### Logged-in users

```bash id="m7q3cz"
who -H
```

### Current user info

```bash id="t1v8hp"
id        # UID, GID, groups
whoami    # Effective user ID (EUID)
```

### Active sessions and load

```bash id="g9n2xr"
w         # Who is logged in + current processes
uptime    # System load and uptime
```

### Login history

```bash id="s6k4yb"
last
last -u username
```
