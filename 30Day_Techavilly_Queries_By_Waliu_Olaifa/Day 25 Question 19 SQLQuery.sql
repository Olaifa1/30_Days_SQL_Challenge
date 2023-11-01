USE Superstore

/**
DAY 25 (QUESTION 19):
Your company received a lot of bad reviews about some of your products lately and the management
wants to see which products they are and how many have been returned so far. Using the Orders and returns table,
write a query to see the top 5 most returned products from the company.
**/
SELECT TOP 5 Product_Name, Product_ID, 
		COUNT(Returned) AS Product_count
FROM Orders r
JOIN Returns re ON r.Order_ID = re.Order_ID
GROUP BY Product_Name, Product_ID
ORDER BY Product_count DESC