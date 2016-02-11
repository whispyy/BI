-- Durand JF & Amara Antoine

-- ex2

-- Q1
select annee, cl_r, category, avg(qte*pu) as ca_moyen
	from ventes v
		natural join produits 
		natural join temps 
		inner join clients c
			on (c.cl_id = v.cid)
	where annee = 2010 or annee = 2009
	group by rollup (annee, cl_r, category);

-- Q2
select annee, cl_r, category, avg(qte*pu) as ca_moyen
	from ventes v
		natural join produits 
		natural join temps 
		inner join clients c
			on (c.cl_id = v.cid)
	where annee = 2010 or annee = 2009
	group by rollup annee on temps, rollup cl_r on clients, rollup category on produits;