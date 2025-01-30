#!/bin/bash
set -e

# Wait for Cassandra to fully start
elapsedTimeInSeconds=0
timeToWaitInSeconds=5
echo "Waiting for Cassandra to be available..."
until cqlsh -e "SHOW HOST;" > /dev/null 2>&1; do
  echo "Waited $elapsedTimeInSeconds seconds..."
  sleep $timeToWaitInSeconds
  elapsedTimeInSeconds=$((elapsedTimeInSeconds + timeToWaitInSeconds))  # Increment counter
done

echo "Cassandra is up! Executing CQL scripts..."

# Execute all CQL files in the init folder
for f in /cassandra/*.cql; do
    echo "Running $f"
    cqlsh -f "$f"
done

echo "CQL scripts executed successfully."

# Keep Cassandra running in the foreground
exec /run.sh "$@"
