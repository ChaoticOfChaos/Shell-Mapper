#!/bin/bash
clear
echo "__________Shell_Mapper__________"

read -p "IP Base > " ip_base
read -p "Sider > " sider

#

if [ "$sider" -eq 32 ]; then
    ping -c 1 $ip_base

elif [ "$sider" -eq 24 ]; then
    for i in $(seq 1 254); do
        ip="$ip_base.$i"
        ping -c 1 $ip > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "$ip is UP"
        fi
    done
else
    echo "Error Sider Not Supported :("

fi