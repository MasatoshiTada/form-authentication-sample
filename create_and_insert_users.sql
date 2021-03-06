CREATE TABLE users
(
    login_id VARCHAR(128) PRIMARY KEY,
    encrypt_password VARCHAR(128),
    name VARCHAR(128)
);

CREATE TABLE user_roles
(
    login_id VARCHAR(128),
    role_name VARCHAR(128)
);

-- password is "password"
INSERT INTO users VALUES('adminA', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'adminA');
INSERT INTO users VALUES('adminB', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'adminB');

INSERT INTO user_roles(login_id, role_name) VALUES('adminA', 'ADMINISTRATOR');
INSERT INTO user_roles(login_id, role_name) VALUES('adminB', 'ADMINISTRATOR');
