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

elif [ "$sider" -eq 22 ]; then
    for x in $(seq 0 3); do
        for y in $(seq 1 254); do
            ip="$ip_base.$x.$y"
            ping -c 1 $ip > /dev/null 2>&1
            if [ $? -eq 0 ]; then
                echo "$ip is UP"
            fi
        done
    done

elif [ "$sider" -eq 16 ]; then
    for x in $(seq 1, 254); do
        for y in $(seq 1, 254); do
            ip="$ip_base.$x.$y"
            ping -c 1 $ip > /dev/null 2>&1
            if [ $? -eq 0 ]; then
                echo "$ip is UP"
            fi
        done
    done

else
    echo "Error Sider Not Supported :("

fi