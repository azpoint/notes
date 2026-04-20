Here it is reorganized into clean Markdown:

---

# 📁 Working with Files and Directories

(`touch`, `mkdir`, `cp`, `mv`, `rm`, `shred`)

---

## 📄 File & Directory Creation

### Create or update a file timestamp

```bash id="t7k2zm"
touch filename
```

---

### Create directories

```bash id="p3v8qn"
mkdir dir1
```

### Create nested directories (with parents)

```bash id="y6m4lc"
mkdir -p mydir1/mydir2/mydir3
```

---

## 📋 Copying Files (`cp`)

### Basic copy

```bash id="g8p2sr"
cp file1 file2
```

### Copy into directory with new name

```bash id="z1k7qp"
cp file1 dir1/file2
```

---

### Safe / controlled copy options

```bash id="n5v3zd"
cp -i file1 file2     # Prompt before overwrite
cp -p file1 file2     # Preserve permissions, ownership, timestamps
cp -v file1 file2     # Verbose output
```

---

### Recursive copying (directories)

```bash id="m2x9qn"
cp -r dir1 dir2/
```

### Copy multiple sources into a directory

```bash id="k7t4lc"
cp -r file1 file2 dir1 dir2 destination_directory/
```

---

## 🔄 Moving & Renaming (`mv`)

### Rename file

```bash id="v6p3sr"
mv file1 file2
```

### Move file into directory

```bash id="y9k2qp"
mv file1 dir1/
```

---

### Safe move options

```bash id="g3n8zd"
mv -i file1 dir1/   # Prompt before overwrite
mv -n file1 dir1/   # Never overwrite existing file
mv -u file1 dir1/   # Move only if source is newer or missing destination
```

---

### Move and rename simultaneously

```bash id="p8x4lc"
mv file1 dir1/file2
```

---

### Move multiple items

```bash id="t2v7qn"
mv file1 file2 dir1/ dir2/ destination_directory/
```

---

## 🗑️ Removing Files (`rm`)

### Basic removal

```bash id="m6k3sr"
rm file1
```

### Verbose removal

```bash id="z4p8qp"
rm -v file1
```

---

### Remove directories

```bash id="n9x2zd"
rm -r dir1/
```

### Force removal (dangerous)

```bash id="k3v7lc"
rm -rf dir1/
```

---

### Interactive removal

```bash id="p5t2qn"
rm -ri file1 dir1/
```

---

## 🔐 Secure Deletion (`shred`)

### Overwrite file securely

```bash id="y8k4sr"
shred -vu -n 100 file1
```

* `-v` → verbose
* `-u` → remove after shredding
* `-n 100` → overwrite 100 times

---

