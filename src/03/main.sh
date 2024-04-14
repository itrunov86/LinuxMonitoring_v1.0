#!/bin/bash

chmod +x check.sh
chmod +x color.sh
chmod +x info.sh

if ./check.sh $@; then
    ./info.sh $@
fi