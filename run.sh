#!/bin/bash
set -e

# Start Cassandra in the background
echo "Starting Cassandra..."

# -R indicates to run in foreground and output to stdout
# the docker-entrypoint.sh in the official docker cassandra base image
# does a lot including set the correct network bindings to 0.0.0.0
docker-entrypoint.sh cassandra -R &

# Wait for Cassandra to fully start
# Function to check if Cassandra is ready
check_cassandra() {
    elapsedTimeInSeconds=0
    timeToWaitInSeconds=5
    echo "Waiting for Cassandra to be ready..."
    until cqlsh -e "SELECT release_version FROM system.local;" >/dev/null 2>&1; do
        echo "Cassandra is not ready yet. Retrying in ${timeToWaitInSeconds} seconds..."
        echo "Waited $elapsedTimeInSeconds seconds..."
        sleep $timeToWaitInSeconds
        elapsedTimeInSeconds=$((elapsedTimeInSeconds + timeToWaitInSeconds))  # Increment counter
    done
    echo "Cassandra is now ready!"
}

check_cassandra

echo "Cassandra is up! Executing CQL scripts..."

# Execute .cql scripts
echo "Executing CQL scripts..."
cqlsh -f /cassandrascripts/1_createdb.cql 2>&1
cqlsh -f /cassandrascripts/2_quotes.cql 2>&1

echo "CQL scripts executed successfully."

echo "Cassandra setup complete. Keeping container running..."
# Keeps the container running for debugging purposes
tail -f /dev/null