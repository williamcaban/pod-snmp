#!/bin/bash

echo "Starting SNMP Trap service"

if [[ ! -z ${DEBUG+x} ]]; then

    echo "#### Running in DEBUG mode"
    echo "#### Using -d dump sent/received SNMP packets"
    /usr/sbin/snmptrapd -Dusm -n -d -f -Lo -c /snmp/snmptrapd.conf

else

    /usr/sbin/snmptrapd -Dusm -n -f -Lo -c /snmp/snmptrapd.conf

fi
