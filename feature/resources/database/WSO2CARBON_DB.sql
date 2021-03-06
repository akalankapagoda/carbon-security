CREATE TABLE UM_GROUP
(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    GROUP_NAME VARCHAR(256) NOT NULL,
    GROUP_UNIQUE_ID VARCHAR(64) NOT NULL
);
CREATE TABLE UM_GROUP_ROLE
(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    GROUP_ID INTEGER NOT NULL,
    ROLE_ID INTEGER NOT NULL
);
CREATE TABLE UM_PASSWORD_INFO
(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    USER_ID INTEGER NOT NULL,
    PASSWORD_SALT VARCHAR(64) NOT NULL,
    HASH_ALGO VARCHAR(100) NOT NULL
);
CREATE TABLE UM_PERMISSION
(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    RESOURCE_ID VARCHAR(256) NOT NULL,
    ACTION VARCHAR(256) NOT NULL
);
CREATE TABLE UM_ROLE
(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ROLE_NAME VARCHAR(256) NOT NULL
);
CREATE TABLE UM_ROLE_PERMISSION
(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ROLE_ID INTEGER NOT NULL,
    PERMISSION_ID INTEGER NOT NULL
);
CREATE TABLE UM_USER
(
    USER_UNIQUE_ID VARCHAR(64) NOT NULL,
    USERNAME VARCHAR(256) NOT NULL,
    PASSWORD VARCHAR(64) NOT NULL,
    ID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL
);
CREATE TABLE UM_USER_ATTRIBUTES
(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ATTR_NAME VARCHAR(255) NOT NULL,
    ATTR_VALUE VARCHAR(1024) NOT NULL,
    USER_ID INTEGER NOT NULL
);
CREATE TABLE UM_USER_GROUP
(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    USER_ID INTEGER NOT NULL,
    GROUP_ID INTEGER NOT NULL
);
CREATE TABLE UM_USER_ROLE
(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    USER_ID INTEGER NOT NULL,
    ROLE_ID INTEGER NOT NULL
);

ALTER TABLE UM_GROUP_ROLE ADD FOREIGN KEY (GROUP_ID) REFERENCES UM_GROUP (ID);
ALTER TABLE UM_GROUP_ROLE ADD FOREIGN KEY (ROLE_ID) REFERENCES UM_ROLE (ID);
ALTER TABLE UM_PASSWORD_INFO ADD FOREIGN KEY (USER_ID) REFERENCES UM_USER (ID);
ALTER TABLE UM_ROLE_PERMISSION ADD FOREIGN KEY (PERMISSION_ID) REFERENCES UM_PERMISSION (ID);
ALTER TABLE UM_ROLE_PERMISSION ADD FOREIGN KEY (ROLE_ID) REFERENCES UM_ROLE (ID);
CREATE UNIQUE INDEX "unique_USERNAME_INDEX_1" ON UM_USER (USERNAME);
ALTER TABLE UM_USER_ATTRIBUTES ADD FOREIGN KEY (USER_ID) REFERENCES UM_USER (ID);
ALTER TABLE UM_USER_GROUP ADD FOREIGN KEY (GROUP_ID) REFERENCES UM_GROUP (ID);
ALTER TABLE UM_USER_GROUP ADD FOREIGN KEY (USER_ID) REFERENCES UM_USER (ID);
ALTER TABLE UM_USER_ROLE ADD FOREIGN KEY (ROLE_ID) REFERENCES UM_ROLE (ID);
ALTER TABLE UM_USER_ROLE ADD FOREIGN KEY (USER_ID) REFERENCES UM_USER (ID);
CREATE INDEX CONSTRAINT_BA_INDEX_E ON UM_USER_ROLE (USER_ID);
