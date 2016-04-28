# TP5 - BI
# Classification

**Durand JF & Amara Antoine**

# Exercice : ZOO



## Q2.3

De notre point de vue, aucun attributs ne semble génant à la création du modèle. On parle ici de classification supervisé car nous utilisons des données d'entrainement pour construire le modèle. Une fois le modèle construit grâce à ces données on le test avec de nouvelles instance, qui n'était pas présente lors de la construction du modèle. Cela correspond à un entrainement supervisé car nous avons un oracle(nos données d'entrainement) qui permet d'amelioré au fur et à mesure l'erreur de prédiction de notre modèle. Notre jeu de test permet de valider le modèle. Le principe de séparer données d'entrainement et données de test s'appelle la cross-validation.

## Q2.4

Le meilleur algorithme que nous ayons expérimenté est celui de Hoedffing, celui-ci a une très bonne précision: 96% de classification correct et un taux d'erreur de 4%. Nous avons régler le paramètre de la cross-validation(folds) à 10.

