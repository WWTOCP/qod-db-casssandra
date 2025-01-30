FROM docker.io/cassandra
# sudo docker inspect docker.io/cassandra

# Copy our sql scripts
COPY 1_createdb.cql /cassandrascripts/
COPY 2_authors.cql /cassandrascripts/
COPY 3_genres.cql /cassandrascripts/
COPY 4_quotes_sm.cql /cassandrascripts/

# The cassandra base image does not have a /docker-entrypoint-initdb.d directory.
# I decided to simply copy the run.sh into the same folder that the .cql file(s)
# exist in
COPY run.sh /cassandrascripts/

# Expose the correct port for cassandra db 'service'
# Port 9042 is used by clients connecting via cqlsh, drivers, and
# applications using the CQL (Cassandra Query Language) protocol.
EXPOSE 9042

# Ensure the bash script is executable
RUN chmod +x /cassandrascripts/run.sh

# Execute the run.sh bash script
CMD ["/cassandrascripts/run.sh"]

