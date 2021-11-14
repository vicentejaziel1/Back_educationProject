# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version

Make sure you have a fresh version of Ruby, at least 2.7.4

## Install Postgres

**Postgres Config**

```bash
psql postgres
```

Inside psql console:

```sql
CREATE ROLE postgres SUPERUSER;
ALTER ROLE postgres PASSWORD 'secret';
ALTER ROLE postgres WITH LOGIN;
```

## Try it!

Simply run:

```bash
rails s
```

## Database creation

Simply run:

```bash
rails db:create
```

## Database initialization

```bash
rails db:migrate
```
