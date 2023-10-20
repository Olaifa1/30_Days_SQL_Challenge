use [Pizza Data];

/**
QUESTION 2: Using the Pizza Data, write a query to show how many Pizzas were ordered.
**/
Select distinct count (order_id) total_pizzas_ordered
from customer_orders;
