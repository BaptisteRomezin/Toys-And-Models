#nom et code des produits dont le stock est superieur à 5 fois le nombre d'achats.
#Surplus de stock

CREATE VIEW stocks AS (SELECT SUM(quantityOrdered) AS commandes,od.productcode,p.quantityInStock,p.productname,
min(orderdate) AS premierecommande,max(orderdate) AS dernierecommande
 FROM orderdetails AS od
INNER JOIN products AS p
ON p.productCode=od.productCode
INNER JOIN orders AS o
ON o.ordernumber=od.ordernumber
GROUP BY od.productCode
HAVING 5*commandes<quantityInStock
ORDER BY commandes);


SELECT * FROM stocks;

