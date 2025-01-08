# qod-db
Quote of the Day database

### Ports
This deployment opens up database access for CockroachDB on port `26257`. Please set the service for this deploymemt to use port 26257, which is also the default used by the qod-api deployment to access this database.

### Notes
* Works with redhat CockroachDB docker image
* Automatically creates QOD db and populates it with quotes, authors and genres tables including the data
* No need of higher privileges (eg: anyuid) to run in openshift
