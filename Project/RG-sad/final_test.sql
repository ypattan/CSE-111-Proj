CREATE TABLE IF NOT EXISTS cuisine(
    cusine_key INTEGER NOT NULL PRIMARY KEY,
    cuisine_type STRING NOT NULL
);

CREATE TABLE IF NOT EXISTS order_options(
    order_options INTEGER NOT NULL PRIMARY KEY,
    take_out Boolean NOT NULL,
    dine_in Boolean NOT NULL
);

CREATE TABLE IF NOT EXISTS restaurants(
    resId INTEGER NOT NULL PRIMARY KEY,
    name STRING NOT NULL,
    address STRING NOT NULL,
    cuisine STRING NOT NULL,
    rating INTEGER NOT NULL,
    pricing STRING NOT NULL,
    dining_key INTEGER NOT NULL,
    website STRING NOT NULL
);

CREATE TABLE IF NOT EXISTS user_feedback(
    "feedback_key" INTEGER PRIMARY KEY AUTOINCREMENT,
    "user" VARCHAR NOT NULL,
    "restaurant_key" INTEGER NOT NULL,
    "rating" INTEGER NOT NULL,
    "note" STRING NOT NULL
);

CREATE TABLE IF NOT EXISTS user_history(
    user STRING NOT NULL,
    date DATE NOT NULL,
    restaurant_key STRING NOT NULL,
    feedback_key INTEGER
);

CREATE TABLE IF NOT EXISTS user_preference(
    preference_key INTEGER PRIMARY KEY NOT NULL,
    distance INTEGER NOT NULL,
    cuisine_key INTEGER NOT NULL,
    min_rating INTEGER NOT NULL,
    max_pricing INTEGER NOT NULL,
    dining_options STRING NOT NULL,
    CHECK (dining_options IN('both', 'dine-in', 'take-out'))
);

CREATE TABLE IF NOT EXISTS users(
    username STRING NOT NULL,
    password STRING NOT NULL,
    email STRING NOT NULL
);

.import Cuisine.csv cuisine
.import Orders.csv order_options
.import Restaurant.csv restaurants
.import Users.csv users

.adopt dont shop

SELECT rowid FROM user_feedback;