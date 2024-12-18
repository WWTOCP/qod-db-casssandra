echo "********* Creating QOD tables ************"
mysql $mysql_flags < /tmp/1_createdb.sql
mysql $mysql_flags < /tmp/2_authors.sql
mysql $mysql_flags < /tmp/3_genres.sql
mysql $mysql_flags < /tmp/4_quotes_sm.sql
