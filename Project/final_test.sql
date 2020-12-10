CREATE TABLE IF NOT EXISTS cuisine_table(
    cusine_key INTEGER NOT NULL PRIMARY KEY,
    cuisine_type VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS order_options_table(
    order_options INTEGER NOT NULL PRIMARY KEY,
    take_out Boolean NOT NULL,
    dine_in Boolean NOT NULL
);

CREATE TABLE IF NOT EXISTS restaurants_table(
    resId INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    cuisine VARCHAR NOT NULL,
    rating INTEGER NOT NULL,
    pricing VARCHAR NOT NULL,
    dining_key INTEGER NOT NULL,
    website VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS user_feedback_table(
    feedback_key INTEGER NOT NULL,
    user_feedback VARCHAR NOT NULL,
    restaurant VARCHAR NOT NULL,
    rating INTEGER NOT NULL,
    note VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS user_history_table(
    user VARCHAR NOT NULL,
    date DATE NOT NULL,
    restaurant VARCHAR NOT NULL,
    feedback_key INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS user_preference(
    preference_key INTEGER PRIMARY KEY NOT NULL,
    distance INTEGER NOT NULL,
    cuisine_key INTEGER NOT NULL,
    min_rating INTEGER NOT NULL,
    max_pricing INTEGER NOT NULL,
    dining_options VARCHAR NOT NULL,
    CHECK (dining_options IN('both', 'dine-in', 'take-out'))
);

CREATE TABLE IF NOT EXISTS users_table(
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    email VARCHAR NOT NULL
);