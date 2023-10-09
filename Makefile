#! make
package:
	mvn clean package -Dmaven.test.skip

index:
	mkdir -p /tmp/data_nameindex_local
	docker compose -f nameindex.yml up --detach nameindex

run: package index
	cd ./server && exec java -jar target/ala-namematching-server-1.8.1.jar server config-local.yml

clean:
	docker compose -f nameindex.yml down nameindex
	docker volume rm ala-namematching-service_data_nameindex_local
	sudo rm -rf /tmp/data_nameindex_local

run-docker: package
	docker compose -f docker-compose.yml up --detach

release:
	@./sbdi/make-release.sh
