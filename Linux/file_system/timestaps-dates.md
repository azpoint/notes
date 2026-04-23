Here it is reorganized into clean Markdown:

---

# 🕒 File Timestamps and Date Utilities

---

## ⏱️ File Timestamp Types

```text id="t8k3zm"
atime → last access time
mtime → last modification time
ctime → last metadata change time
```

---

## 📂 Viewing Timestamps

### Access time (atime)

```bash id="p4v7qn"
ls -lu
```

---

### Modification time (mtime)

```bash id="y6k2lc"
ls -l
ls -lt   # sorted by mtime
```

---

### Change time (ctime)

```bash id="g9m3sr"
ls -lc
```

---

### All timestamps (detailed view)

```bash id="z2v8qp"
stat file.txt
```

---

### Full timestamp format

```bash id="n5k4zd"
ls -l --full-time /etc/
```

---

## ✍️ Modifying Timestamps (`touch`)

### Create file or update timestamps

```bash id="m7x2lc"
touch file.txt
```

---

### Update only access time

```bash id="k3v9sr"
touch -a file
```

---

### Update only modification time

```bash id="p8t4qn"
touch -m file
```

---

### Set specific modification time

```bash id="y2k7zd"
touch -m -t 201812301530.45 a.txt
```

---

### Set both atime and mtime

```bash id="g4v8lc"
touch -d "2010-10-31 15:45:30" a.txt
```

---

### Copy timestamps from another file

```bash id="n9k3sr"
touch a.txt -r b.txt
```

---

## 📅 System Date and Calendar

### Show current date/time

```bash id="t2x6qn"
date
```

---

### Show calendar

```bash id="m6k8zd"
cal
```

### Specific year

```bash id="y7v3lc"
cal 2021
```

### Specific month/year

```bash id="g2p9sr"
cal 7 2021
```

### Surrounding months

```bash id="k8m4qn"
cal -3
```

---

## 🛠️ Setting System Date (requires privileges)

```bash id="p3v7zd"
date --set="2 OCT 2020 18:00:00"
```

---

## 📊 Sorting Files by Time

### Default (mtime)

```bash id="y4k2lc"
ls -l
```

---

### Newest first

```bash id="g7v9sr"
ls -lt
```

---

### Sort by access time

```bash id="n2k8zd"
ls -ltu
```

---

### Reverse sorting

```bash id="p6v3qn"
ls -ltu --reverse
```
