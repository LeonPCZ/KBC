-- task4

SELECT
    c.COMPANY_NAME,
    s.SALES_DATE,
    p.PRODUCT_NAME,
    p.product_code,
    sum(s.volume) as sum_volume

FROM sales s

INNER JOIN company AS c ON c.company_number == s.COMPANY_CODE
INNER JOIN (
  SELECT
    sum(s.VOLUME) as sum_vol,
    p.PRODUCT_CODE as product_code,
    p.product_name as product_name
  From products p
  LEFT JOIN sales as s on s.product_code == p.product_code
) AS p ON s.product_code == p.product_code

where p.sum_vol != 0