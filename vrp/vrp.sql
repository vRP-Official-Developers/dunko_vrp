CREATE TABLE IF NOT EXISTS vrp_users(
    id INTEGER AUTO_INCREMENT,
    last_login VARCHAR(100),
    whitelisted BOOLEAN,
    banned BOOLEAN,
    bantime VARCHAR(100) NOT NULL DEFAULT "",
    banreason VARCHAR(1000) NOT NULL DEFAULT "",
    banadmin VARCHAR(100) NOT NULL DEFAULT "",
    CONSTRAINT pk_user PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS vrp_user_ids (
    identifier VARCHAR(100) NOT NULL,
    user_id INTEGER,
    banned BOOLEAN,
    CONSTRAINT pk_user_ids PRIMARY KEY(identifier)
);

CREATE TABLE IF NOT EXISTS vrp_user_tokens (
    token VARCHAR(200),
    user_id INTEGER,
    banned BOOLEAN  NOT NULL DEFAULT 0,
    CONSTRAINT pk_user_tokens PRIMARY KEY(token)
);

CREATE TABLE IF NOT EXISTS vrp_user_data(
    user_id INTEGER,
    dkey VARCHAR(100),
    dvalue TEXT,
    CONSTRAINT pk_user_data PRIMARY KEY(user_id,dkey),
    CONSTRAINT fk_user_data_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS vrp_srv_data(
    dkey VARCHAR(100),
    dvalue TEXT,
    CONSTRAINT pk_srv_data PRIMARY KEY(dkey)
);

CREATE TABLE IF NOT EXISTS vrp_user_moneys(
    user_id INTEGER,
    wallet INTEGER,
    bank INTEGER,
    CONSTRAINT pk_user_moneys PRIMARY KEY(user_id),
    CONSTRAINT fk_user_moneys_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS vrp_user_business(
    user_id INTEGER,
    name VARCHAR(30),
    description TEXT,
    capital INTEGER,
    laundered INTEGER,
    reset_timestamp INTEGER,
    CONSTRAINT pk_user_business PRIMARY KEY(user_id),
    CONSTRAINT fk_user_business_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS vrp_user_vehicles(
    user_id INTEGER,
    vehicle VARCHAR(100),
    vehicle_plate varchar(255) NOT NULL,
    rented BOOLEAN NOT NULL DEFAULT 0,
    rentedid varchar(200) NOT NULL DEFAULT '',
    rentedtime varchar(2048) NOT NULL DEFAULT '',
    CONSTRAINT pk_user_vehicles PRIMARY KEY(user_id,vehicle),
    CONSTRAINT fk_user_vehicles_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS vrp_user_homes(
    user_id INTEGER,
    home VARCHAR(100),
    number INTEGER,
    CONSTRAINT pk_user_homes PRIMARY KEY(user_id),
    CONSTRAINT fk_user_homes_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE,
    UNIQUE(home,number)
);

CREATE TABLE IF NOT EXISTS vrp_user_identities(
    user_id INTEGER,
    registration VARCHAR(100),
    phone VARCHAR(100),
    firstname VARCHAR(100),
    name VARCHAR(100),
    age INTEGER,
    CONSTRAINT pk_user_identities PRIMARY KEY(user_id),
    CONSTRAINT fk_user_identities_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE,
    INDEX(registration),
    INDEX(phone)
);

CREATE TABLE IF NOT EXISTS vrp_warnings (
    warning_id INT AUTO_INCREMENT,
    user_id INT,
    warning_type VARCHAR(25),
    duration INT,
    admin VARCHAR(100),
    warning_date DATE,
    reason VARCHAR(2000),
    PRIMARY KEY (warning_id)
);