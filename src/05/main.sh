#!/bin/bash

START=$(date +%s.%N)
echo "cd $(dirname $0)"
chmod +x func.sh
chmod +x check.sh

if ./check.sh $@; then
  ./func.sh $1
  END=$(date +%s.%N)
  RESULT=$(echo "$END - $START" | bc)
  #Время выполнения скрипта
  echo "Script execution time (in seconds) = $RESULT"
fi




