# podman build -t quay.io/wcaban/pod-snmp -f Containerfile
# podman tag quay.io/wcaban/pod-snmp:latest quay.io/wcaban/pod-snmp:$(date +%y%m%d)
FROM registry.access.redhat.com/ubi8/ubi

# NOTE: Using the UBI image with some of these packages requires
# building the container on a RHEL node with valid subscriptions
# other: net-snmp-devel
RUN dnf install --setopt=tsflags=nodocs -y \
    iproute bind-utils iputils procps-ng iperf3 \
    net-snmp net-snmp-utils && \
    dnf -y update && \
    dnf clean all && \
    rm -rf /var/cache/dnf

WORKDIR /snmp
COPY snmptrapd.conf       snmptrapd.conf
COPY snmp-trap-handler.sh snmp-trap-handler.sh
COPY entrypoint.sh        entrypoint.sh

LABEL   io.k8s.display-name="SNMP Tools" \
        io.k8s.description="Container with snmp tools" \
        io.openshift.tags="pod-snmp"

ENTRYPOINT /bin/bash -c "sleep infinity"
