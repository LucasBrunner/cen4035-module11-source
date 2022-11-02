DROP USER IF EXISTS listdotcomuser;

CREATE USER listdotcomuser
IDENTIFIED BY "s3cret";

GRANT ALL
ON listdotcom.*
TO listdotcomuser;

DROP DATABASE IF EXISTS listdotcom;
CREATE DATABASE IF NOT EXISTS listdotcom;
USE listdotcom;

CREATE TABLE IF NOT EXISTS to_do_list(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS to_do_item(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    List INT NOT NULL,
    Name VARCHAR(255),
    Location VARCHAR(255),
    Start DATETIME(6),
    End DATETIME(6),
    Content TEXT,
    FOREIGN KEY (List) REFERENCES to_do_list (ID) ON UPDATE CASCADE ON DELETE CASCADE
);