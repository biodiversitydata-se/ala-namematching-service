# ALA Name Matching Service

## Setup

### Config and data directory
Create data directory at `/data/ala-namematching-service` and populate as below (it is easiest to symlink the config files to the ones in this repo):
```
$ tree /data/ala-namematching-service
/data/ala-namematching-service
└── config
    ├── groups.json -> /home/manash/projects/ala-namematching-service/sbdi/data/config/groups.json
    ├── log4j.xml -> /home/manash/projects/ala-namematching-service/sbdi/data/config/log4j.xml
    ├── logback.xml -> /home/manash/projects/ala-namematching-service/sbdi/data/config/logback.xml
    ├── namematching-service-config.yml -> /home/manash/projects/ala-namematching-service/sbdi/data/config/namematching-service-config.yml
    └── subgroups.json -> /home/manash/projects/ala-namematching-service/sbdi/data/config/subgroups.json
```

### Index
The service requires a taxonomic search index (Lucene) which can be setup using the docker image ghcr.io/biodiversitydata-se/ala-name-matching-index
It can be setup on a local file system using the ```nameindex.yml``` for local development or as a part of the composition while running in docker.
```

make index
```

## Usage
Run locally:
```
make run
```

Build and run in Docker (using Tomcat). This requires a small change in the config file to work. See comment in Makefile.
```
make run-docker
```

Make a release. This will create a new tag and push it. A new Docker image will be built on Github.
```
$ make release
Current version: 1.0.1. Enter the new version (or press Enter for 1.0.2): 
Updating to version 1.0.2
Tag 1.0.2 created and pushed.
```
