CREATE TABLE customer(
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	email VARCHAR(60) NOT NULL,
	company VARCHAR(60) NOT NULL,
	street VARCHAR(50) NOT NULL,
	city VARCHAR(30) NOT NULL,
	state CHAR(2) NOT NULL,
	zip SMALLINT NOT NULL,
	phone VARCHAR(20) NOT NULL,
	birth_date DATE NULL,
	sex CHAR(1) NOT NULL,
	date_entered TIMESTAMP NOT NULL,
	id SERIAL PRIMARY KEY
);


INSERT INTO customer(first_name,last_name,email,company,street,
					 city,state,zip,phone,birth_date,sex,date_entered)
VALUES('Christoper','Jones','christoperjones@bp.com','BP','347 Cedat St','Lawreceville','GA',
	  '30044','348-848-8291','1938-09-11','M',CURRENT_TIMESTAMP);

CREATE TYPE sex_type AS ENUM
('M','F');

ALTER TABLE customer 
ALTER COLUMN sex TYPE  sex_type USING sex::sex_type;

CREATE TABLE sales_person(
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	email VARCHAR(60) NOT NULL,
	company VARCHAR(60) NOT NULL,
	street VARCHAR(50) NOT NULL,
	city VARCHAR(30) NOT NULL,
	state CHAR(2) NOT NULL,
	zip SMALLINT NOT NULL,
	phone VARCHAR(20) NOT NULL,
	birth_date DATE NULL,
	sex sex_type NOT NULL,
	date_hired TIMESTAMP NOT NULL,
	id SERIAL PRIMARY KEY
);

CREATE TABLE product_type(
	name VARCHAR(30) NOT NULL,
	id SERIAL PRIMARY KEY
);

CREATE TABLE item(
	product_id INTEGER REFERENCES product(id),
	size INTEGER NOT NULL,
	color VARCHAR(30) NOT NULL,
	picture VARCHAR(256) NOT NULL,
	price NUMERIC(6,2) NOT NULL,
	id SERIAL PRIMARY KEY
);


CREATE TABLE sales_order(
	customer_id INTEGER REFERENCES customer(id),
	sales_person_id INTEGER REFERENCES sales_person(id),
	time_order_taken TIMESTAMP NOT NULL,
	purchase_order_number INTEGER NOT NULL,
	credit_card_number VARCHAR(16) NOT NULL,
	credit_card_exper_month SMALLINT NOT NULL,
	credit_card_exper_day SMALLINT NOT NULL,
	credit_card_secret_code SMALLINT NOT NULL,
	name_on_card VARCHAR(100) NOT NULL,	
	id SERIAL PRIMARY KEY
);
ALTER TABLE sales_ordae RENAME TO sales_order;

CREATE TABLE sales_item(
	item_id INTEGER REFERENCES item(id),
	sales_order_id INTEGER REFERENCES sales_order(id),
	quantity INTEGER NOT NULL,
	discount NUMERIC(3,2) NULL DEFAULT 0,
	tacable BOOLEAN NOT NULL DEFAULT FALSE,
	sales_tax_rate NUMERIC(5,2) NOT NULL DEFAULT 0,
	id SERIAL PRIMARY KEY
);
ALTER TABLE sales_item ALTER COLUMN day_of_week SET NOT NULL;
ALTER TABLE sales_item DROP COLUMN day_of_week ;

CREATE TABLE transaction_type(
	name VARCHAR(30) NOT NULL,
	payment_type VARCHAR(30) NOT NULL,
	id SERIAL PRIMARY KEY
);

ALTER TABLE  transaction_type RENAME TO transaction;

CREATE INDEX transaction_id_2 ON transaction(name,payment_type);

DROP table transaction;

INSERT INTO product_type(name) VALUES('Athletic');

SELECT * FROM product_type;


INSERT INTO product VALUES
(1, 'Grandview', 'Allen Edmonds', 'Classic broguing adds texture to a charming longwing derby crafted in America from lustrous leather'),
(1, 'Clarkston', 'Allen Edmonds', 'Sharp broguing touches up a charming, American-made derby fashioned from finely textured leather'),
(1, 'Derby', 'John Varvatos', 'Leather upper, manmade sole'),
(1, 'Ramsey', 'Johnston & Murphy', 'Leather upper, manmade sole'),
(1, 'Hollis', 'Johnston & Murphy', 'Leather upper, manmade sole'),
(2, 'Venetian Loafer', 'Mezlan', 'Suede upper, leather sole'),
(2, 'Malek', 'Johnston & Murphy', 'Contrast insets at the toe and sides bring updated attitude to a retro-inspired sneaker set on a sporty foam sole and triangle-lugged tread.'),
(3, 'Air Max 270 React', 'Nike', 'The reggae inspired Nike Air 270 React fuses forest green with shades of tan to reveal your righteous spirit'),
(3, 'Joyride', 'Nike', 'Tiny foam beads underfoot conform to your foot for cushioning that stands up to your mileage'),
(2, 'Air Force 1', 'Nike', 'A modern take on the icon that blends classic style and fresh, crisp details'),
(3, 'Ghost 12', 'Brooks', 'Just know that it still strikes a just-right balance of DNA LOFT softness and BioMoGo DNA responsiveness'),
(3, 'Revel 3', 'Brooks', 'Style to spare, now even softer.'),
(3, 'Glycerin 17', 'Brooks', 'A plush fit and super soft transitions make every stride luxurious');


