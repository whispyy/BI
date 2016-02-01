-- vues matérialisées

Create materialized view log on Produit;

Create materialized view Produit
Build immediate
Refresh fast on commit
Enable query rewrite as
Select Num as id_produit, Designation, prix from Produit natural join Prix_date;


Create materialized view Client
Build immediate
Refresh complete on demand
Enable query rewrite as
Select Num as id_client, Nom, Prenom, Date_nais as Age, Sexe, Adresse from Client;

Create materialized view Localite
Build immediate
Refresh complete on demand
Enable query rewrite as
Select 