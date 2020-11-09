-- Create all tables

CREATE TABLE Cuisine (
    name varchar(25) NOT NULL,
    cuisine_key INTEGER NOT NULL
);

CREATE TABLE CuisinePref(
    preference_key INTEGER NOT NULL,
    cuisine_key INTEGER NOT NULL 
    );

CREATE TABLE DineIn(
    Order_options_key INTEGER NOT NULL,
    phone_number INTEGER NOT NULL,
    reservation INTEGER NOT NULL
);

CREATE TABLE Orders (
    Order_options_key INTEGER NOT NULL,
    dining_key INTEGER NOT NULL,
    Restaurant varchar(25) NOT NULL
);

CREATE TABLE Restaurant(
    r_name varchar(30) NOT NULL,
    r_address varchar(30) NOT NULL,
    r_cuisineKey INTEGER NOT NULL,
    r_rating INTEGER NOT NULL,
    r_pricing varchar(20) NOT NULL,
    r_diningKey INTEGER NOT NULL,
    r_website varchar(40) NOT NULL
);

CREATE TABLE TakeOut(
    t_rest_key INTEGER NOT NULL,
    t_wesbite VARCHAR(40) NOT NULL,
    t_optKey INTEGER NOT NULL
);


CREATE TABLE Feedback(
    f_username CHAR(20) NOT NULL,
    f_res_key INTEGER NOT NULL,
    f_rating INTEGER NOT null,
    f_notes VARCHAR(250) NOT NULL,
    f_pref_key INTEGER NOT NULL,
    f_feedback_key INTEGER NOT NULL
);

CREATE TABLE History(
    h_username CHAR(20) NOT NULL,
    h_date DATE NOT NULL,
    h_rest_key INTEGER NOT NULL,
    h_feedback_key INTEGER NOT NULL,
    h_pref_key INTEGER NOT NULL
);

CREATE TABLE Preference(
    p_username VARCHAR(20) NOT NULL,
    p_food VARCHAR(20) NOT NULL,
    p_address VARCHAR(40) NOT null,
    p_minRating INTEGER NOT NULL,
    p_maxPricing VARCHAR(20) NOT NULL,
    p_dining VARCHAR(30) NOT NULL,
    p_key INTEGER NOT NULL
);

CREATE TABLE Users(
    u_username VARCHAR(30) NOT NULL,
    u_password VARCHAR(30) NOT NULL,
    u_email VARCHAR(30) NOT NULL
);

.mode "csv";
.separator ",";
.import "Cuisine.csv" Cuisine
DELETE FROM Cuisine limit 1;

.import "CuisinePreference.csv" CuisinePref
DELETE FROM CuisinePref limit 1;

.import "Dine-InOptions.csv" DineIn
DELETE FROM DineIn limit 1;

.import "UserFeedback.csv" Feedback
DELETE FROM Feedback limit 1;

.import "UserHistory.csv" History
DELETE FROM History limit 1;

.import "Orders.csv" Orders
DELETE FROM Orders limit 1;

.import "UserPreference.csv" Preference
DELETE FROM Preference limit 1;

.import "Restaurant.csv" Restaurant
DELETE FROM Restaurant limit 1;

.import "Take-outOptions.csv" TakeOut
DELETE FROM TakeOut limit 1;

.import "Users.csv" Users
DELETE FROM Users limit 1;

-- DELETE FROM Cuisine;
-- DELETE FROM CuisinePref;
-- DELETE FROM DineIn;
-- DELETE FROM Feedback;
-- DELETE FROM History;
-- DELETE FROM Orders;
-- DELETE FROM Preference;
-- DELETE FROM Restaurant;
-- DELETE FROM TakeOut;
-- DELETE FROM Users;

-- update a restaurant rating
UPDATE Restaurant SET r_rating = 2 WHERE r_diningKey = 4;

-- insert two new restaurants
INSERT INTO Restaurant (r_name, r_address, r_cuisineKey, r_rating, r_pricing, r_diningKey, r_website)
VALUES
    ("Dolce Sicilia", "San Jose", 4, 5, "$", 6, "website.com"),
    ("Opa!", "San Jose", 3.5, 21, "$$", 7, "website.com");

-- delete a restaurant
DELETE FROM Restaurant
WHERE r_name LIKE '%Dolce%';

-- insert a new cuisine
INSERT INTO Cuisine (name, cuisine_key)
VALUES ("Vegetarian", 32),
        ("Pizza", 33);

-- update cuisine name
UPDATE Cuisine SET name = "vegetarian" WHERE cuisine_key = 32;

-- delete a cuisine
DELETE FROM Cuisine
WHERE name = "Pizza";

-- insert a new user
INSERT INTO Users (u_username, u_password, u_email)
VALUES ("strawberry", "password11", "strawberry@email.com");

-- delete a user
DELETE FROM Users
WHERE u_username = "orange";

-- update a user password
UPDATE Users SET u_password = "password12" WHERE u_username = "kiwi";

-- insert user history
INSERT INTO History (h_username, h_date, h_rest_key, h_feedback_key, h_pref_key)
VALUES ("strawberry", "10/10/2020", 4, 1, 2);

-- update date from user history
UPDATE History SET h_date = "10/02/2020" WHERE h_username = "strawberry";

-- delete a user history
DELETE FROM History
WHERE u_username = "stawberry";

-- insert a new restaurant order options
INSERT INTO Orders (Order_options_key, dining_key, Restaurant)
VALUES (6, 6, "Opa!"),
        (7, 7, "Dolce Sicilia");

-- delete a restaurant's order options
DELETE FROM Orders
WHERE Restaurant = "Dolce Sicilia";

-- delete a preference
DELETE FROM Preference
WHERE p_username = 'apple' AND
p_food = 'sauce';

-- update rating and dining options for a user
UPDATE Preference
SET p_minRating = '3', p_dining = 'takeout'
WHERE p_username = 'plum' AND p_food = 'pudding';

-- add a preference
INSERT INTO Preference(p_username, p_food, p_address, p_minRating, p_maxPricing, p_dining, p_key)
VALUES('banana', 'frozen', 'Whittier', '2', '$$', 'takeout', '2');

-- delete a user feedback
DELETE FROM Feedback
WHERE f_username = 'kiwi' AND f_rating = '1' AND f_pref_key = '2';

-- update the note for a user feedback
UPDATE Feedback
SET f_notes = 'kkashdjah ahiudhw9 hd- dajhdd ', f_rating = '4'
WHERE f_username = 'apple' AND f_res_key = '3'

-- add a new user feedback
INSERT INTO Feedback(f_username, f_res_key, f_rating, f_notes, f_pref_key, f_feedback_key)
VALUES('orange', '5', '4', 'ijsdfusdhf ihas8 d7fy7', '1', '15');