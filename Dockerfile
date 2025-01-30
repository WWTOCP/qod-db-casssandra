FROM docker.io/cassandra
# sudo docker inspect docker.io/cassandra/latest
# workingdir: "/cassandra/"", entrypoint: "/cockroach/cockroach.sh"

# Copy our sql scripts
COPY 1_createdb.cql /cassandra/
COPY 2_authors.cql /cassandra/
COPY 3_genres.cql /cassandra/
COPY 4_quotes_sm.cql /cassandra/

# The cassandra base image does not have a /docker-entrypoint-initdb.d directory.
# I decided to simply copy the run.sh into the same folder that the .cql file(s)
# exist in
COPY run.sh /cassandra/

# Expose the correct port for cassandra db 'service'
# Port 9042 is used by clients connecting via cqlsh, drivers, and
# applications using the CQL (Cassandra Query Language) protocol.
EXPOSE 9042

RUN chmod +x /cassandra/run.sh
#CMD ["/cassandra/run.sh"]
