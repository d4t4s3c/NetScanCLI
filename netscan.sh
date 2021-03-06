#!/bin/bash

#Author:  d4t4s3c
#Twitter: @d4t4s3c
#Email:   d4t4s3c@protonmail.com
#GitHub:  www.github.com/d4t4s3c

#colors
declare -r White="\e[97m"
declare -r GrayLight="\e[37m"
declare -r GrayDark="\e[90m"
declare -r Red="\e[31m"
declare -r RedLight="\e[91m"
declare -r Green="\e[32m"
declare -r GreenLight="\e[92m"
declare -r Yellow="\e[33m"
declare -r YellowLight="\e[93m"
declare -r Blue="\e[34m"
declare -r BlueLight="\e[94m"
declare -r Magenta="\e[35m"
declare -r MagentaLight="\e[95m"
declare -r Cyan="\e[36m"
declare -r CyanLight="\e[96m"
declare -r End="\e[0m"

#var
declare -r cu1='[+]'
declare -r cu2='[*]'
declare -r cu3='[i]'
declare -r cu4='[x]'
declare -r v1='TTL:'
declare -r v2='OS:'
declare -r v3='Ports:'
declare -r v4='Nmap:'
declare -r v5='Linux'
declare -r v6='Windows'
declare -r v7='Solaris'
declare -r v8="Error TTL not detected, host dropped or filtered by Firewall/IDS"
declare -r v9='Usage: netscan <HOST>'

function banner(){
echo ""
echo -e "$White===============================================================$End"
echo -e "$GreenLight┌┐┌┌─┐┌┬┐┌─┐┌─┐┌─┐┌┐┌$End"
echo -e "$GreenLight│││├┤  │ └─┐│  ├─┤│││$End"
echo -e "$GreenLight┘└┘└─┘ ┴ └─┘└─┘┴ ┴┘└┘$End"
echo -e "$White===============================================================$End"
}

banner

f1=$(ping -c 1 $1 | grep "ttl" | awk {'print $6'} | tr -d 'ttl=') > /dev/null 2>&1

    if [ "$(echo $f1)" == "64" ]; then
	    echo -e "$White[$GreenLight+$White] $White$v1       $GreenLight$f1$End"
	    echo -e "$White[$GreenLight+$White] $White$v2        $GreenLight$v5$End"
    elif [ "$(echo $f1)" == "63" ]; then
	    echo -e "$White[$GreenLight+$White] $White$v1       $GreenLight$f1$End"
	    echo -e "$White[$GreenLight+$White] $White$v2        $GreenLight$v5$End"
    elif [ "$(echo $f1)" == "128" ]; then
	    echo -e "$White[$GreenLight+$White] $White$v1       $GreenLight$f1$End"
	    echo -e "$White[$GreenLight+$White] $White$v2        $GreenLight$v6$End"
    elif [ "$(echo $f1)" == "127" ]; then
	    echo -e "$White[$GreenLight+$White] $White$v1       $GreenLight$f1$End"
	    echo -e "$White[$GreenLight+$White] $White$v2        $GreenLight$v6$End"
    elif [ "$(echo $f1)" == "255" ]; then
	    echo -e "$White[$GreenLight+$White] $White$v1       $GreenLight$f1$End"
	    echo -e "$White[$GreenLight+$White] $White$v2        $GreenLight$v7$End"
    elif [ "$(echo $f1)" == "254" ]; then
	    echo -e "$White[$GreenLight+$White] $White$v1       $GreenLight$f1$End"
	    echo -e "$White[$GreenLight+$White] $White$v2        $GreenLight$v7$End"
    else
            echo ""
	    echo -e "$RedLight$cu4 $v8$End"
            echo ""
            echo -e "$YellowLight$cu3 $v9$End"
            echo ""
	    exit 1
    fi

f2=$(nmap -n -sS -p- --min-rate 5000 $1 | grep "open" | awk '{print $1}' | tr -d '/tcp' | xargs | tr " " ",")
echo -e "$White[$GreenLight+$White] $White$v3     $GreenLight$f2$End"
f3=$(nmap -n -sC -sV -p$f2 $1 | grep -v -E "Starting|report|up|done")
echo -e "$White[$GreenLight+$White] $White$v4$End"
echo -e "$GreenLight $f3 $End"
echo ""
echo -e "$White===============================================================$End"
exit 0
