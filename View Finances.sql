CREATE VIEW Finances AS(
	WITH sommes AS (
		SELECT sum(od.quantityOrdered*od.priceEach) AS TotalCommande,
			o.customerNumber,
			o.orderNumber,
			o.orderdate 
		FROM orders AS o
			INNER JOIN orderdetails AS od
				ON od.orderNumber=o.orderNumber
		GROUP BY od.orderNumber
		ORDER BY o.customerNumber,orderdate,orderlinenumber)
	SELECT s.customernumber,
		c.customerName,
		c.phone,
		s.ordernumber, 
		s.orderdate,
		s.TotalCommande
	FROM sommes AS s
		INNER JOIN customers AS c
			ON c.customerNumber=s.customerNumber
		LEFT JOIN payments AS p
			ON p.amount=s.TotalCommande
	WHERE p.checknumber IS NULL);



