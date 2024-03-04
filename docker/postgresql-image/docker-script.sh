#!/bin/sh
    chown -R postgres "$PGDATA"
    su-exec postgres initdb

    : ${POSTGRES_USER:="postgres"}
    : ${POSTGRES_DB:=$POSTGRES_USER}

    if [ "$POSTGRES_PASSWORD" ]; then
      pass="PASSWORD '$POSTGRES_PASSWORD'"
      authMethod=md5
    else
      pass=
      authMethod=trust
    fi
    echo


    if [ "$POSTGRES_DB" != 'postgres' ]; then
      createSql="CREATE DATABASE $POSTGRES_DB;"
      echo $createSql | su-exec postgres postgres --single -jE
      echo
    fi

    if [ "$POSTGRES_USER" != 'postgres' ]; then
      op=CREATE
    else
      op=ALTER
    fi

    userSql="$op USER $POSTGRES_USER WITH SUPERUSER $pass;"
    echo $userSql | su-exec postgres postgres --single -jE
    echo

    { echo; echo "host all all 0.0.0.0/0 $authMethod"; } >> "$PGDATA"/pg_hba.conf
    { echo; echo "listen_addresses='*'";} >> "$PGDATA"/postgresql.conf

su-exec postgres pg_ctl -D "$PGDATA" -o "-c listen_addresses='*'" -w start
sed -i 's/${DB_NAME}/'"$POSTGRES_DB"'/' /init.sql
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f /init.sql
tail -f /dev/null