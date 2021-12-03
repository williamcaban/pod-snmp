#!/bin/sh
# /snmp/snmp-trap-handler.sh script based on
# http://www.net-snmp.org/tutorial/tutorial-5/commands/snmptrap.html

read host
read ip
vars=
count=1
 
while read oid val
do
count=$[count+1]
  if [ "$vars" = "" ]
  then
    vars="$oid = $val"
  else
    vars="$vars, $oid = $val"
  fi
done

# print to stdout with timestamp
echo $(date +"%F %T") $1 trap from host=$host at IP $ip vars=$vars
