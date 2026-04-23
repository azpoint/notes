# 📜 Bash History Management

---

## 📖 Viewing History

```bash id="h2k9zm"
history
```

---

## 🗑️ Removing History Entries

### Delete a specific entry

```bash id="p7v3qn"
history -d 100
```

### Clear entire history

```bash id="y4k2lc"
history -c
```

---

## 📊 History Limits (Memory vs File)

```bash id="g9m3sr"
echo $HISTFILESIZE   # Max lines stored in ~/.bash_history
echo $HISTSIZE       # Max commands stored in memory session
```

---

## 🔁 Re-executing Commands

### Run last command

```bash id="n5k4zd"
!!
```

---

### Run specific history entry

```bash id="m7x2lc"
!20   # Run 20th command in history
```

---

### Run nth previous command

```bash id="k3v8qn"
!-10  # Run 10th previous command
```

---

### Run last command starting with prefix

```bash id="t6v2lc"
!abc
```

### Print (don’t execute) last matching command

```bash id="y8k4sr"
!abc:p
```

---

## 🔍 Reverse Search History

```bash id="g2p9qn"
CTRL + R
```

---

## 🕒 Add timestamps to history

### Enable timestamp format

```bash id="p5x7zd"
HISTTIMEFORMAT="%d/%m/%y %T"
```

---

### Make it persistent

```bash id="n8k3lc"
echo "HISTTIMEFORMAT=\"%d/%m/%y %T\"" >> ~/.bashrc
```

or

```bash id="y3v9sr"
echo 'HISTTIMEFORMAT="%d/%m/%y %T"' >> ~/.bashrc
```
