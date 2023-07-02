#!/bin/bash
set -e

export POSTGRES_USER=grokloc

echo "drop tables";

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "app" <<-EOSQL
drop table if exists audit;
drop table if exists orgs;
drop table if exists repositories;
drop table if exists users;

EOSQL

echo "re-create tables";

./01-app-schema.sh
