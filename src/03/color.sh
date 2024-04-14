#!/bin/bash

fwhite="\033[97m"
fred="\033[91m"
fgreen="\033[92m"
fblue="\033[94m"
fpurple="\033[95m"
fblack="\033[30m"

bwhite="\033[107m"
bred="\033[101m"
bgreen="\033[102m"
bblue="\033[104m"
bpurple="\033[105m"
bblack="\033[40m"

color_end="\033[0m"

case $1 in 
1) color_background_key=${fwhite};;
2) color_background_key=${fred};;
3) color_background_key=${fgreen};;
4) color_background_key=${fblue};;
5) color_background_key=${fpurple};;
6) color_background_key=${fblack};;
esac

case $2 in 
1) color_font_key=${bwhite};;
2) color_font_key=${bred};;
3) color_font_key=${bgreen};;
4) color_font_key=${bblue};;
5) color_font_key=${bpurple};;
6) color_font_key=${bblack};;
esac

case $3 in 
1) color_background_value=${fwhite};;
2) color_background_value=${fred};;
3) color_background_value=${fgreen};;
4) color_background_value=${fblue};;
5) color_background_value=${fpurple};;
6) color_background_value=${fblack};;
esac

case $4 in 
1) color_font_value=${bwhite};;
2) color_font_value=${bred};;
3) color_font_value=${bgreen};;
4) color_font_value=${bblue};;
5) color_font_value=${bpurple};;
6) color_font_value=${bblack};;
esac

#echo -e "${color_background_key}${color_font_key}HOSTNAME${color_end} = ${color_background_value}${color_font_value}$(hostname)${color_end}"