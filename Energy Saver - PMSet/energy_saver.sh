#!/bin/bash

## set energy saver preferences

pmset -b displaysleep 2 disksleep 1 sleep 10 womp 1

pmset -c displaysleep 10 disksleep 1 sleep 10 womp 1

echo "Setting Automatic shutdown to 6PM every day"
pmset repeat shutdown MTWRFSU 18:10:00
