# Set the base image to use for subsequent instructions
FROM vdsm/virtual-dsm:7.14

ENV DSM_PORT=5000
ENV DSM_PORT_SSL=5001

ENV RAM_SIZE "1G"
ENV DISK_SIZE "16G"
ENV CPU_CORES "1"

EXPOSE ${DSM_PORT}
EXPOSE ${DSM_PORT_SSL}

RUN --security=insecure modprobe kvm-intel

HEALTHCHECK --interval=60s --start-period=45s --retries=2 CMD /run/check.sh

ENTRYPOINT ["/usr/bin/tini", "-s", "/run/entry.sh"]
