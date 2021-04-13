use sql_store;


#1.From sql_store database, show following data: full name, phone number. 
#Full name should be one column. If there is no phone number record, show “Unknown”.
select concat(first_name, " ",  last_name) as full_name, 
	case 
		when phone is null then 'Unknown' else phone 
        end 
			as phone 
from customers;

#2. From sql_store database, show following: product id, product name, how many times
#this product was ordered, extra column called “frequency” – show Once if the product
#was ordered once, show “Many times” if the product was ordered more than once.
select p.product_id, p.name as product_name, count(*) as orders_amount,
	case 
		when count(*) = 1 then 'Once' 
        when count(*) > 1 then 'Many times'
        end 
			as frequency
from products p
join order_items oi on p.product_id = oi.product_id
group by product_id, name;


#3. From sql_store, query following data: customer_id, full name, points, extra column
#called “customer class” – this is determined by the points: “bronze” class is for
#customers with less than 2000 points. “Gold” class is for more than 3000 points. In
#between is “silver” class.
select customer_id, concat(first_name, " ",  last_name) as full_name, points, 
	case 
		when points < 2000 then 'bronze'
		when points >= 2000 and points <= 3000 then 'silver'
        when points > 3000 then 'gold'
	end
		as customer_class
from customers
group by customer_id asc;

#4. In sql_invoicing DB, create a view showing all the records of invoices with balance (they
#are not completely paid yet). Questions: Could we use this view to delete and update
#records? Could we use it to insert new records?
use sql_invoicing;

select * from invoices;

create or replace view balanced_invoices as 
	select * from invoices 
		where payment_total > 0;

#We cannot insert new records in views and we cannot update records with views.

#5. Create a view called “clients_balance” in sql_invoicing. It should contain following data: client_id, name, invoices balance. 
#Balance is the difference between all the invoices o a client and what was she/he already paid. 
#Thus, data for each client are shown in only 1 record.
create or replace view clients_balance as 
	select c.client_id, c.name, sum(i.invoice_total - i.payment_total) as balance
	from clients c
        join invoices i on c.client_id = i.client_id
group by client_id, name;


#6. In sql_store, create a stored function that takes a INT parameter “points” and return VARCHAR(20) “customerLevel”. 
#Less than 1000 points … “Silver”, more than 2000 points … “Platinum”. In between … “Gold”. Thus, this function can be applied 
#on customers to find their customerLevel.
use sql_store;

delimiter $$
create function CustomerLevel(
	points int(11)
)
returns varchar(20)
deterministic
begin 
	declare customerLevel varchar(20);
    
    if points > 2000 then 
		set customerLevel = 'PLATINUM';
	elseif (points <= 2000 and 
		points >= 1000) then
        set customerLevel = 'GOLD';
	elseif points < 1000 then
		set cutomerLevel = 'SILVER';
	end if;
    return (customerLevel);
end $$

delimiter ; 


#7. Create a stored procedure in sql_store. It should simply show all customers records and
#an extra column called “Customer Level”.
use sql_store;

delimiter $$

drop procedure if exists get_customer_level;

create procedure get_customer_level()
begin
    	select 
			*,
			CustomerLevel(points) AS level
 	from customers;
end $$

delimiter ;

#8. In sql_invoicing, create a custom function that takes an INT parameter “client_id” and returns INT average invoice.
#If the result is NULL,it should return 0. This function can be applied on the invoices table to calculate the average 
#invoice for a given client.	
-- function: get avg invoice for a given client

use sql_invoicing;

delimiter $$

drop function if exists get_avg_invoice;

create function get_avg_invoice
(
	client_id int
)
	returns integer
	reads sql data

	begin
		declare sum_invoices decimal(9,2) default 0;	-- declare a variable
        declare count_invoices int;						-- declare a variable
        declare avg_invoice decimal(9,2);				-- declare a variable

		select
			sum(invoice_total),
            count(*)
        into
			sum_invoices,
			count_invoices
        from invoices i
        where i.client_id = client_id;

		SET avg_invoice = sum_invoices/count_invoices;

		return IFNULL(avg_invoice,0);

	end $$

delimiter ;

#9. In sql_invoicing, create a simple stored procedure with CHAR(2) input parameter “state” that returns clients records 
#for given state from the clients table. But if the input is null, it should return all the records from the clients table.
DELIMITER $$
DROP PROCEDURE IF EXISTS get_clients_by_state;
CREATE PROCEDURE get_clients_by_state (state CHAR(2))
	BEGIN 
		SELECT * FROM clients c
		WHERE c.state = IFNULL(state, c.state);
	END $$
DELIMITER ;

CALL get_clients_by_state ('DS');
CALL get_clients_by_state (NULL);

	
#10. In the sql_invoicing, create a stored procedure that executes a payment. 
#It takes these parameters: invoiceId, payment amount, payment date. 
#First look at the ERD and understand how the tables are connected 
#in order to avoid data inconsistency. Decide how to implement the task. 
#There are different options.
delimiter $$
drop procedure if exists make_payment;
create procedure make_payment
(
	invoiceId int,
    payment_amount decimal(9,2),
    paymentDate DATE
)
	begin
	    declare clientId int;
		-- data validation
        IF payment_amount <= 0 THEN
			SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid payment amount';
        END IF;

    select client_id
    into clientId
    from invoices i
    where i.invoice_id = invoiceId;

    INSERT INTO payments (client_id, invoice_id, date, amount, payment_method) VALUES (clientId,invoiceId,paymentDate,payment_amount,1);

    update invoices i
    set i.payment_total = i.payment_total + payment_amount,
        i.payment_date  = paymentDate
    where i.invoice_id = invoiceId;
    
    end $$
delimiter ;

call make_payment(2, 1000.00, '2020-03-30');

#11. Create a trigger for payments table in sql_invoicing. It should do this: If a record is deleted in payments table 
#then invoices.payment_total should be corrected.
delimiter $$

drop trigger if exists payments_after_delete;

create trigger payments_after_delete
	after delete on payments
	for each row
	begin
		update invoices
        set payment_total = payment_total - OLD.amount
        where invoice_id = OLD.invoice_id;
        
        insert into payments_audit
        values (OLD.client_id, OLD.date, OLD.amount, 'delete', NOW());
	end $$

delimiter ;


#12 Create an audit table in the sql_invoicing database. We want to log changes made in payments table. We want to show data like this:
CREATE TABLE payments_audit
(
	client_id 		INT 			NOT NULL, 
    date 			DATE 			NOT NULL,
    amount 			DECIMAL(9, 2) 	NOT NULL,
    action_type 	VARCHAR(50) 	NOT NULL,
    action_date 	DATETIME 		NOT NULL
)
