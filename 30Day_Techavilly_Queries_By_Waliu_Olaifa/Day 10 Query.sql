Use Superstore;

/**
QUESTION 10:
The Director of Analytics has requested a detailed analysis of the Briggs Company. 
To fulfill this request, he needs you to generate a table that displays the profit margin of "each segment". 
The table should include the segments, total sales, total profit and the profit margin. 
To ensure accuracy, the profit margin should be arranged in descending order.
**/
SELECT
    Segment,
    ROUND(SUM(Sales), 0) AS TotalSales,
    ROUND(SUM(Profit), 0) AS TotalProfit,
    CONCAT(ROUND(((SUM(Profit) / SUM(Sales)) * 100 ), 0), '%')    AS 'ProfitMargin (%)'

FROM Orders

GROUP BY Segment
ORDER BY 'ProfitMargin (%)' DESC;
