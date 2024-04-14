#!/bin/bash

. ./color.sh

echo -e "${color_background_key}${color_font_key}HOSTNAME${color_end} = ${color_background_value}${color_font_value}$(hostname)${color_end}"
echo -e "${color_background_key}${color_font_key}TIMEZONE${color_end} =" ${color_background_value}${color_font_value}$(cat /etc/timezone) $(date +"UTC %-:::z")${color_end}
echo -e "${color_background_key}${color_font_key}USER${color_end} =" ${color_background_value}${color_font_value}$USER${color_end}
echo -e "${color_background_key}${color_font_key}DATE${color_end} =" ${color_background_value}${color_font_value}$(date +"%d %b %Y %T")${color_end}
echo -e "${color_background_key}${color_font_key}UPTIME${color_end} =" ${color_background_value}${color_font_value}$(uptime -p)${color_end}
echo -e "${color_background_key}${color_font_key}UPTIME_SEC${color_end} =" ${color_background_value}${color_font_value}$(cat /proc/uptime | awk '{print $1}')${color_end}
echo -e "${color_background_key}${color_font_key}IP${color_end} =" ${color_background_value}${color_font_value}$(hostname -I | awk '{print $1}')${color_end}
echo -e "${color_background_key}${color_font_key}MASK${color_end} =" ${color_background_value}${color_font_value}$(netstat -r | tail -n 1 | awk '{ print $3 }')${color_end}
echo -e "${color_background_key}${color_font_key}GATEWAY${color_end} =" ${color_background_value}${color_font_value}$(ip route | grep default | awk '{printf $3}')${color_end}
echo -e "${color_background_key}${color_font_key}RAM_TOTAL${color_end} =" ${color_background_value}${color_font_value}$(free | grep Mem: | awk '{printf("%.3f GB", $2/1024/1024)}')${color_end}
echo -e "${color_background_key}${color_font_key}RAM_USED${color_end} =" ${color_background_value}${color_font_value}$(free | grep Mem: | awk '{printf("%.3f GB", $3/1024/1024)}')${color_end}
echo -e "${color_background_key}${color_font_key}RAM_FREE${color_end} =" ${color_background_value}${color_font_value}$(free | grep Mem: | awk '{printf("%.3f GB", $4/1024/1024)}')${color_end}
echo -e "${color_background_key}${color_font_key}SPACE_ROOT${color_end} =" ${color_background_value}${color_font_value}$(df | grep /$ | awk '{printf("%.2f MB", $2/1024)}')${color_end}
echo -e "${color_background_key}${color_font_key}SPACE_ROOT_USED${color_end} =" ${color_background_value}${color_font_value}$(df | grep /$ | awk '{printf("%.2f MB", $3/1024)}')${color_end}
echo -e "${color_background_key}${color_font_key}SPACE_ROOT_FREE${color_end} =" ${color_background_value}${color_font_value}$(df | grep /$ | awk '{printf("%.2f MB", $4/1024)}')${color_end}

./print_conf.sh