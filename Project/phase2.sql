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

.open ./data/sampledata.sqlite 
.mode "csv"
.separator ","
.import ./data/customer.tbl customer