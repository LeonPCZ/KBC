-- task 1

SELECT DISTINCT
    c.company_name,
    c.company_number,
    p.product_code
    
FROM company c

INNER JOIN bridge AS b ON b.company_code == c.company_number
INNER JOIN products AS p ON p.product_code == b.product_code

WHERE
    p.end_date is NULL OR p.end_date > DATE()
    
ORDER BY company_name;