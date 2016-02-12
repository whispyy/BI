/*
Durand JF
Amara Antoine
*/

--
-- requêtes
--


-- requête 1
SELECT designation, SUM(qte*prix) as CA
	FROM venteView v, produitView p
	WHERE v.idp = p.idp
	GROUP BY designation
	ORDER BY designation;

-- requête 2
SELECT categorie, mois, SUM(qte*prix) as CA
	FROM venteView v, produitView p, dateView d
	WHERE v.idp = p.idp
	AND v.idd = d.idd
	GROUP BY ROLLUP (categorie,mois);

-- requête 3


-- requête 4
SELECT designation, SUM(QTE) as ca,
	RANK() OVER(PARTITION BY designation ORDER BY SUM(QTE)) as rang
	FROM venteView v, produitView p
	WHERE  v.idp = p.idp
	GROUP BY designation
	ORDER BY ca DESC;