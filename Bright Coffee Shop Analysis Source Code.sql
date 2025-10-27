-- To check columns names and data types in my data
select Top 10*
from coffee_shops;
-- Checking my categorical columns
Select distinct store_location
from coffee_shops;

select distinct product_category
from coffee_shops;

--To check what time and day the shop opens and closes
select min (transaction_date) AS shop_opening_date,
max (transaction_date) As Last_operating_date
from coffee_shops;

select min (transaction_time) AS shop_opening_time,
from coffee_shops;

select max (transaction_time) AS shop_closing_time,
from coffee_shops;
----------------------------------------------
Select transaction_date, store_location,product_category, product_type,
dayname(transaction_date) AS day_name,
unit_price,
case
when day_name in ('Sun', 'Sat') then 'weekend'
else 'weekday'
end as day_classification,
monthname(transaction_date) as month_name,
case
when transaction_time between '06:00:00' and '11:59:59' then 'morning'
when transaction_time between'12:00:00' and '18:00:00' then 'afternoon'
else 'evening'
end as time_classification,
sum(transaction_qty) as total_units_sold,
count (distinct transaction_id) as number_of_sales,
sum(transaction_qty*unit_price) as total_revenue
from coffee_shops
group by all
order by unit_price desc;
















