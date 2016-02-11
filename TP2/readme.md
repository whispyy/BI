# TP2 - BI

**Amara Antoine & Durand Jean-Frédéric**

## Etats des besoins

### Selection des questions

**Questions sélectionnées pour reformulation**

1. Quels sont les produits les plus vendus, selon leurs désignations et catégories ?
2. On s'intéresse aux caractéristiques des clients, pour analyser ce qu'ils achètent en fonction de leur âge, de leur groupe d'âge et de leur sexe.
3. Quels sont les chiffres d'affaire en fonction des jours, semaines et années... etc
4. Y'a t'il une relation entre le temps, l'espace et la vente de produits ?
(Très male formulée)
5. Quels sont les trois produits les plus vendus en général, et par catégorie ? 
6. Quels sont les produits qui contribuent à moins de 0.05% du CA pour un pays/une année donné(e)
7. Quels sont les produits qui sont achetés ensemble ? Par exemple afin de les rendre plus proche sur le site de vente ?
8. Quelle est la tendance des ventes pour l'année à venir ? (A reformuler, ne peut être traitée entièrement)
9. Est-ce que les remises font augmenter les ventes ? 

**Questions abandonnées**

- Est ce qu'il existe une relation entre les chiffres d'affaires, les mois de l'année et les sexese des acheteurs.
  - Questions abandonnée car similaire a la question 3.
- Combien se classerait dans le top des ventes toutes catégories confondues un produit vendu à 50 exemplaires.
  - Question complétement incohérente.
- Est ce que les produits peuvent être remisés ?
  - N'est pas de l'ordre du décisionnel, mais opérationnel.

### Reformulation des questions

1. Quels sont les produits les plus vendus, selon leurs désignations et catégories ?
2. Quels sont les produits les plus vendus, en fonction des caractéristiques clients (age, groupe d'age et sexe) ?
3. Quels sont les chiffres d'affaire en fonction du temps (jours, semaines et années) ?
4. Quels sont les produits les plus vendus en fonctions du temps et de la localité (du client) ?
5. Quels sont les trois produits les plus vendus en général, et par catégorie ?
6. Quels sont les produits qui contribuent à moins de 0.05% du CA pour un pays ou une année donnée ?
7. Quels sont les produits acheté au même moment ?
8. Quel est l'évolution du chiffre d'affaire par produit selon une période donnée ?
9. Est-ce que les remises font augmenter le chiffre d'affaire et le nombre de vente par produit.

## Modélisation dimensionnelle

__Table de fait :__ Une ligne de vente (appelé VENTE).

 - attributs : quantité, remise, prix

__Les dimensions :__

 - Produit
  - attributs : idp, designation, catégorie, sousCategorie.
 - Client
  - attributs : idc, age, tranche_age, sexe, nom, prenom, adresse
 - Date
  - attributs : idd, jours, mois, trimestre, semestre, année
 - Localité (correspond à la localité du Client)
  - attributs : idl, ville, pays

__Hierarchie :__ 

Une hierarchie possible serait de créer une hierarchie pour la catégorie d'un produit (famille de produit, sous-famille de produit, .. etc)

On pourrait également créer une hierarchie pour le groupe d'age du client regroupant par tranche d'age les clients.

On pourrait aussi créer une hierarchie achat pour la dimension localité dans l'objectif de récupérer un achat par ville ou par Pays.

## Implémentation et alimentation

1. On va rafraichir les produits en fast on commit, c'est à dire qu'a chaque ajout ou évolution d'un produit on va incrémenter la vue concernant le produit à l'aide d'un log.
_justification_ : On considère l'ajout ou modification d'un produit moins fréquent que le reste des données. En conséquence on se permet de les transférer de suite dans la base décisionnel.

Les autres dimensions et la table de fait sont définit en force on demand. C'est-à-dire que les vues seront rafraichient complètement une fois par nuit. 

_justification_ : Les tables étant conséquentes et rafraichient de manière fixe. Le système incrémental serait lourd en cout de stockage pour le fichier log.

2. Les clés primaires sont : 
	- idp : code du produit
	- idc : code du client
	- idl : contactenation code postale + ville
	- idd : code de prix_date

Les clés étrangères sont : 
	- idp entre venteView et produitView
  - idc entre venteView et clientView
  - idl entre venteView et localiteView
  - idd entre venteView et dateView

5.