## 🧠 Practical, Real-World Examples

Here are some more “in-the-wild” Bash patterns so this isn’t just theory:

---

### 1. Check if a file exists before using it

```bash
FILE="data.txt"

if [[ -f "$FILE" ]]
then
  echo "File exists. Processing..."
else
  echo "File not found!"
fi
```

👉 Common in scripts that depend on configs or input files.

---

### 2. Validate user input

```bash
read -p "Enter your age: " age

if [[ $age -lt 18 ]]
then
  echo "You are a minor."
elif [[ $age -eq 18 ]]
then
  echo "Just became an adult!"
else
  echo "You are an adult."
fi
```

👉 Useful for CLI tools or onboarding scripts.

---

### 3. Combine conditions (AND / OR)

```bash
read -p "Enter username: " user

if [[ -n "$user" && "$user" == "admin" ]]
then
  echo "Welcome, admin."
else
  echo "Access denied."
fi
```

👉 Note the `-n` guard—prevents empty string bugs.

---

### 4. Check directory and permissions

```bash
DIR="/tmp/myapp"

if [[ -d "$DIR" && -w "$DIR" ]]
then
  echo "Directory exists and is writable."
else
  echo "Directory missing or not writable."
fi
```

👉 Very common in deployment scripts.

---

### 5. Exit on failure (defensive scripting)

```bash
if ! command -v git &> /dev/null
then
  echo "git is not installed. Exiting."
  exit 1
fi
```

👉 This pattern avoids cascading failures.

---

### 6. Pattern-style string check

```bash
name="devops_engineer"

if [[ "$name" == devops* ]]
then
  echo "Matches devops role"
fi
```

👉 `[[ ]]` supports glob-style matching—`[ ]` does not.

---

### 7. Numeric range check

```bash
score=75

if [[ $score -ge 50 && $score -le 100 ]]
then
  echo "Pass"
else
  echo "Fail"
fi
```


