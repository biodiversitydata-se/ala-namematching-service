#!/bin/sh
DEFAULT_JAVA_OPTS="-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"
DEFAULT_JAVA_OPTS="${DEFAULT_JAVA_OPTS} -Dlog4j.configuration=/data/ala-namematching-service/config/log4j.xml"
DEFAULT_JAVA_OPTS="${DEFAULT_JAVA_OPTS} -Dlogback.configurationFile=/data/ala-namematching-service/config/logback.xml"
JAVA_OPTS="${DEFAULT_JAVA_OPTS} ${JAVA_OPTS}"
exec ${JAVA_HOME}/bin/java ${JAVA_OPTS} -jar /opt/atlas/ala-namematching-service/ala-namematching-server.jar server /data/ala-namematching-service/config/namematching-service-config.yml
