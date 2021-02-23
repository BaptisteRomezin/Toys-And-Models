CREATE VIEW Finances2 AS (SELECT c.country, SUM(amount) AS turnover 
FROM payments AS p
INNER JOIN customers AS c
ON c.customerNumber=p.customerNumber
WHERE p.paymentDate 
	BETWEEN (NOW() - INTERVAL 2 MONTH) AND NOW()
GROUP BY c.country
ORDER BY turnover DESC);

