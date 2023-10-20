use [Pizza Data];


/**
QUESTION 3: Using the Pizza Data, 
write a query to show how many succesful orders were delivered by each runner.
**/

SELECT 
	runner_id, COUNT(order_id) AS number_of_successful_orders
FROM runner_orders
WHERE cancellation IS NULL
GROUP BY runner_id;