#!/usr/bin/env bash

echo "== CPU =="
uptime | sed 's/.*load average://'

echo "== MEM =="
free -h | awk '/Mem:/{print $3" / "$2}'

echo "== DISK =="
df -h / | awk 'NR==2{
u=$5
gsub("%","",u)
print $5" used"
if (u+0>80)
print "WARN: disk >80%"
}'
