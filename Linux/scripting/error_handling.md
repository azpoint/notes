## 🔀 `case` Statements (Cleaner Than `if-elif` Chains)

When you’re matching against multiple discrete values, `case` is more readable and scales better.

```bash
choice="start"

case "$choice" in
  start)
    echo "Starting service..."
    ;;
  stop)
    echo "Stopping service..."
    ;;
  restart)
    echo "Restarting service..."
    ;;
  *)
    echo "Invalid option"
    ;;
esac
```

### Why this matters

* Avoids deeply nested `elif`
* Easier to maintain as options grow
* Supports pattern matching

---

### Pattern Matching with `case`

```bash
filename="report.pdf"

case "$filename" in
  *.txt)
    echo "Text file"
    ;;
  *.pdf)
    echo "PDF document"
    ;;
  *.jpg|*.png)
    echo "Image file"
    ;;
  *)
    echo "Unknown type"
    ;;
esac
```

👉 Notice `|` acts like OR inside patterns.

---

## ⚙️ Defensive Scripting (`set -euo pipefail`)

This is where scripts stop being “toy scripts” and start behaving like reliable tooling.

```bash
set -euo pipefail
```

### What each flag does

| Flag          | Effect                                                     |
| ------------- | ---------------------------------------------------------- |
| `-e`          | Exit immediately if any command fails                      |
| `-u`          | Treat unset variables as errors                            |
| `-o pipefail` | Fail pipeline if any command fails (not just the last one) |

---

### Example Without vs With `pipefail`

#### ❌ Problematic:

```bash
cat missing.txt | grep "hello"
echo "Still running..."
```

➡️ This may continue even if `cat` fails.

#### ✅ Correct:

```bash
set -euo pipefail

cat missing.txt | grep "hello"
echo "You will NOT see this if something fails"
```

---

## 🧩 Combining Everything (Real Script Pattern)

```bash
#!/usr/bin/env bash
set -euo pipefail

read -p "Enter command (start/stop): " cmd

case "$cmd" in
  start)
    if command -v docker &> /dev/null
    then
      echo "Starting container..."
    else
      echo "Docker not installed"
      exit 1
    fi
    ;;
  stop)
    echo "Stopping container..."
    ;;
  *)
    echo "Unknown command"
    exit 1
    ;;
esac
```

---

## 🧠 Subtle but Important Best Practices

* Always quote variables: `"$var"` → avoids word-splitting bugs
* Prefer `[[ ]]` over `[ ]` → safer and more powerful
* Use `exit 1` for failures → makes scripts composable
* Guard inputs (`-n`, `-z`) → prevents undefined behavior

