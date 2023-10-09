FROM eclipse-temurin:8
ENV TZ=Europe/Stockholm
ENV DOCKERIZE_VERSION v0.7.0

RUN mkdir -p \
    /data/ala-namematching-service/config \ 
    /opt/atlas/ala-namematching-service \
    /var/log/atlas/ala-namematching-service \
    /data/lucene/namematching

COPY sbdi/data/config/*.* /data/ala-namematching-service/config/
COPY server/target/ala-namematching-server-[0-9].[0-9].[0-9].jar /opt/atlas/ala-namematching-service/ala-namematching-server.jar
COPY sbdi/java-entrypoint.sh /opt/java-entrypoint.sh 
RUN chmod u+x /opt/java-entrypoint.sh

EXPOSE 9179
EXPOSE 9180

ENTRYPOINT [ "/opt/java-entrypoint.sh" ]
