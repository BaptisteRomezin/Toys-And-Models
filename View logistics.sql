CREATE VIEW Logistics AS SELECT p.productCode AS CodeProduit,
p.productName AS NomProduit,
p.quantityInStock AS QuantiteEnStock, 
SUM(od.quantityOrdered) As NombreVendu
FROM products p
INNER JOIN orderdetails od
ON p.productCode=od.productCode
INNER JOIN orders o 
ON o.orderNumber=od.orderNumber
GROUP BY p.productCode
ORDER BY SUM(od.quantityOrdered) DESC LIMIT 5;

SELECT * FROM Logistics; 


