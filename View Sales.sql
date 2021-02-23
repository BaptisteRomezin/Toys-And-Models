CREATE VIEW Sales AS (WITH passee AS 
	(SELECT
		max(o.orderdate) AS date,
		YEAR(o.orderdate) AS annee,
		MONTH(o.orderdate) as mois,
		p.productline AS categorie,
		SUM(od.quantityOrdered) AS quantite
	FROM orderdetails AS od
		INNER JOIN orders AS o
			ON o.orderNumber=od.orderNumber
		INNER JOIN products AS p
			ON od.productCode=p.productCode
	GROUP BY mois, annee,categorie
	ORDER BY  annee,mois,categorie),
courante AS 
	(SELECT 
		max(o.orderdate) AS date,
		YEAR(o.orderdate) AS annee,
		MONTH(o.orderdate) AS mois,
		p.productline AS categorie,
		SUM(od.quantityOrdered) AS quantite
	FROM orderdetails AS od
		INNER JOIN orders AS o
			ON o.orderNumber=od.orderNumber
		INNER JOIN products AS p
			ON od.productCode=p.productCode
	GROUP BY mois, annee,categorie
	ORDER BY annee,mois,categorie)
SELECT
	courante.date AS date,
	courante.categorie AS Catégorie,
    courante.annee AS AnnéeEnCours,
    courante.mois AS MoisEnCours,
    courante.quantite AS QuantitéVendue,
	passee.annee AS AnnéePrécédente,
	passee.quantite AS QuantitéAnnéePrécédente,
	100*(courante.quantite-passee.quantite)/passee.quantite AS RateOfChange
FROM passee
	RIGHT JOIN  courante
		ON passee.categorie=courante.categorie
		AND passee.mois=courante.mois
		AND passee.annee=courante.annee-1
ORDER BY AnnéeEnCours, MoisEnCours);    