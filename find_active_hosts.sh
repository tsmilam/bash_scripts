#!/bin/bash
# simple way to check /etc/hosts for down host entries
for ip in $(grep ^10.* /etc/hosts | awk '{ print $1 }'); do
        ping -c1 $ip &>/dev/null
        if [ $? -eq 0 ]
                then echo $ip is down
        else
                echo $ip is up
        fi
done
