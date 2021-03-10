-- task2

SELECT
    c.company_number,
    c.company_name,
    p.product_code,
	
	CASE
		WHEN (SELECT COUNT(*) from sales where product_code = p.product_code) = 0 THEN "No sells"
        WHEN (SELECT SUM(volume) from sales where product_code = p.product_code) <= 4000 THEN "Lows sells"
        WHEN (SELECT SUM(volume) from sales where product_code = p.product_code) BETWEEN 4001 and 200000 THEN "Medium sells"
        WHEN (SELECT SUM(volume) from sales where product_code = p.product_code) > 200000 THEN "Hign sells"
    END as sells  

from company c

INNER JOIN bridge as b ON b.company_code == c.company_number
INNER JOIN products AS p ON p.product_code == b.product_code

WHERE
    (p.END_DATE is NULL AND b.END_DATE is NULL) OR 
    (p.END_DATE > Date() and b.END_DATE > Date())