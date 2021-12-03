#!/bin/bash

echo "Starting SNMP Trap service"

if [[ -z ${DEBUG+x} ]]; then
    echo "Files in snmp folder"
    ls -R /snmp
fi

/usr/sbin/snmptrapd -Dusm -n -d -f -Lo -c /snmp/snmptrapd.conf
