use [Pizza Data];


/**
QUESTION 5: Using the Pizza Data, 
write a query to show the number of each type of pizzas that was delivered.
**/

SELECT 
	pn.pizza_name, COUNT(co.order_id) AS pizza_deliveries
FROM runner_orders AS ro
LEFT JOIN customer_orders AS co 
ON ro.order_id = co.order_id
LEFT JOIN pizza_names AS pn
ON co.pizza_id = pn.pizza_id
WHERE ro.cancellation IS NULL
GROUP BY pn.pizza_name;


