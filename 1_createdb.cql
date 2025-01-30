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

CREATE TABLE authors (
  author_id INT PRIMARY KEY, -- does not allow nulls
  author TEXT
);

CREATE TABLE genres (
  genre_id INT PRIMARY KEY,  -- does not allow nulls
  genre TEXT
);

CREATE TABLE quotes (
  quote_id INT PRIMARY KEY, 
  genre_id INT,
  author_id INT,
  quote TEXT
);
