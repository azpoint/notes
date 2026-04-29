# Function Examples

```bash
#!/bin/bash


function print_something () {
	echo "Im a simple function."
}

display_something () {
	echo "Hello functions!"
}

create_files () {
	echo "Creating $1"
	touch $1
	chmod 400 $1
	echo "Creating $2"
	touch $2
	chmod 600 $2
}

print_something
display_something
create_files aa.txt bb.txt

```
---
```bash
#!/bin/bash
var1="AA"
var2="BB"

function func1 () {
	var1="XX"
	local var2="YY"
	echo "Inside func1: var1=$var1, var2=$var2"
}

func1
echo "Outside func1: var1=$var1, var2=$var2"

```

