#!/bin/bash

chmod +x check.sh
chmod +x color.sh
chmod +x info.sh
chmod +x config.conf
chmod +x print_conf.sh

if ./check.sh $@; then
    ./info.sh $@
fi