# While Loops examples

```bash
#!/bin/bash
i=0

while [[ $i -lt 10 ]]
do
    echo "i: $i"
    ((i++)) #let i=i+1
done
```
---

```bash
#!/bin/bash
while true
do
    echo "Infinite loop, press CTRL + C to exit."
    sleep 1
done
```

```bash
#!/bin/bash
while true
do
    output="$(pgrep -l $1)"
    if [[ -n "$output" ]]
    then
        echo "The process \"$1\" is running."
    else
        echo "The process \"$1\" is running."
    fi
    sleep 3
done
```
