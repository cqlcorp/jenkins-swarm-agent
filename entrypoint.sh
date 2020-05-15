#!/bin/sh
set -e

export LABELS="${LABELS:-docker}"
export EXECUTORS="${EXECUTORS:-3}"
export FSROOT="${FSROOT:-/tmp/jenkins}"
export NODENAMEPREFIX="${NODENAMEPREFIX:-docker-}"

mkdir -p $FSROOT
java -jar swarm-client.jar \
     -labels "$LABELS" \
     -executors "$EXECUTORS" \
     -fsroot "$FSROOT" \
     -name ${NODENAMEPREFIX}$(hostname) \
     -disableClientsUniqueId \
     -master "${JENKINS_URL}" \
     -sslFingerprints "${JENKINS_SSL_FINGERPRINTS}" \
     -username "${JENKINS_USERNAME}" \
     -passwordFile /run/secrets/jenkins-agent-password
