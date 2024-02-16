use orders_sql

 select  sales.orders.order_id,concat(sales.customers.first_name,' ',sales.customers.last_name) as customer_name,sales.customers.city as city_cust,sales.customers.state as state_cust,order_date,required_date,product_name,category_name,store_name,sales.stores.city as city_store,sales.stores.state as state_store,concat(sales.staffs.first_name,' ',sales.staffs.last_name) as sales_name,round((quantity*sales.order_items.list_price-sales.order_items.list_price*discount),0) as revenue,quantity
 from sales.orders
 inner join sales.customers on sales.orders.customer_id = sales.customers.customer_id
 inner join sales.order_items on sales.order_items.order_id = sales.orders.order_id
 inner join sales.stores on sales.stores.store_id=sales.orders.store_id
 inner join production.products on sales.order_items.product_id = production.products.product_id
 inner join production.categories on production.categories.category_id = production.products.category_id
 inner join sales.staffs on sales.staffs.staff_id = sales.orders.staff_id
 order by order_id
