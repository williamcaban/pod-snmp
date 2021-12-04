# pod-snmp

Pod with the SNMP utilities. By default it will run the equivalent to:

```bash
snmptrapd -Dusm -n -d -f -Lo -c /snmp/snmptrapd.conf udp:9000
```

## Deploying

```bash
# Deployment
oc create -f pod-snmp-deployment.yaml
# Service (NodePort)
oc create -f snmp-trap-listener-nodeport.yaml
```

*Note:* Repo contains other service definitions for LoadBalancer type with ExternalIP and regular K8s Service.

## Testing

- To test generating SNMP traps from a Linux machine to one of the nodes listening on NodePort 30900

```bash
export NODEFQDN=m1.mgmt.telco.shift.zone

# with local snmp trap dump
snmptrap -d -v 2c -c public ${NODEFQDN}:30900 '' .1.3.6.1.4.1 SNMPv2-MIB::sysLocation.0 s "testing traps"

# snmp trap (match default script)
snmptrap -v 2c -c public ${NODEFQDN}:30900 '' .1.3.6.1.4.1 SNMPv2-MIB::sysLocation.0 s "testing traps"

# snmp trap (match in-line script)
snmptrap -v 2c -c public ${NODEFQDN}:30900 '' .1.3.6.1.4.1.2312.999 SNMPv2-MIB::sysLocation.0 s "testing traps"
```

- To test iperf in TCP or UDP enable the right command option in the deployment file and use one of the following options

```bash
# TCP test
iperf3 -p 30900 -c ${NODEFQDN}

# UDP Test 
iperf3 -p 30900 -u  -c ${NODEFQDN}
```
