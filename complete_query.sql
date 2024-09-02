-- Connect to PostgreSQL and create the database
CREATE DATABASE crowdfunding_db;

-- Connect to the newly created database
\c crowdfunding_db

-- Create the contacts table
CREATE TABLE contacts (
    contact_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Create the category table
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE
);

-- Create the subcategory table
CREATE TABLE subcategory (
    subcategory_id SERIAL PRIMARY KEY,
    category_id INT,
    subcategory_name VARCHAR(100) UNIQUE,
    FOREIGN KEY (category_id) REFERENCES category (category_id)
);

-- Create the campaign table with all necessary columns
CREATE TABLE campaign (
    cf_id SERIAL PRIMARY KEY,
    contact_id INT,
    category_id INT,
    subcategory_id INT,
    company_name VARCHAR(255),
    description TEXT,
    goal FLOAT,
    pledged FLOAT,
    outcome VARCHAR(50),
    backers_count INT,
    country VARCHAR(10),
    currency VARCHAR(10),
    launch_date TIMESTAMP,
    end_date TIMESTAMP,
    staff_pick BOOLEAN,
    spotlight BOOLEAN,
    category VARCHAR(100),
    sub_category VARCHAR(100),
    cat_id VARCHAR(10),
    subcategory VARCHAR(100),
    scat_id VARCHAR(10)
);

-- Import data into the contacts table
\copy contacts(first_name, last_name, email, phone)
FROM '/Users/davidflores/Develop/Aprendizaje/Develop/Tecnologico Monterrey/Challenge/Proyect 2 Challenge/Resources/contacts.csv'
DELIMITER ','
CSV HEADER;

-- Import data into the category table
\copy category(category_name)
FROM '/Users/davidflores/Develop/Aprendizaje/Develop/Tecnologico Monterrey/Challenge/Proyect 2 Challenge/Resources/category.csv'
DELIMITER ','
CSV HEADER;

-- Import data into the subcategory table
\copy subcategory(category_id, subcategory_name)
FROM '/Users/davidflores/Develop/Aprendizaje/Develop/Tecnologico Monterrey/Challenge/Proyect 2 Challenge/Resources/subcategory.csv'
DELIMITER ','
CSV HEADER;

-- Import data into the campaign table
\copy campaign(contact_id, category_id, subcategory_id, company_name, description, goal, pledged, outcome, backers_count, country, currency, launch_date, end_date, staff_pick, spotlight, category, sub_category, cat_id, subcategory, scat_id)
FROM '/Users/davidflores/Develop/Aprendizaje/Develop/Tecnologico Monterrey/Challenge/Proyect 2 Challenge/Resources/campaign.csv'
DELIMITER ','
CSV HEADER
QUOTE '"'
ESCAPE '"';

-- Verify imported data
SELECT * FROM contacts LIMIT 5;
SELECT * FROM category LIMIT 5;
SELECT * FROM subcategory LIMIT 5;
SELECT * FROM campaign LIMIT 5;
