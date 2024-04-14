#!/bin/bash

chmod +x check.sh

if ./check.sh $@; then
    echo $1
fi

