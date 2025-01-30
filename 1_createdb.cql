-- echo out current roles
SELECT role FROM system_auth.roles;

-- A keyspace is a "database" in cassandra
-- This is a simple single-node server
CREATE KEYSPACE qod
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE qod;

-- Grant permissions on future objects
--ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO "user";
--ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON SEQUENCES TO "user";
--ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON FUNCTIONS TO "user";

CREATE TABLE quotes (
  id INT PRIMARY KEY, 
  genre TEXT,
  author TEXT,
  text TEXT
);
