# qod-db
Quote of the Day database

### Ports
This deployment opens up database access for MySQL on port `3306`. Please set the service for this deploymemt to use port 3306, which is also the default used by the qod-api deployment to access this database.

### Notes
* Works with redhat MySQL docker image
* Automatically creates QOD db and populates it with quotes, authors and genres tables including the data
* No need of higher privileges (eg: anyuid) to run in openshift

I added this line.
