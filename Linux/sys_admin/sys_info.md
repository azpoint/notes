Here’s your text cleanly formatted in Markdown with proper structure, headings, and code blocks:

````markdown
## Getting System Hardware Information

### Full Hardware Information
```bash
lshw
lshw -short     # short format
lshw -json      # json format
lshw -html      # html format

inxi -Fx
````

### CPU Information

```bash
lscpu
lshw -C cpu
lscpu -J        # json format
```

### RAM Information

```bash
dmidecode -t memory
dmidecode -t memory | grep -i size
dmidecode -t memory | grep -i max
```

### Memory Usage

```bash
free -m
```

### PCI Devices

```bash
lspci
lspci | grep -i wireless
lspci | grep -i vga
```

### USB Devices

```bash
lsusb
lsusb -v
```

### Disk Information

```bash
lshw -short -C disk
fdisk -l
fdisk -l /dev/sda
lsblk
hdparm -i /dev/sda
hdparm -I /dev/sda
```

### Disk Benchmarking

```bash
hdparm -tT --direct /dev/sda
```

### WiFi Information

```bash
lshw -C network
iw list
iwconfig
iwlist wlo1 scan
```

### /proc Filesystem Hardware Info

```bash
cat /proc/cpuinfo
cat /proc/partitions
cat /proc/meminfo
cat /proc/version
uname -r        # kernel version
uname -a
```

### Battery Information

```bash
acpi -bi
acpi -V
```

---

## Working with Device Files (`dd`)

### Backup MBR

```bash
dd if=/dev/sda of=~/mbr.dat bs=512 count=1
```

### Restore MBR

```bash
dd if=~/mbr.dat of=/dev/sda bs=512 count=1
```

### Clone a Partition

```bash
dd if=/dev/sda1 of=/dev/sdb2 bs=4M status=progress
```


