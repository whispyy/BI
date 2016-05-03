# TP5 - BI
# Classification

**Durand JF & Amara Antoine**

# Exercice : ZOO

## Q2.1

Nous avons commencé par construire le tableau suivant :

| Caractéristiques | Classification Animale |
|---|---|
| poils | mammifères |
| plumes | oiseaux |
| ponte d'oeufs | oiseaux, insecte, amphibiens, reptiles, poissons, invertébrés |
| production de lait | mammifères |
| capacité de voler | insectes, amphibiens, mammifères, oiseaux |
| Respiration à l'air | Tout sauf poissons |
| venimosité | reptiles, poissons, insectes, oiseaux |
| 2 pattes | mammifères, oiseaux |
| 4 pattes | mammifères, amphibiens, reptiles |
| 6 pattes | insectes |
| domesticable | oiseaux, mammifères, amphibiens, poissons, insectes |


A partir du tableau précédent nous en avons déduit un arbre pour classer les animaux listés :

Respire à l'air --non--> poisson
  --oui--> Plume --oui--> poule
    --non--> Capacité de voler --oui--> abeille
      --non--> Poils --non--> crabe
        --oui--> Carnivore --non--> antilope
          --oui--> Produit du lait --non--> ours
            --oui--> chat
            
## Q2.3

De notre point de vue, aucun attributs ne semble génant à la création du modèle. On parle ici de classification supervisé car nous utilisons des données d'entrainement pour construire le modèle. Une fois le modèle construit grâce à ces données on le test avec de nouvelles instance, qui n'était pas présente lors de la construction du modèle. Cela correspond à un entrainement supervisé car nous avons un oracle(nos données d'entrainement) qui permet d'amelioré au fur et à mesure l'erreur de prédiction de notre modèle. Notre jeu de test permet de valider le modèle. Le principe de séparer données d'entrainement et données de test s'appelle la cross-validation.

## Q2.4

Le meilleur algorithme que nous ayons expérimenté est celui de Hoedffing, celui-ci a une très bonne précision: 96% de classification correct et un taux d'erreur de 4%. Nous avons régler le paramètre de la cross-validation(folds) à 10.

