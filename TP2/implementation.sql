/*
Durand JF
Amara Antoine
*/

DROP dimension produitDimension;
DROP dimension clientDimension;
DROP dimension dateDimension;
DROP dimension localiteDimension;

DROP materialized view venteView;

DROP materialized view log on produit;
DROP materialized view produitView;
DROP materialized view clientView;
DROP materialized view localiteView;
DROP materialized view dateView;

--
-- vues matérialisées
--

--vue produit
CREATE materialized view log on Produit;

CREATE materialized view produitView
BUILD immediate
Refresh fast on commit
Enable query rewrite as
Select Num as idp,
	regexp_substr(designation, '[^.]*', 1, 1) as designation, 
	regexp_substr(designation, '[^.]*', 1, 3) as categorie, 
	regexp_substr(designation, '[^.]*', 1, 5) as sous_categorie 
	from Produit;


-- vue client
CREATE materialized view clientView
BUILD immediate
Refresh force on demand as
Select Num as idc, Nom, Prenom, Sexe, Adresse, FLOOR(months_between(sysdate,date_nais)/12) as age,
CASE
	when FLOOR(months_between(sysdate,date_nais)/12) < 30 then '<30 ans'
	when FLOOR(months_between(sysdate,date_nais)/12) between 30 and 45 then '30-45 ans'
	when FLOOR(months_between(sysdate,date_nais)/12) between 46 and 60 then '46-60 ans'
	when FLOOR(months_between(sysdate,date_nais)/12) > 60 then '>60 ans'
END as tranche_age
from Client;

--vue localite
CREATE materialized view localiteView
BUILD immediate
Refresh force on demand as
Select distinct concat(regexp_substr(adresse, '[^,]*',1,5), regexp_substr(adresse, '[^,]*',1,3)) as idl, regexp_substr(adresse, '[^,]*',1,5) as ville, regexp_substr(adresse, '[^,]*',1,7) as pays
from Client;

--vue date
CREATE materialized view dateView
BUILD immediate
Refresh force on demand as
Select distinct Num as idd, TO_CHAR(date_etabli, 'DDD') as jour, TO_CHAR(date_etabli, 'MM') as mois,
CASE
	when TO_CHAR(date_etabli, 'MM') < 4 then '1'
	when TO_CHAR(date_etabli, 'MM') between 4 and 6 then '2'
	when TO_CHAR(date_etabli, 'MM') between 7 and 9 then '3'
	when TO_CHAR(date_etabli, 'MM') > 9 then '4'
END as trimestre,
CASE
	when TO_CHAR(date_etabli, 'MM') <= 6 then '1'
	when TO_CHAR(date_etabli, 'MM') > 6 then '2'
END as semestre,
 TO_CHAR(date_etabli,'YYYY') as annee
from Facture;

-- vue vente
CREATE materialized view venteView
BUILD immediate
Refresh force on demand as
select distinct 
	p.num as idp, 
	c.num as idc,
	concat(regexp_substr(adresse, '[^,]*',1,5), regexp_substr(adresse, '[^,]*',1,3)) as idl,
	f.num as idd, 
	lf.qte as quantite, 
	pd.prix as prix, 
	pd.remise as remise
	from ligne_facture lf, prix_date pd, facture f, client c, produit p
	where lf.facture = f.num and
		  f.client = c.num and
		  lf.produit = p.num; 


-- 
-- clés primaire & étrangères
--

-- clés primaires
/*ALTER materialized view produitView add constraint pk_idp PRIMARY KEY (idp);*/
ALTER materialized view clientView add constraint pk_idc PRIMARY KEY (idc);
ALTER materialized view localiteView add constraint pk_idl PRIMARY KEY (idl);
ALTER materialized view dateView add constraint pk_idd PRIMARY KEY (idd);


-- clés étrangères
ALTER materialized view venteView add constraint fk_idp FOREIGN KEY (idp) REFERENCES produitView(idp);
ALTER materialized view venteView add constraint fk_idc FOREIGN KEY (idc) REFERENCES clientView(idc);
ALTER materialized view venteView add constraint fk_idl FOREIGN KEY (idl) REFERENCES localiteView(idl);
ALTER materialized view venteView add constraint fk_idd FOREIGN KEY (idd) REFERENCES dateView(idd);

--
-- Dimensions
--

-- dimension produit
CREATE dimension produitDimension
	LEVEL designation IS (produitView.designation)
	LEVEL sousCategorie IS (produitView.sous_categorie) SKIP when null
	LEVEL categorie IS (produitView.categorie)
	HIERARCHY prod_rollup (designation CHILD OF sousCategorie CHILD OF categorie);

-- dimension client
CREATE dimension clientDimension
	LEVEL age IS (clientView.age)
	LEVEL tranche_age IS (clientView.tranche_age)
	HIERARCHY client_rollup(age CHILD OF tranche_age);

-- dimension date
CREATE dimension dateDimension
	LEVEL jour IS (dateView.jour)
	LEVEL mois IS (dateView.mois)
	LEVEL trimestre IS (dateView.trimestre)
	LEVEL semestre IS (dateView.semestre)
	LEVEL annee IS (dateView.annee)
	HIERARCHY temps_rollup(jour CHILD OF mois CHILD OF trimestre CHILD OF semestre CHILD OF annee);

-- dimension localite
CREATE dimension localiteDimension
	LEVEL ville IS (localiteView.ville)
	LEVEL pays IS (localiteView.pays)
	HIERARCHY adresse_rollup(ville CHILD OF pays);