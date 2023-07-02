#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    GRANT ALL PRIVILEGES ON DATABASE grokloc TO grokloc;
    CREATE DATABASE app;
    GRANT ALL PRIVILEGES ON DATABASE app TO grokloc;
    CREATE DATABASE minion;
    GRANT ALL PRIVILEGES ON DATABASE minion TO grokloc;
EOSQL
