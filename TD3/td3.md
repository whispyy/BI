# TD3 Clustering - BI

## Exercice 1 : Calcul de distance

### Question 1

	__d(iris1,iris2)__ = sqrt( ((sl(iris2)-sl(iris1))/(Max - Min))^2 + ((sw(iris2)-sw(iris1))/(Max - Min))^2 + ((pl(iris2)-pl(iris1))/(Max - Min))^2 + ((pw(iris2)-pw(iris1))/(Max - Min))^2 )


sl = sepal length

sw = sepal width

pl = petal length

pw = petal width


### Question 2

*Voir TD3.ods/Ex1*

## Exercice 2 : Clustering Kmeans

### Question 1

__distEuclidienne(x,y)__ = sum(x-y)^2

#### 1ère étape :

	- Groupe C1 : {5,6,7,8}
	- Groupe C2 : {10,11,12,9}
	- Groupe C3 : {1,2,3,4}

#### Recalcule des centres
	
	- C'1 : (0.4,0.8)
	- C'2 : (0.9,0.4)
	- C'3 : (0.15,0.225)

#### 2ème itération :

	- Groupe C'1 : {5,6,7,8}
	- Groupe C'2 : {10,11,12,9}
	- Groupe C'3 : {1,2,3,4}

Les groupes n'ont pas changés l'algorithme s'arrête.

## Exercice 5

### Question 1

#### Normalisation

	__dist(P1,P2)__ = sqrt( (nbEspece(P2-P1)/(nbEspece(Max-Min)) )^2 + (nbBase(P2-P1)/nbBase(Max-Min) )^2 + (Diamètre(P2-P1)/(Diamètre(Max-Min)))^2 + (0 si vegatation(P1=P2); 1 sinon) )

#### Calcul

	__dist(P1,P2)__ = RACINE(((B3-B2)/11)^2+(C3-C2)/4^2+((D3-D2)/(120536-2300))^2+1)

### Question 2

*Voir feuille de TD*
