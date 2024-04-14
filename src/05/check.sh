#!/bin/bash

if [ $# != 1 ]; then
    echo "There are no parameters. Please enter one parameter"
    exit 1
else
  if ! [ -d $1 ]; then
    echo 'The entered parameter is not a directory, enter /<directory name>/'
    exit 1
  fi
fi