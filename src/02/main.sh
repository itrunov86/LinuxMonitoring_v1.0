#!/bin/bash


chmod +x info.sh
chmod +x write_to_file.sh

if [ $# -eq 0 ]; then
    ./info.sh
    read -p "Write this information to the file? (Y/N) " answer
    case $answer in
    y | Y) . ./write_to_file.sh
    echo "Done"
    ;;
    *) echo "The information wasn't saved."
    ;;
    esac

else 
    echo "The script runs without parameters."
    exit 1
fi