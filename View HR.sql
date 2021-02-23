CREATE VIEW HR AS (
SELECT salesRepEmployeeNumber,
e.lastname, 
e.firstName, 
sum(amount) AS turnover FROM employees AS e
INNER JOIN customers AS c
ON e.employeeNumber=c.salesRepEmployeeNumber
INNER JOIN payments AS p
ON p.customerNumber=c.customerNumber
WHERE MONTH(paymentdate)=MONTH(now())
GROUP BY salesRepEmployeeNumber, DATE_FORMAT(paymentdate, '%Y %m')
ORDER BY SUM(amount) DESC LIMIT 2);

SELECT * FROM HR;
