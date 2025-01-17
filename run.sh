echo "********* Creating QOD tables in cockroach ************"
cockroach sql --certs-dir=certs --host=127.0.0.1 --port=26257 --user=root --database=qod < 1_createdb.sql
echo "********* Seeding the QOD tables in cockroach ************"
cockroach sql --certs-dir=certs --host=127.0.0.1 --port=26257 --user=root --database=qod < 2_authors.sql > /dev/null
cockroach sql --certs-dir=certs --host=127.0.0.1 --port=26257 --user=root --database=qod < 3_genres.sql > /dev/null
cockroach sql --certs-dir=certs --host=127.0.0.1 --port=26257 --user=root --database=qod < 4_quotes_sm.sql > /dev/null
cockroach sql --certs-dir=certs --host=127.0.0.1 --port=26257 --user=root --database=qod -e 'show users;'
