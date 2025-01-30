# qod-db
Quote of the Day database

### Ports
This deployment opens up Cassandra database access for Cassandra (NoSQL, Not Only SQL) on port `9042`.

### Notes
* Works with office Cassandra docker image
* Automatically creates QOD database or keyspace as Cassandra calls them, and populates a 'quotes' table.  Cassandra does NOT support table joins, so the data is denormalized into a single 'quotes' table.
* No need of higher privileges (eg: anyuid) to run in openshift
