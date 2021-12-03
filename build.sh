#!/bin/bash

# build
podman build -t quay.io/wcaban/pod-snmp -f Containerfile
podman tag quay.io/wcaban/pod-snmp:latest quay.io/wcaban/pod-snmp:$(date +%y%m%d)

# publish
podman push quay.io/wcaban/pod-snmp
podman push quay.io/wcaban/pod-snmp:$(date +%y%m%d)

