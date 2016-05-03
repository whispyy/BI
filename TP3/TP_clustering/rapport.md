# Rapport TP3 - Clustering

* Antoine Amara & Jean-Frédéric Durand*

## Square 1

1/ Les points étant des données numériques, la distance euclidienne est donc appropriée dans ce cas.

5/ Test sur les données avec k = 4 et distance Euclidienne

nombre de données lues : 1000

- le cluster 0 a 270 donnees et son centre est (5.338957421851847,0.328866961)
- le cluster 1 a 146 donnees et son centre est (4.176741783561645,-2.376112602739726)
- le cluster 2 a 105 donnees et son centre est (5.003109155238095,3.7514411428571384)
- le cluster 3 a 479 donnees et son centre est (5.056959846137796,10.133866784968685)

- WC = 1098.0493997998303 BC = 82.2496448946105 Rapport BC/WC = 0.07490523186807829

6/ Plus K est ptit plus le ratio BC/WC est petit.

7/ les données fournis par l'algorithme ont été déplacés dans données/square.

Via GnuPlot je définie les commandes suivantes :

>set terminal png
>set output 'result.png'
>plot '0.dat', '1.dat', '2.dat', '3.dat'


## Iris

1/ Les points étant des données numériques, la distance euclidienne est donc appropriée dans ce cas.

5/ Test sur les données avec k = 4 et distance Euclidienne.

- le cluster 0 a 19 donnees et son centre est (4.715789473684212,3.052631578947369,1.4052631578947368,0.18421052631578957)
--> Détail : 19 iris setosa, 0 iris versicolor, 0 iris virginica
- le cluster 1 a 6 donnees et son centre est (5.5,4.083333333333333,1.4333333333333333,0.2833333333333334)
--> Détail : 6 iris setosa, 0 iris versicolor, 0 iris virginica
- le cluster 2 a 25 donnees et son centre est (5.108,3.536000000000001,1.5160000000000002,0.28)
--> Détail : 25 iris setosa, 0 iris versicolor, 0 iris virginica
- le cluster 3 a 100 donnees et son centre est (6.261999999999998,2.872000000000001,4.906000000000001,1.6760000000000006)
--> Détail : 0 iris setosa, 50 iris versicolor, 50 iris virginica

- WC = 97.33003433532417 BC = 26.847254780932023 Rapport BC/WC = 0.27583730925684363

