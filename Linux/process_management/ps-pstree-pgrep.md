Here it is reorganized into clean, structured Markdown:

---

# 🧾 Process Viewing (`ps`, `pstree`, `pgrep`)

## 🔍 Command Type Inspection

```bash id="1t9kqf"
# Check if a command is a shell built-in or executable
type rm        # => /usr/bin/rm
type cd        # => shell built-in
```

---

## 📋 Listing Processes

### Processes in current terminal

```bash id="6b2nwd"
ps
```

### All system processes

```bash id="y4f3jc"
ps -ef
ps aux
ps aux | less       # Pipe output to pager
```

### Sort processes by memory usage

```bash id="k9v2pl"
ps aux --sort=%mem | less
```

---

## 🌲 Process Tree Visualization

### Tree view using `ps`

```bash id="3q8nsa"
ps -ef --forest
```

### Hierarchical tree with `pstree`

```bash id="w7d0xz"
pstree
```

### Prevent merging identical branches

```bash id="n2h6rb"
pstree -c
```

---

## 👤 Filtering by User

```bash id="v8s1ge"
ps -f -u username
```

---

## 🎯 Finding Processes by Name

```bash id="x5m2ok"
# Using pgrep
pgrep -l sshd

# Using ps + grep
ps -ef | grep sshd
```

