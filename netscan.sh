#!/bin/bash

#colors
b="\033[1;37m"
r="\033[1;31m"
v="\033[1;32m"
a="\033[1;33m"
az="\033[1;34m"
cy="\033[0;96m"
nc="\e[0m"

#var
cu1='[+]'
cu2='[*]'
cu3='[i]'
cu4='[x]'
v1='TTL:'
v2='SO:'
v3='Ports:'
v4='Nmap:'
v5='Linux'
v6='Windows'
v7='Solaris'
v8="Error TTL not detected, host dropped or filtered by Firewall/IDS"
v9='Usage: netscan <HOST>'
f1=$(ping -c 1 $1 | grep "ttl" | awk {'print $6'} | tr -d 'ttl=') > /dev/null 2>&1

    if [ "$(echo $f1)" == "64" ]; then
    	    echo ""
	    echo -e "$a$cu3 $b$v1$v   $cy$f1"
	    echo -e "$r$cu4 $b$v2$v    $cy$v5"
    elif [ "$(echo $f1)" == "63" ]; then
            echo ""
	    echo -e "$a$cu3 $b$v1$v   $cy$f1"
	    echo -e "$r$cu4 $b$v2$v    $cy$v5"
    elif [ "$(echo $f1)" == "128" ]; then
            echo ""
	    echo -e "$a$cu3 $b$v1$v   $cy$f1"
	    echo -e "$r$cu4 $b$v2$v    $cy$v6"
    elif [ "$(echo $f1)" == "127" ]; then
            echo ""
	    echo -e "$a$cu3 $b$v1$v   $cy$f1"
	    echo -e "$r$cu4 $b$v2$v    $cy$v6"
    elif [ "$(echo $f1)" == "255" ]; then
            echo ""
	    echo -e "$a$cu3 $b$v1$v   $cy$f1"
	    echo -e "$r$cu4 $b$v2$v    $cy$v7"
    elif [ "$(echo $f1)" == "254" ]; then
            echo ""
	    echo -e "$a$cu3 $b$v1$v   $cy$f1"
	    echo -e "$r$cu4 $b$v2$v    $cy$v7"
    else
            echo ""
	    echo -e "$r$cu4 $v8$nc"
            echo ""
            echo -e "$a$cu3 $v9"
	    exit 1
    fi

f2=$(nmap -n -sS -p- --min-rate 5000 $1 | grep "open" | awk '{print $1}' | tr -d '/tcp' | xargs | tr " " ",")
echo -e "$az$cu2 $b$v3 $cy$f2"
f3=$(nmap -n -sC -sV -p$f2 $1 | grep -v -E "Starting|report|up|done")
echo -e "$v$cu1 $b$v4"
echo -e "$cy $f3"
