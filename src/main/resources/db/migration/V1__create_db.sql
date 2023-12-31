CREATE TABLE IF NOT EXISTS client(
    ID IDENTITY NOT NULL PRIMARY KEY,
    NAME VARCHAR NOT NULL CHECK(CHAR_LENGTH(NAME) >= 3 AND CHAR_LENGTH(NAME) <= 200)
);

CREATE TABLE IF NOT EXISTS planet(
    ID VARCHAR NOT NULL CHECK(REGEXP_LIKE(ID, '^[A-Z0-9]*$')) PRIMARY KEY,
    NAME VARCHAR NOT NULL CHECK(CHAR_LENGTH(NAME) >= 1 AND CHAR_LENGTH(NAME) <= 500)
);

CREATE TABLE IF NOT EXISTS ticket(
    ID IDENTITY NOT NULL PRIMARY KEY,
    CREATED_AT TIMESTAMP NOT NULL,
    CLIENT_ID BIGINT NOT NULL,
    FOREIGN KEY(CLIENT_ID) REFERENCES client(ID),
    FROM_PLANET_ID VARCHAR NOT NULL,
    FOREIGN KEY(FROM_PLANET_ID) REFERENCES planet(ID),
    TO_PLANET_ID VARCHAR NOT NULL,
    FOREIGN KEY(TO_PLANET_ID) REFERENCES planet(ID)
);