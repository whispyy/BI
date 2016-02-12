/*
Durand JF
Amara Antoine
*/

--
-- requêtes
--


-- requête 1
SELECT designation, SUM(quantite*prix) as CA
	FROM venteView v, produitView p
	WHERE v.idp = p.idp
	GROUP BY designation
	ORDER BY designation;

-- requête 2
SELECT categorie, mois, SUM(quantite*prix) as CA
	FROM venteView v, produitView p, dateView d
	WHERE v.idp = p.idp
	AND v.idd = d.idd
	GROUP BY ROLLUP (categorie,mois);

-- requête 3


-- requête 4
SELECT designation, SUM(quantite) as ca,
	RANK() OVER(PARTITION BY designation ORDER BY SUM(quantite)) as rang
	FROM venteView v, produitView p
	WHERE  v.idp = p.idp and
	rownum between 0 and 3
	GROUP BY designation
	ORDER BY ca DESC;
