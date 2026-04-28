# Bash Conditional Statements

## Basic Syntax

```bash
if [ some_condition_is_true ]
then
  # execute this code
elif [ some_other_condition_is_true ]
then
  # execute this code
else
  # execute this code
fi
```

---

## Examples

### Example 1: Simple `if`

```bash
i=1
if [[ $i -lt 10 ]]
then
   echo "i is less than 10."
fi
```

---

### Example 2: `if-else`

```bash
i=100
if [[ $i -lt 10 ]]
then
   echo "i is less than 10."
else
   echo "i is greater than or equal to 10."
fi
```

---

### Example 3: `if-elif-else`

```bash
i=10
if [[ $i -lt 10 ]]
then
   echo "i is less than 10."
elif [[ $i -eq 10 ]]
then
   echo "i is 10"
else
   echo "i is greater than or equal to 10."
fi
```

---

## Testing Conditions (`man test`)

### Numeric Comparisons (Integers)

| Operator | Meaning                  |
| -------- | ------------------------ |
| `-eq`    | Equal to                 |
| `-ne`    | Not equal to             |
| `-lt`    | Less than                |
| `-le`    | Less than or equal to    |
| `-gt`    | Greater than             |
| `-ge`    | Greater than or equal to |

---

### File Conditions

| Operator | Meaning                            |
| -------- | ---------------------------------- |
| `-s`     | File exists and is not empty       |
| `-f`     | File exists and is not a directory |
| `-d`     | Directory exists                   |
| `-x`     | File is executable                 |
| `-w`     | File is writable                   |
| `-r`     | File is readable                   |

---

### String Conditions

| Operator    | Meaning                     |
| ----------- | --------------------------- |
| `=`         | Equality (use with `[ ]`)   |
| `==`        | Equality (use with `[[ ]]`) |
| `!=`        | Inequality                  |
| `-n "$str"` | String is non-empty         |
| `-z "$str"` | String is empty             |

---

### Logical Operators

| Operator | Meaning     |     |            |
| -------- | ----------- | --- | ---------- |
| `&&`     | Logical AND |     |            |
| `        |             | `   | Logical OR |

---

```bash
#!/bin/bash
output=$(ping -c 3 $1)
#echo "$output"

if [[ "$output" == *"100% packet loss"* ]]
then
	echo "The network connection to $1 is not working."
else
	echo "The network connection to $1 is working"
fi

```

```bash
#!/bin/bash
if [[ -f "$1" ]]
then
        echo "The argument is a file, displaying its contents..."
        sleep 1
        cat $1
elif [[ -d "$1" ]]
then
        echo "The argument is a directory, running dir list..."
        sleep 1
        eza -lh $1
else
        echo "The argument ($1) is neither a file nor directory."
fi
```
