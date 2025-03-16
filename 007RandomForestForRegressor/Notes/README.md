# **RANDOM FOREST (foret aleatoire)**

## **INFORMATION SUR LE DATASET**

Notre dataset contient les informations sur les differents grades , niveau  et salaire du personnel d'une entreprise.

### Qu'est-ce qu'un random forest ?
    ` Le Random Forest est un algorithme d'apprentissage automatique basé sur les arbres de décision. Il appartient à la catégorie des méthodes d'ensembles, ce qui signifie qu'il combine plusieurs modèles pour améliorer la précision et la robustesse des prédictions.Le Random Forest est un algorithme d'apprentissage automatique basé sur les arbres de décision. Il appartient à la catégorie des méthodes d'ensembles, ce qui signifie qu'il combine plusieurs modèles pour améliorer la précision et la robustesse des prédictions.`

### Fonctionnement de l'algorithme

#### Construction de l'ensemble d'arbres :

    + Échantillonnage bootstrap : Pour créer chaque arbre dans la forêt, Random Forest utilise une technique appelée bootstrap. Cela implique de générer plusieurs sous-ensembles de données en échantillonnant (avec remplacement) l'ensemble de données d'origine.
    + Sélection aléatoire de caractéristiques : Lors de la création de chaque arbre, à chaque noeud de l'arbre, Random Forest sélectionne un sous-ensemble aléatoire de caractéristiques (features) pour déterminer la meilleure division. Cela entraîne une diversité dans les arbres.
    
#### Apprentissage des arbres 
 Chaque arbre est construit sur son propre sous-ensemble d'échantillons et de caractéristiques, ce qui donne lieu à des arbres de décision qui peuvent varier significativement.

#### Prédiction

Pour les problèmes de classification, chaque arbre vote pour une classe et la classe avec le plus de votes devient la prédiction finale.
Pour les problèmes de régression, la prédiction est généralement la moyenne des prédictions de tous les arbres.


#### Avantages des Random Forest
    + Robustesse face au surapprentissage : Grâce à l'utilisation de plusieurs arbres et au principe de la moyenne, l'algorithme est moins sensible au surapprentissage par rapport à un arbre de décision simple.

    + Gestion des données manquantes : Random Forest peut gérer efficacement les données manquantes et peut imputer de manière automatique la valeur d'un attribut manquant en utilisant les informations d'autres arbres.

    + Importance des caractéristiques : L'algorithme fournit des estimations de l'importance des différentes caractéristiques, ce qui permet de comprendre quels facteurs influencent le plus la variable cible.

    + Flexibilité : Il peut être utilisé tant pour la classification que pour la régression, ce qui en fait un algorithme polyvalent.

    + Performances élevées : Random Forest offre généralement de bonnes performances en termes de précision, même sans réglage hyperparamétrique approfondi.

#### Inconvénients des Random Forest

    + Complexité et temps de calcul : En raison du grand nombre d'arbres et de la complexité de la construction, l'entraînement de modèles Random Forest peut être long et demande des ressources computationnelles élevées, surtout avec de grands ensembles de données.

    + Difficulté d'interprétation : Contrairement à un seul arbre de décision, les forêts aléatoires sont plus difficiles à interpréter. Il est moins aisé de comprendre comment les décisions sont prises, ce qui peut poser problème dans des domaines où l'explicabilité est essentielle.

    + Sensible aux déséquilibres de classes : Dans le cas de données déséquilibrées, Random Forest peut être influencé par la classe majoritaire, ce qui peut affecter la précision des prédictions pour la classe minoritaire.

    + Taille du modèle : Les forêts aléatoires peuvent créer des modèles plus volumineux, ce qui peut être un inconvénient pour les applications nécessitant un déploiement rapide ou une intégration sur des dispositifs aux ressources limitées.
