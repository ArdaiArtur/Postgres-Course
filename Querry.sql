SELECT time_order_taken
FROM sales_order
WHERE time_order_taken BETWEEN '2018-12-01' AND '2018-12-31';


SELECT item_id ,price
FROM item INNER JOIN sales_item
ON item.id=sales_item.id
ORDER BY item_id;

SELECT so.id,si.quantity,i.price,(si.quantity* i.price)AS Total
FROM sales_order AS so
JOIN sales_item AS si
ON si.sales_order_id=so.id
JOIN item AS i
ON i.id=si.item_id
ORDER BY so.id;



SELECT EXTRACT (MONTH FROM birth_date)AS Month,COUNT(*) AS Amount
FROM customer
GROUP BY Month
ORDER BY Month;

SELECT EXTRACT (MONTH FROM birth_date)AS Month,COUNT(*) AS Amount
FROM customer
GROUP BY Month
HAVING COUNT(*)>1
ORDER BY Month;


SELECT SUM(price) AS VALUE ,COUNT(*) AS ITEMS,ROUND(AVG(price),2)AS AVG,

FROM item;


CREATE VIEW purchase_order_overview AS
SELECT sales_order.purchase_order_number, customer.company, 
sales_item.quantity, product.suplier, product.name, item.price
FROM sales_order     -- Join some tables
JOIN sales_item
ON sales_item.sales_order_id = sales_order.id    -- Tables go together by joining on sales order id
-- Any time you join tables you need to find foreign and primary keys that match up
JOIN item
ON item.id = sales_item.item_id    -- Join item as well using matching item id
JOIN customer
ON sales_order.customer_id = customer.id    -- Join customer using customer ids
JOIN product
ON product.id = item.product_id
JOIN sales_person
ON sales_person.id = sales_order.sales_person_id
ORDER BY purchase_order_number;

DROP VIEW purchase_order_overview;













