#!/bin/bash

# Flush iptables
iptables -t filter -F

# Dropping incoming traffic on port 22
iptables -A INPUT -p tcp --dport 22 -j DROP

# Dropping outgoing http and https traffic
iptables -A OUTPUT -p tcp --dport 80 -j DROP

# Dropping incoming http and https traffic
iptables -A INPUT -p tcp --dport 443 -j DROP
