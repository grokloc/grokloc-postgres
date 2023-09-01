#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "app" <<-EOSQL
	create table if not exists users (
	       id text unique not null,
	       api_secret text unique not null,
	       api_secret_digest text unique not null,
	       display_name text not null,
	       display_name_digest text not null,
	       email text not null,
	       email_digest text not null,
	       key_version text not null,
	       org text not null,
	       password text not null,
	       schema_version bigint not null default 0,
	       status bigint not null default 0,
	       ctime bigint,
	       mtime bigint,
	       signature text unique not null,
	       role bigint not null default 0,
	       primary key (id));

	create unique index if not exists users_email_digest_org on users (email_digest, org);

	create table if not exists orgs (
	       id text unique not null,
	       name text unique not null,
	       owner text not null,
	       schema_version bigint not null default 0,
	       status bigint not null default 0,
	       ctime bigint,
	       mtime bigint,
	       signature text unique not null,
	       role bigint not null default 0,
	       primary key (id));

	create table if not exists repositories (
	       id text unique not null,
	       name text not null,
	       org text not null,
	       path text not null,
	       upstream text not null,
	       schema_version bigint not null default 0,
	       status bigint not null default 0,
	       ctime bigint,
	       mtime bigint,
	       signature text unique not null,
	       role bigint not null default 0,
	       primary key (id));

	create unique index if not exists repositories_name_org on repositories (name, org);

	create table if not exists audit (
	       id text unique not null,
	       code bigint not null,
	       source text not null,
	       source_id text not null,
	       schema_version bigint not null default 0,
	       ctime bigint,
	       mtime bigint,
	       signature text,
	       primary key (id));

	create or replace function on_model_insert()
	 returns trigger
	 language plpgsql
	as \$ctime_mtime_set\$
	declare
	  _new record;
	begin
	  _new := NEW;
	  _new."ctime" = floor(extract(epoch from now()));
	  _new."mtime" = floor(extract(epoch from now()));
	  _new."signature" = cast(gen_random_uuid() as text);
	  return _new;
	end;
	\$ctime_mtime_set\$;

	create or replace function on_model_update()
	 returns trigger
	 language plpgsql
	as \$mtime_set\$
	declare
	  _new record;
	begin
	  _new := NEW;
	  _new."mtime" = floor(extract(epoch from now()));
	  _new."signature" = cast(gen_random_uuid() as text);
	  return _new;
	end;
	\$mtime_set\$;

	create trigger insert_users
	  before insert on users
	  for each row
	  execute procedure on_model_insert();

	create trigger update_users
	  before update on users
	  for each row
	  execute procedure on_model_update();

	create trigger insert_orgs
	  before insert on orgs
	  for each row
	  execute procedure on_model_insert();

	create trigger update_orgs
	  before update on orgs
	  for each row
	  execute procedure on_model_update();

	create trigger insert_repositories
	  before insert on repositories
	  for each row
	  execute procedure on_model_insert();

	create trigger update_repositories
	  before update on repositories
	  for each row
	  execute procedure on_model_update();

	create trigger insert_audit
	  before insert on audit
	  for each row
	  execute procedure on_model_insert();

	create trigger update_audit
	  before update on audit
	  for each row
	  execute procedure on_model_update();

EOSQL
