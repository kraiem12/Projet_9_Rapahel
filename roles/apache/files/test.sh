#!/bin/bash

TC=/usr/share/tomcat/webapps
AP=/var/www/html

args=("$@")

# ${ args[0] }, $# 

declare -a MODE=("status", "start", "stop", "restart")
declare -a SC=("httpd", "mysql", "tomcat")

m1=
m2= 

for i in "${MODE[@]}"
do
#	echo $i
	if [ "$1" == "${i%,}" ]; then
		m1=$1
	fi
done


for i in "${SC[@]}"
do
#	echo $i
	if [ "$2" == "${i%,}" ]; then
		m2=$2
	fi
done

echo $m1  $m2

if [ "$m1" == "" ] ; then
	exit 1
fi

function proc(){
	sudo service $2 $1
}

if [ "$m2" == "-a" ]; then
	echo "all"
else
	proc $m1 $m2
fi 

echo "Complete"
