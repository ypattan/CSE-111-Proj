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
    f_pref_key INTEGER NOT NULL
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
