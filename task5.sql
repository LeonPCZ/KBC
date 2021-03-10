--task 5

SELECT 
    CAST((select SUM(volume) from sales WHERE currency = "EUR") as FLOAT) / CAST(SUM(s.volume) as FLOAT) * 100
FROM sales s


