#!/bin/bash

cd $1

#Общее число папок, включая вложенные
echo "1. Total number of folders (including all nested ones) =" $(sudo ls -R -r -l 2>/dev/null | grep ^d | wc -l)
echo

#Топ 5 папок с самым большим весом
echo  "2. TOP 5 folders of maximum size arranged in descending order (path and size):"  
sudo du $1 -h 2>/dev/null | sort -hr | head -5 | awk '{print "-",$2",", $1"b"}' |nl
echo

#Общее число файлов
echo "3. Total number of files =" $(sudo find $1 -type f 2> /dev/null | wc -l)
echo

#Число файлов (с расширением .conf), текстовых файлов, исполняемых файлов, логов (файлов с расширением .log), архивов, символических ссылок
echo "4. Number of:"
echo " - Configuration files (with the .conf extension) =" $(sudo find $1 -name "*.conf" | wc -l)
echo " - Text files = " $(sudo find $1 -name "*.txt"  2> /dev/null | wc -l)
echo " - Executable files = " $(sudo find $1 -type f -executable  2> /dev/null | wc -l)
echo " - Log files (with the extension .log) = " $(sudo find $1 -name "*.log"  2> /dev/null | wc -l)
echo " - Archive files = " $(sudo find $1 -name '*.tar' -o -name '*.zip' -o -name '*.7z' -o -name '*.rar' -o -name '*.gz'  2> /dev/null | wc -l)
echo " - Symbolic links = " $(sudo find $1 -type l  2> /dev/null | wc -l)
echo

#Топ 10 файлов с самым большим весом
echo "5. TOP 10 files of maximum size arranged in descending order (path, size and type):"
array=($(find $1 -type f -exec du -h {} +  2> /dev/null | sort -hr | head -10 | awk '{print $2}'))
for abs_path in ${array[*]}
do
    COUNT=$(( $COUNT + 1 ))
    FILENAME="${abs_path##*/}"                      
    DIR="${abs_path:0:${#abs_path} - ${#FILENAME}}" 
    BASE="${FILENAME%.[^.]*}"                       
    EXT="${FILENAME:${#BASE} + 1}"                  
    if [[ -z "$BASE" && -n "$EXT" ]]; then         
        BASE=".$EXT"
        EXT=""
    fi
    echo "     $COUNT  - "$(find $abs_path -type f -exec du -h {} +  2> /dev/null | awk '{printf "%s, %s", $2, $1}')b, "$EXT"  
done
echo

#Топ 10 исполняемых файлов
echo "6. TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)" 
array=($(find $1 -type f -executable -exec du -h {} +  2> /dev/null | sort -hr | head -10 | awk '{print $2}'))
COUNT=0
for abs_path in ${array[*]}
do
    COUNT=$(( $COUNT + 1 ))
    echo "     $COUNT  - "$(find $abs_path -type f -exec du -h {} +  2> /dev/null | awk '{printf "%s, %s", $2, $1}')b, $(md5sum $abs_path | awk '{print $1}')
done
echo
