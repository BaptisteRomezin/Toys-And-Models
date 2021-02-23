CREATE VIEW ClientsFideles AS (
	SELECT count(o.ordernumber) AS nombredecommandes,
		c.customernumber,
		c.customerName,
		max(o.orderdate) as dernierecommande
	FROM customers AS c
		INNER JOIN orders AS o
			ON o.customerNumber=c.customerNumber
	GROUP BY customerNumber
	ORDER BY nombredecommandes DESC);

SELECT * FROM clientsfideles
WHERE nombredecommandes >=10
;

