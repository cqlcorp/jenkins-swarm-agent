#!/bin/sh
set -e

LABELS="${LABELS:-docker}"
EXECUTORS="${EXECUTORS:-3}"
FSROOT="${FSROOT:-/tmp/jenkins}"
NODENAMEPREFIX="${NODENAMEPREFIX:-docker-}"

mkdir -p $FSROOT
java -jar swarm-client.jar -labels "$LABELS" -executors "$EXECUTORS" -fsroot /tmp/jenkins -name ${NODENAMEPREFIX}$(hostname) $(cat /run/secrets/jenkins | sed -e 's/\r$//')
