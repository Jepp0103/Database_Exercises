#1 In sql_store we want to create new order. We have 2 tables for this: orders and order_items 
#(let us ignore the order_item_notes table for simplicity). Simulate 1 order containing 1 item. 
#Test the scenarios that the client connection crashes between the INSERT queries –test this 
#for queries without a transaction and for the queries wrapped in a transaction. Check the results.

START TRANSACTION;

INSERT INTO orders (customer_id, order_date, status)
VALUES (1,  '2020-01-01', 1);

INSERT INTO order_items 
VALUES (last_insert_id(), 1, 2, 2.5);

COMMIT;

#2.Simulate the concurrency: Create 2 sessions in MySQL Workbench. In each of them you want to have a 
#transaction script which will for example give 10 extra points to a customer with id = 1. 
#In one session execute all the lines but without the COMMIT command. 
#Then try to execute the transaction in the second session. What will happen?
START TRANSACTION;
UPDATE customers
SET points = points +10
WHERE customer_id = 1;
COMMIT;

START TRANSACTION;
UPDATE customers
SET points = points +10
WHERE customer_id = 1;
COMMIT;

select * from customers where customer_id = 1;

#3.Simulate what happens with READ UNCOMMITTED isolation level. Use sql_store database. You need 2 sessions. 
#In the first session run a transaction that sets points of the customer with id 1 to 20. But do not execute 
#the commit statement. Now go to the other session and query the points for customer with id 1. Now in the 
#first session execute ROLLBACK.
-- READ UNCOMMITTED simulation: 1st session
-- after running the other script until the rollback statement, run this query - you will read uncommitted data.
set transaction isolation level read uncommitted;
-- we do not have to specify START TRANSACTION because every sql statement is wrapped inside a transaction by default
select points
from customers
where customer_id = 1;

start transaction;
update customers
set points = 20
where customer_id = 1;
ROLLBACK;
-- commit;

