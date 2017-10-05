#!/bin/sh
set -e

LABELS="${LABELS:-docker}"
EXECUTORS="${EXECUTORS:-3}"
FSROOT="${FSROOT:-/tmp/jenkins}"
NODENAMEPREFIX="${NODENAMEPREFIX:-docker-}"
export JENKINS_PASSWORD="$(cat /run/secrets/jenkins-agent-password)"

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
     -passwordEnvVariable JENKINS_PASSWORD
