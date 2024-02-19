#! make
package:
	mvn clean package -Dmaven.test.skip

run: package
	cd ./server && exec java -jar target/ala-namematching-server-1.8.1.jar server /data/ala-namematching-service/config/namematching-service-config.yml

run-docker: package
	docker compose -f docker-compose.yml up --detach

release:
	../sbdi-install/utils/make-release.sh
