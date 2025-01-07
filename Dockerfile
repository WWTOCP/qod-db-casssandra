FROM registry.connect.redhat.com/cockroachdb/cockroach

# needed for intialization
ENV COCKROACHDB_USER=user
ENV COCKROACHDB_PASSWORD=pass
ENV COCKROACHDB_DATABASE=qod

# Copy our sql scripts
COPY 1_createdb.sql /tmp/
COPY 2_authors.sql /tmp/
COPY 3_genres.sql /tmp/
COPY 4_quotes_sm.sql /tmp/

# Put our script to create db and tables in the init path
COPY run.sh /usr/share/container-scripts/mysql/init/

# Expose the correct port for COCKROACHDB
EXPOSE 26257

# Start the server
CMD ["run-mysqld"]
