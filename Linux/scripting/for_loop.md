# For Loops examples
```bash
#!/bin/bash
for os in Ubuntu CentOS Slackware Kali "MX Linux"
do
	echo "OS is $os"
done

for num in {10..100..5}
do
	echo "num is $num"
done
```
---
```bash
#!/bin/bash

for item in ./*
do
	if [[ -f "$item" ]]
	then
		echo "Displaying the contents of $item ..."
		sleep 1
		cat $item
		echo "###################"
		fi
done
```
---

```bash
#!/bin/bash

for file in *.txt
do
	mv "$file" "renamed_by_script_$file"
done

```

```bash
#!/bin/bash

for ((i=0; i<=50;i++))
do
    echo "i = $i"
done

