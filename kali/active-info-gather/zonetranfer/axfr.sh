#/bin/bash
# Simple zone tranfer Bash Script
# $1 is the first argument given after the bash script
# check if argumetn was given, if not, print usage

if [ -z "$1" ]; then
	echo "[*] Simple Zone Tranfer script"
	echo "[*] Usage : $0 <domain name>"
	exit 0

fi

# if qrgument was given, identify the DNS servers for the domain.
# Fro each of these services, attemp a zone tranfer

for server in $(host -t ns $1 |cut -d" " -f4);do
	host -l $1 $server |grep "has address"
done

