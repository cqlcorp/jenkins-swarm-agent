FROM docker:19.03.8
MAINTAINER Chad Gilbert <chad.gilbert@cqlcorp.com>

ARG JENKINS_SWARM_CLIENT_VERSION=3.19
ARG SLF4J_API_VERSION=1.7.30

RUN apk --update add openjdk8-jre git ca-certificates wget git-lfs nss \
    && wget -O swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${JENKINS_SWARM_CLIENT_VERSION}/swarm-client-${JENKINS_SWARM_CLIENT_VERSION}.jar \
    && wget -O slf4j-api-${SLF4J_API_VERSION}.jar https://repo1.maven.org/maven2/org/slf4j/slf4j-api/${SLF4J_API_VERSION}/slf4j-api-${SLF4J_API_VERSION}.jar

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh  \
    && sed -i -e 's/\r$//' /entrypoint.sh

CMD ["/entrypoint.sh"]
