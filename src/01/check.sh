#!/bin/bash

if [ $# -eq 0 ]; then
    echo "There are no parameters. Please enter one parameter"
    exit 1
elif [ $# -gt 1 ]; then
    echo "The number of parameters is more than necessary. Please enter one parameter"
    exit 1
else 
    if [[ $1 =~ ^[0-9]+(\.[0-9]+)?$|^[\;\'\"\?\.,!@#\$%\^\&\+-=\{\}]]?$ ]]; then
        echo "Please enter a parameter of type \"string\""
        exit 1
    fi 
fi