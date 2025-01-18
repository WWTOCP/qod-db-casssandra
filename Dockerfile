FROM docker.io/cockroachdb/cockroach
# sudo docker inspect docker.io/cockroachdb/cockroach
# workingdir: "/cockroach/"", entrypoint: "/cockroach/cockroach.sh"

# Copy our sql scripts
COPY 1_createdb.sql /cockroach/
COPY 2_authors.sql /cockroach/
COPY 3_genres.sql /cockroach/
COPY 4_quotes_sm.sql /cockroach/

# The cockroach base image will automatically execute .sh files and .sql files
# that are in the /docker-entrypoint-initdb.d directory.
COPY run.sh /docker-entrypoint-initdb.d

# Expose the correct port for cockroach db 'service'
EXPOSE 26257
# Expose the cockroachdb web dashboard
EXPOSE 8080

# NOTE: CMD execute after the docker container has started

# cockroach secure mode requires "certificates"
# inspired from: https://www.cockroachlabs.com/docs/stable/cockroach-start-single-node

# create the directories to store the certs and keys file(s)
#RUN ["mkdir -p certs keys"]

# NOTE: The cockroach base image entrypoint is defined as: ENTRYPOINT ["cockroach"]

# create the 'Certificate Authority cert locally'
# ./cockroach cert create-ca --certs-dir=certs --ca-key=keys/my-ca.key
#CMD ["cert", "create-ca", "--certs-dir=certs", "--ca-key=keys/my-ca.key"]

# create a certificate for the node (note: just a single instance for now)
# ./cockroach cert create-node localhost $(hostname) --certs-dir=certs --ca-key=keys/my-ca.key
#CMD ["cert", "create-node", "localhost", "$(hostname)", "--certs-dir=certs", "--ca-key=keys/my-ca.key"]

# create a certificate for the 'root' user
# ./cockroach cert create-client root --certs-dir=certs --ca-key=keys/my-ca.key 
#CMD ["cert", "create-client", "root",  "--certs-dir=certs", "--ca-key=keys/my-ca.key"]

# Start the server
# ./cockroach start-single-node --certs-dir=certs --listen-addr=localhost:26257 --http-addr=localhost:8080
#CMD ["start-single-node", "--certs-dir=certs", "--listen-addr=localhost:26257", "--http-addr=localhost:8080"]

# NOTE: cockroach is now running in secure mode, to connect using the 'root' user, you must use the certs
# that were created in the above steps and execute sql commands:
# ./cockroach sql --certs-dir=certs

# NOTE: In postgres/cockroach, a 'user' is a 'role' with login ability.
# CREATE ROLE "User" WITH LOGIN PASSWORD 'pass';

#NOTE: The /certs folder is part of the base image and its client node certificate is created for 127.0.0.1 and not localhost
CMD ["start-single-node", "--certs-dir=certs"]
