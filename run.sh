echo "********* Creating QOD tables in cockroach ************"
cockroach sql --insecure --host=localhost --port=26257 --user=root --database=qod < 1_createdb.sql
echo "********* Seeding the QOD tables in cockroach ************"
cockroach sql --insecure --host=localhost --port=26257 --user=root --database=qod < 2_authors.sql
cockroach sql --insecure --host=localhost --port=26257 --user=root --database=qod < 3_genres.sql
cockroach sql --insecure --host=localhost --port=26257 --user=root --database=qod < 4_quotes_sm.sql > /dev/null
