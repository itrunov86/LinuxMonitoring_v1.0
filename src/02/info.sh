#!/bin/bash

echo "HOSTNAME =" $(hostname)
echo "TIMEZONE =" $(cat /etc/timezone) $(date +"UTC %-:::z")
echo "USER =" $USER
echo "OS = " $(hostnamectl | grep System | awk '{print $3, $4, $5}')
echo "DATE =" $(date +"%d %b %Y %T")
echo "UPTIME =" $(uptime -p)
echo "UPTIME_SEC =" $(cat /proc/uptime | awk '{print $1}')
echo "IP =" $(hostname -I | awk '{print $1}')
echo "MASK =" $(netstat -r | tail -n 1 | awk '{ print $3 }')
echo "GATEWAY =" $(ip route | grep default | awk '{printf $3}')
echo "RAM_TOTAL =" $(free | grep Mem: | awk '{printf("%.3f GB", $2/1024/1024)}')
echo "RAM_USED =" $(free | grep Mem: | awk '{printf("%.3f GB", $3/1024/1024)}')
echo "RAM_FREE =" $(free | grep Mem: | awk '{printf("%.3f GB", $4/1024/1024)}')
echo "SPACE_ROOT =" $(df | grep /$ | awk '{printf("%.2f MB", $2/1024)}')
echo "SPACE_ROOT_USED =" $(df | grep /$ | awk '{printf("%.2f MB", $3/1024)}')
echo "SPACE_ROOT_FREE =" $(df | grep /$ | awk '{printf("%.2f MB", $4/1024)}')