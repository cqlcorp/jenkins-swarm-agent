FROM docker:18.09.6
MAINTAINER Chad Gilbert <chad.gilbert@cqlcorp.com>

ARG JENKINS_SWARM_CLIENT_VERSION=3.9

RUN apk --update add openjdk8-jre git ca-certificates wget \
    && wget -O swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${JENKINS_SWARM_CLIENT_VERSION}/swarm-client-${JENKINS_SWARM_CLIENT_VERSION}.jar

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh  \
    && sed -i -e 's/\r$//' /entrypoint.sh

CMD ["/entrypoint.sh"]
