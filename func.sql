CREATE OR REPLACE FUNCTION function_name() RETURNs void AS
'
--SQL Commands
'
LANGUAGE SQL - Using the SQL language


CREATE OR REPLACE FUNCTION fn_add_ints(int, int) RETURNS int AS
'
SELECT $1 + $2;
'
LANGUAGE SQL;


CREATE OR REPLACE FUNCTION fn_add_ints(int, int) RETURNS int AS
$body$
SELECT $1 + $2;
$body$
LANGUAGE SQL;


CREATE OR REPLACE FUNCTION fn_update_employee_state() RETURNS void AS
$body$
UPDATE sales_person 
SET state='PA'
WHERE state IS NULL
$body$
LANGUAGE SQL;

SELECT fn_update_employee_state();

CREATE OR REPLACE FUNCTION fn_update_employee_state() RETURNS void AS
$body$
UPDATE sales_person 
SET state='PA'
WHERE state IS NULL
$body$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fn_max_product_price() RETURNS void AS
$body$

SELECT MAX (price)
FROM item
$body$
LANGUAGE SQL;

