Here it is reorganized into clean Markdown:

---

# 🔀 Piping and Command Redirection

---

## 🔗 Piping Examples

```bash id="p5k2zm"
ls -lSh /etc/ | head
# Show 10 largest files in /etc

ps -ef | grep sshd
# Check if sshd is running

ps aux --sort=-%mem | head -n 3
# Top 3 processes by memory usage
```

---

## 📤 Output Redirection

### Write output to a file

```bash id="m8v3qn"
ps aux > running_processes.txt
who -H > loggedin_users.txt
```

---

### Append output to a file

```bash id="y2t6lc"
id >> loggedin_users.txt
```

---

## ⚠️ Output + Error Redirection

### Separate output and errors

```bash id="g7p9sr"
tail -n 10 /var/log/*.log > output.txt 2> errors.txt
```

---

### Merge output and errors into one file

```bash id="z1x4qp"
tail -n 2 /etc/passwd /etc/shadow > output_errors.txt 2>&1
```

---

## 🧪 Pipeline + Filtering Examples

```bash id="n6k3zd"
cat -n /var/log/auth.log | grep -ai "authentication failure" | wc -l
# Count authentication failures

cat -n /var/log/auth.log | grep -ai "authentication failure" > auth.txt
# Save matching lines to file
```

