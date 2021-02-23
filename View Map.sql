CREATE VIEW map AS (SELECT SUM(amount) AS turnover,
	ci.countryname AS pays,
	ci.cityname AS ville,
	ci.latitude AS latitude,
	ci.longitude AS longitude 
FROM cities AS ci
	INNER JOIN customers AS c
		ON c.city=ci.cityname
		AND c.country=ci.countryname
	INNER JOIN payments AS p
		ON p.customerNumber=c.customernumber
GROUP BY ci.cityname
ORDER BY ci.countryname,ci.cityname);

SELECT * FROM map;