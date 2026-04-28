# 🐚 Bash Conditionals Cheat Sheet

## 🔹 Basic Syntax

```bash
if [ condition ]
then
  # code
elif [ condition ]
then
  # code
else
  # code
fi
```

---

## 🔢 Numeric Operators

| Operator | Meaning                  |
| -------- | ------------------------ |
| `-eq`    | Equal to                 |
| `-ne`    | Not equal to             |
| `-lt`    | Less than                |
| `-le`    | Less than or equal to    |
| `-gt`    | Greater than             |
| `-ge`    | Greater than or equal to |

---

## 📁 File Operators

| Operator | Meaning                      |
| -------- | ---------------------------- |
| `-f`     | File exists                  |
| `-d`     | Directory exists             |
| `-s`     | File exists and is not empty |
| `-r`     | File is readable             |
| `-w`     | File is writable             |
| `-x`     | File is executable           |

---

## 🔤 String Operators

| Operator    | Meaning              |
| ----------- | -------------------- |
| `=`         | Equal (with `[ ]`)   |
| `==`        | Equal (with `[[ ]]`) |
| `!=`        | Not equal            |
| `-n "$str"` | Not empty            |
| `-z "$str"` | Empty                |

---

## 🔗 Logical Operators

| Operator | Meaning     |   |            |
| -------- | ----------- | - | ---------- |
| `&&`     | Logical AND |   |            |
| `        |             | ` | Logical OR |

---

## 🧪 Example

```bash
i=10

if [[ $i -eq 10 ]]
then
  echo "i is 10"
fi
```

---

## ⚙️ Defensive Mode (Recommended)

```bash
set -euo pipefail
```

| Option     | Meaning                                 |
| ---------- | --------------------------------------- |
| `-e`       | Exit on error                           |
| `-u`       | Error on undefined variables            |
| `pipefail` | Fail if any command in a pipeline fails |

---

## 🔀 Case Statement

```bash
case "$var" in
  value1)
    # code
    ;;
  value2)
    # code
    ;;
  *)
    # default
    ;;
esac
```

---

## 🧠 Best Practices

* Always quote variables: `"$var"`
* Prefer `[[ ]]` over `[ ]`
* Use `set -euo pipefail` in scripts
* Validate inputs (`-n`, `-z`)
* Use `exit 1` on failure

