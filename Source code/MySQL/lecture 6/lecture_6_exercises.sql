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






