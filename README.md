# pod-snmp

Pod with the SNMP utilities. By default it will run the equivalent to:

```bash
snmptrapd -Dusm -n -d -f -Lo -c /snmp/snmptrapd.conf udp:9000
```

## Testing

- To test generating SNMP traps from a Linux machine to one of the nodes listening on NodePort 30900

```bash
snmptrap -d -v 2c -c public <your-node-name-or-ip>:30900 '' .1.3.6.1.4.1 SNMPv2-MIB::sysLocation.0 s "testing traps"
```

- To test iperf in TCP or UDP enable the right command option in the deployment file and use one of the following options

```bash
# TCP test
iperf3 -p 30900     -c <your-node-name-or-ip>

# UDP Test 
iperf3 -p 30900 -u  -c <your-node-name-or-ip>
```