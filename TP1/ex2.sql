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
-- a revoir
select annee, cl_r, category, avg(qte*pu) as ca_moyen
	from ventes v
		natural join produits 
		natural join temps 
		inner join clients c
			on (c.cl_id = v.cid)
	where annee = 2010 or annee = 2009
	group by  annee, rollup(cl_r, category);

-- Q3
DROP VIEW classementVente;
create view classementVente as
select annee, category, pname, RANK()
	over (partition by annee, category order by sum(pu*qte) DESC) as rang
	from ventes v
		natural join produits
		natural join temps 
		inner join clients c
			on (c.cl_id = v.cid)
	group by annee, category, pname;

select annee, category, pname
	from classementVente
	where rang = 1;

-- Q4
select annee, category, sum(pu*qte) as ca
	from ventes v
		natural join produits
		natural join temps
		inner join clients c
			on (c.cl_id = v.cid)
	having grouping_id(annee,category) < 2
	group by cube(annee, category);

-- Q5
DROP VIEW MeilleurVenteSirop;
create view MeilleurVenteSirop as
select annee, mois, sum(qte*pu) as ca, rank()
	over (order by sum(qte*pu) desc) as rang
	from ventes v
		natural join produits
		natural join temps
		inner join clients c
			on (c.cl_id = v.cid)
	where pname = 'Sirop d érable'
	group by rollup (annee, mois);

select annee,mois,ca
	from MeilleurVenteSirop
	where mois is not null and rownum between 0 and 2;

-- Q6
select annee, category, cl_name, sum(pu*qte) as ca
	from ventes v
		natural join produits
		natural join temps 
		inner join clients c
			on (c.cl_id = v.cid)
	group by annee, grouping sets (category, cl_name);

-- Q7
select category, sum(qte) as qte_vendues_2010, ntile(3) over (order by sum(qte) desc) as tiers
	from ventes v
		natural join produits
		natural join temps 
		inner join clients c
			on (c.cl_id = v.cid)
	where annee = 2010
	group by category;

-- Q8
select category, mois, sum(jour) as jour1, sum(jour)+5 as jour5 
-- , sum() as qte_5_jours
	from ventes v
		natural join produits
		natural join temps 
		inner join clients c
			on (c.cl_id = v.cid)
		where annee = 2010 and jour < 5
		group by category, mois
		order by mois;
