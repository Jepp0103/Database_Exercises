#DB exercises lecture 5

select * from customers;

#1. Query customers (all columns) whose address contains ‘trail’ or ‘avenue’ and first name
#starts with ‘D’ in ascending order of the first name.
select * from customers 
	where (address like '%trail%' or address like '%avenue%') and first_name like 'D%'
    order by first_name asc;

#2. Query customers (all columns) who did not fill their phone number (in ascending order).
#Implement pagination – a page contains 50 records. Show the records for the third
#page.
select * from customers 
	where phone is null
    order by phone asc
    LIMIT 99,50; #first is offset and the second is the size of the page


#3. Give chosen customers a 100 points bonus. Requirement for the bonus is: Customers
#must be born between 1. January 1970 and 1. January 1990. And they must live in a city
#which starts with ‘C’. And they must have registered their phone number.


#4. From sql_store database, query customer_id, last name, order_id, order status, shipper
#name. We want to only see all records with customers that have placed at least 1 order.
SELECT c.customer_id, c.last_name, o.order_id, os.name, s.name
	FROM customers c
	JOIN orders o
	USING (customer_id)
	JOIN order_statuses os on os.order_status_id = o.status
	LEFT JOIN shippers s
	using (shipper_id)
	order by customer_id;



#5. Query data from sql_hr database. First generate the ERD. Show employee id, last name,
#job title and an extra column called Manager where you show the last name of the
#employees’ manager.
	


#6. Query data from sql_invoicing database. First generate the ERD of the database to gain
#the better understanding of the database structure. We want to show following
#information: payment id, payment date, payment, invoice id, invoice total payment,
#client name, payment method. We want to see the records for all payments.



#7. Look at the sql_store ERD. Identify tables where data inconsistency can appear. Try to
#insert some inconsistent data. Fix the ERD and synchronize the database with the
#changed ERD. You might have to delete the inconsistent records first before you can
#synchronize. Now confirm that you cannot anymore put the inconsistent data (for
#example non-existing IDs from a related table).
#3


#8. After completing task 7, try to query all the orders that contain an item that has a note. Show following data: order_id, product_id, quantity, unit_price, total price, order status, product name, note text.
#9. On Fronter in the source_code/mysql/for lecture 5/mysql_hr there is a sql file for generating a sample mysql_hr database. The file is not generating the foreign keys properly. After you create the database open the ERD file where the relations are fixed. Then you need to synchronize this ERD with the database. There are exercises for this database here: https://www.w3resource.com/mysql-exercises/
#10. On Fronter in the source_code/mysql/for lecture 5/northwind there is a sql file for generating a sample northwind database. There is another file containing the ERD of that database. You can either execute the sql file or you can open the ERD file in the MySQL Workbench and forward engineer the database from the ERD. Look at the diagram and try query some data out of it. You can use it for your training as it provides a good level of complexity.
#11. From sql_store, query products that have never been ordered.
#12. From sql_store, query all the info about orders and add an extra column “status” which will say “active” for the orders that are not older than one year. Otherwise it will say “archived”.
#13. From sql_invoicing you want to query following: highest invoice, lowest invoice, average invoice, sum of the invoices, number of invoices, number of paid invoices, number of clients.
#14. Query payment date, payment method and sum of payments – based on date and payment method - from sql_invoicing database, payment table.
#15. From sql_invoicing query 2 columns: payment method, payment sum for that payment method. Add an extra row which will show the sum of all the payments. Something like this:
#4
#16. Query this from sql_invoicing database:
#(Numbers can be different in your database, that is fine).