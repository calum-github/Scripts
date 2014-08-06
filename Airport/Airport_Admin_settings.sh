#!/bin/bash

## Script to enable or disable Airport Preferences
## Calum Hunter
## Xcite Logic
## 31/11/201

## $4, $5 and $6 are variables passed from casper. These variables should be either YES or NO


## Variables from Casper Suite

if [ "$4" != "" ] && [ "$IBSS" == "" ]; then
    IBSS=$4
fi

if [ "$5" != "" ] && [ "$netchange" == "" ]; then
    netchange=$5
fi

if [ "$6" != "" ] && [ "$power" == "" ]; then
    power=$5
fi


## Require Admin to create computer to computer networks
sudo /usr/libexec/airportd en1 prefs RequireAdminIBSS=$IBSS

## Require Admin to Change Networks
sudo /usr/libexec/airportd en1 prefs RequireAdminNetworkChange=$netchange

## Require Admin to Turn off Airport
sudo /usr/libexec/airportd en1 prefs RequireAdminPowerToggle=$6

