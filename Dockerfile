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

# cockroach secure mode requires "certificates"
# inspired from: https://www.cockroachlabs.com/docs/stable/cockroach-start-single-node

#NOTE: The /certs folder is part of the base image and its client node certificate is created for 127.0.0.1 and not localhost
# NOTE: CMD execute after the docker container has started
CMD ["start-single-node", "--certs-dir=certs"]
