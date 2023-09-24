FROM postgres:16
COPY 00-init.sh /docker-entrypoint-initdb.d/00-init.sh
COPY 01-app-schema.sh /docker-entrypoint-initdb.d/01-app-schema.sh
