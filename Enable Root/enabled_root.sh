#!/bin/bash

# Script to Enable the root user
# Requires a local admin account

root_pass="YourPassword"

/usr/sbin/dsenableroot -u local_admin -p local_admin_pw -r $root_pass

exit 0