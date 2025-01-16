FROM docker.io/cockroachdb/cockroach

#VOLUME ["/cockroach-data"]

# needed for intialization
#ENV COCKROACHDB_USER=user
#ENV COCKROACHDB_PASSWORD=pass
#ENV COCKROACHDB_DATABASE=qod

# Copy our sql scripts
COPY 1_createdb.sql /cockroach/
COPY 2_authors.sql /cockroach/
COPY 3_genres.sql /cockroach/
COPY 4_quotes_sm.sql /cockroach/

# Put our script to create db and tables in the init path
COPY run.sh /docker-entrypoint-initdb.d

# Expose the correct port for COCKROACHDB
EXPOSE 26257
# Expose the cockroachdb dashboard
EXPOSE 8080
# Start the server
CMD ["start-single-node", "--insecure"]
