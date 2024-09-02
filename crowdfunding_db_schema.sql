
-- Contacts Table
CREATE TABLE contacts (
    contact_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Category Table
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE
);

-- Subcategory Table
CREATE TABLE subcategory (
    subcategory_id SERIAL PRIMARY KEY,
    category_id INT,
    subcategory_name VARCHAR(100) UNIQUE,
    FOREIGN KEY (category_id) REFERENCES category (category_id)
);

-- Campaign Table
CREATE TABLE campaign (
    campaign_id SERIAL PRIMARY KEY,
    contact_id INT,
    category_id INT,
    subcategory_id INT,
    name VARCHAR(255),
    goal FLOAT,
    pledged FLOAT,
    backers INT,
    launch_date TIMESTAMP,
    end_date TIMESTAMP,
    FOREIGN KEY (contact_id) REFERENCES contacts (contact_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory (subcategory_id)
);
