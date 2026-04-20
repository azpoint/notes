Here it is reorganized into a clean, structured Markdown reference:

---

# 🔐 File Permissions & Ownership

## 🧠 Permission Model (Legend)

```
u = User
g = Group
o = Others (World)
a = All

r = Read
w = Write
x = Execute
- = No permission
```

---

## 🔍 Viewing Permissions

```bash id="k3v1zx"
# Using ls
ls -l /etc/passwd
# Example:
# -rw-r--r-- 1 root root 2871 Aug 22 14:43 /etc/passwd
```

```bash id="m8p4ds"
# Using stat (detailed view)
stat /etc/shadow
```

---

## ✏️ Changing Permissions

### Symbolic (Relative) Mode

```bash id="u7x2qa"
chmod u+r filename
chmod u+r,g-wx,o-rwx filename
chmod ug+rwx,o-wx filename
chmod ugo+x filename
chmod a+r,a-wx filename
```

---

### Octal (Absolute) Mode

```
User Group Others
 r w x  r w x  r w x
```

```bash id="n5c8fj"
chmod 777 filename   # rwx rwx rwx
chmod 775 filename   # rwx rwx r-x
chmod 755 filename   # rwx r-x r-x
chmod 750 filename   # rwx r-x ---
chmod 664 filename   # rw- rw- r--
chmod 644 filename   # rw- r-- r--
chmod 640 filename   # rw- r-- ---
```

---

### Copy Permissions from Another File

```bash id="q2l9wv"
chmod --reference=file1 file2
```

---

### Recursive Changes

```bash id="z8r6kt"
chmod -R u+rw,o-rwx filename
```

---

## ⚙️ Special Permissions

### 🔴 SUID (Set User ID)

```bash id="x1b7qe"
# View
ls -l /usr/bin/umount
stat /usr/bin/umount

# Set SUID
chmod u+s executable_file
chmod 4755 executable_file   # Example: chmod 4755 script.sh
```

---

### 🔵 SGID (Set Group ID)

```bash id="c4n2ps"
# View
ls -ld projects/
stat projects/

# Set SGID
chmod 2750 projects/
chmod g+s projects/
```

---

### 🟢 Sticky Bit

```bash id="v9k3dj"
# View
ls -ld /tmp/
stat /tmp/

# Set sticky bit
mkdir temp
chmod 1777 temp/
chmod o+t temp/

# Verify
ls -ld temp/
```

---

## 🧮 UMASK

```bash id="y6t8mr"
# Display current umask
umask

# Set new umask
umask 0022
```

---

## 👤 File Ownership Management (root)

### Change owner

```bash id="h2p7lc"
chown new_owner file_or_directory
# Example:
sudo chown john a.txt
```

### Change group

```bash id="s8d4nx"
chgrp new_group file_or_directory
```

### Change owner and group

```bash id="b5w1rf"
chown new_owner:new_group file_or_directory
```

### Recursive ownership change

```bash id="t3q9az"
chown -R new_owner file_or_directory
```

---

## 🧷 File Attributes (`chattr` / `lsattr`)

```bash id="p7x6vn"
# View attributes
lsattr filename

# Modify attributes
chattr +attribute filename
chattr -attribute filename

# Example (immutable file)
sudo chattr +i report.txt
```