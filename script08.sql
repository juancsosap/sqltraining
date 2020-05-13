-- CREATE TABLE
CREATE TABLE users (
  user_id    NUMBER(5)    NOT NULL,
  username   VARCHAR(20)  NOT NULL,
  password   VARCHAR(20)  NOT NULL,
  email      VARCHAR(50)  NOT NULL UNIQUE
);

DESCRIBE users;

