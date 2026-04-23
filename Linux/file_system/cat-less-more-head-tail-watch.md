Here it is reorganized into clean Markdown:

---

# 📄 Viewing Files (`cat`, `less`, `more`, `head`, `tail`, `watch`)

---

## 📖 `cat` — Display File Contents

```bash id="c4p8zm"
cat filename
```

### Multiple files

```bash id="y7k2qn"
cat filename1 filename2
```

### Show line numbers

```bash id="g9v3lc"
cat -n filename
```

### Concatenate files into a new file

```bash id="m2t7sr"
cat filename1 filename2 > filename3
```

---

## 📜 `less` — Paginated Viewer

```bash id="z5k4qp"
less filename
```

### `less` shortcuts

```text id="n8v3zd"
h         # Help
q         # Quit
Enter     # Next line
Space     # Next page
/string   # Search forward
?string   # Search backward
n         # Next match
N         # Previous match
```

---

## 🔽 `tail` — View End of File

```bash id="p6k2lc"
tail filename
```

### Show last N lines

```bash id="t3v9qn"
tail -n 15 filename
```

### Start from a specific line

```bash id="k8m4sr"
tail -n +5 filename
```

### Live monitoring (follow file)

```bash id="y2p7zd"
tail -f filename
```

---

## 🔼 `head` — View Start of File

```bash id="g4x9lc"
head filename
```

### Show first N lines

```bash id="m7k2qn"
head -n 15 filename
```

---

## 🔁 `watch` — Repeating Commands

```bash id="z1v4sr"
watch -n 3 ls -l
```

* Runs command every **3 seconds**
* Useful for real-time monitoring


