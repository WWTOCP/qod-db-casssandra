echo "********* Creating QOD tables ************"
cockroach sql <flags> --file /tmp/1_createdb.sql
cockroach sql <flags> --file /tmp/2_authors.sql
cockroach sql <flags> --file /tmp/3_genres.sql
cockroach sql <flags> --file /tmp/4_quotes_sm.sql