ALTER TABLE customer ALTER COLUMN zip TYPE INTEGER;

INSERT INTO customer (first_name, last_name, email, company, street, city, state, zip, phone, birth_date, sex, date_entered) VALUES 
('Matthew', 'Martinez', 'matthewmartinez@ge.com', 'GE', '602 Main Place', 'Fontana', 'CA', '92336', '117-997-7764', '1931-09-04', 'M', '2015-01-01 22:39:28'), 
('Melissa', 'Moore', 'melissamoore@aramark.com', 'Aramark', '463 Park Rd', 'Lakewood', 'NJ', '08701', '269-720-7259', '1967-08-27', 'M', '2017-10-20 21:59:29'), 
('Melissa', 'Brown', 'melissabrown@verizon.com', 'Verizon', '712 View Ave', 'Houston', 'TX', '77084', '280-570-5166', '1948-06-14', 'F', '2016-07-16 12:26:45'), 
('Jennifer', 'Thomas', 'jenniferthomas@aramark.com', 'Aramark', '231 Elm St', 'Mission', 'TX', '78572', '976-147-9254', '1998-03-14', 'F', '2018-01-08 09:27:55'), 
('Stephanie', 'Martinez', 'stephaniemartinez@albertsons.com', 'Albertsons', '386 Second St', 'Lakewood', 'NJ', '08701', '820-131-6053', '1998-01-24', 'M', '2016-06-18 13:27:34'), 
('Daniel', 'Williams', 'danielwilliams@tjx.com', 'TJX', '107 Pine St', 'Katy', 'TX', '77449', '744-906-9837', '1985-07-20', 'F', '2015-07-03 10:40:18'), 
('Lauren', 'Anderson', 'laurenanderson@pepsi.com', 'Pepsi', '13 Maple Ave', 'Riverside', 'CA', '92503', '747-993-2446', '1973-09-09', 'F', '2018-02-01 16:43:51'), 
('Michael', 'Jackson', 'michaeljackson@disney.com', 'Disney', '818 Pine Ave', 'Mission', 'TX', '78572', '126-423-3144', '1951-03-03', 'F', '2017-04-02 21:57:36'), 
('Ashley', 'Johnson', 'ashleyjohnson@boeing.com', 'Boeing', '874 Oak Ave', 'Pacoima', 'CA', '91331', '127-475-1658', '1937-05-10', 'F', '2015-01-04 08:58:56'), 
('Brittany', 'Thomas', 'brittanythomas@walmart.com', 'Walmart', '187 Maple Ave', 'Brownsville', 'TX', '78521', '447-788-4913', '1986-10-22', 'F', '2018-05-23 08:04:32'), 
('Matthew', 'Smith', 'matthewsmith@ups.com', 'UPS', '123 Lake St', 'Brownsville', 'TX', '78521', '961-108-3758', '1950-06-16', 'F', '2018-03-15 10:08:54'), 
('Lauren', 'Wilson', 'laurenwilson@target.com', 'Target', '942 Fifth Ave', 'Mission', 'TX', '78572', '475-578-8519', '1965-12-26', 'M', '2017-07-16 11:01:01'), 
('Justin', 'Smith', 'justinsmith@boeing.com', 'Boeing', '844 Lake Ave', 'Lawrenceville', 'GA', '30044', '671-957-1492', '1956-03-16', 'F', '2017-10-07 10:50:08'), 
('Jessica', 'Garcia', 'jessicagarcia@toyota.com', 'Toyota', '123 Pine Place', 'Fontana', 'CA', '92336', '744-647-2359', '1996-08-05', 'F', '2016-09-14 12:33:05'), 
('Matthew', 'Jackson', 'matthewjackson@bp.com', 'BP', '538 Cedar Ave', 'Katy', 'TX', '77449', '363-430-1813', '1966-02-26', 'F', '2016-05-01 19:25:17'), 
('Stephanie', 'Thomas', 'stephaniethomas@apple.com', 'Apple', '804 Fourth Place', 'Brownsville', 'TX', '78521', '869-582-9955', '1988-08-26', 'F', '2018-10-21 22:01:57'), 
('Jessica', 'Jackson', 'jessicajackson@aramark.com', 'Aramark', '235 Pine Place', 'Chicago', 'IL', '60629', '587-334-1054', '1991-07-22', 'F', '2015-08-28 03:11:35'), 
('James', 'Martinez', 'jamesmartinez@kroger.com', 'Kroger', '831 Oak St', 'Brownsville', 'TX', '78521', '381-428-3119', '1927-12-22', 'F', '2018-01-27 07:41:48'), 
('Christopher', 'Robinson', 'christopherrobinson@ibm.com', 'IBM', '754 Cedar St', 'Pharr', 'TX', '78577', '488-694-7677', '1932-06-25', 'F', '2016-08-19 16:11:31');
