#!/bin/bash

# 1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black
. config.conf

select_color () {
    case $1 in 
        1) echo white;;
        2) echo red;;
        3) echo green;;
        4) echo blue;;
        5) echo purple;;
        6) echo black;;
    esac
}

 if [[ ${column1_font_color} =~ ^[1-6] ]]; then
    echo "Column 1 font color = ${column1_font_color} ($(select_color ${column1_font_color}))"
 else
    echo "Column 1 font color = default (black)"
 fi

 if [[ ${column1_background} =~ ^[1-6] ]]; then
    echo "Column 1 background = ${column1_background} ($(select_color ${column1_background}))"
 else
    echo "Column 1 background = default (white)"
 fi

 if [[ ${column2_font_color} =~ ^[1-6] ]]; then
    echo "Column 2 font color = ${column2_font_color} ($(select_color ${column2_font_color}))"
 else
    echo "Column 2 font color = default (black)"
 fi

 if [[ ${column2_background} =~ ^[1-6] ]]; then
    echo "Column 2 background = ${column2_background} ($(select_color ${column2_background}))"
 else
    echo "Column 2 background = default (white)"
 fi


