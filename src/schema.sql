.open fittrackpro.db
.mode column

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS locations;

CREATE TABLE locations(
    location_id  int,
    name      text,
    address     text,
    phone_number  text,
    email      text,
    opening_hours  text
 )
;
