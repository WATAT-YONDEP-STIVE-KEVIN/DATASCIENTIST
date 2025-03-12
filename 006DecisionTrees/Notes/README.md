# **ARBRES DE DECISIONS**

## **INFORMATION SUR LE DATASET**

Notre dataset contient les informations sur les differents grades , niveau  et salaire du personnel d'une entreprise.

### Qu'est-ce qu'un arbre de décision ?
    ` Un arbre de décision est un modèle prédictif qui divise un ensemble de données en sous-ensembles basés sur des tests de conditions. Chaque nœud de l'arbre représente une caractéristique d'entrée (ou attribut), et les feuilles représentent les prédictions finales.`

### Utilité des arbres de décision
    
    `Les arbres de décision sont utilisés dans divers domaines, notamment `

     + Classification : Identification de la classe d'un élément basé sur ses caractéristiques.
     + Régression : Prédiction de valeurs continues.
     + Analyse des données : Aide à visualiser et interpréter les données de manière intuitive.

### Fonctionnement
    + Sélection de la meilleure caractéristique : Pour chaque nœud, l'algorithme choisit la caractéristique qui divise le mieux les données selon un critère (comme l'impureté de Gini ou l'entropie).
    + Division des données : Les données sont divisées en fonction de la caractéristique sélectionnée.
    + Répétition : Le processus est répété pour chaque sous-ensemble jusqu'à ce qu'une condition d'arrêt soit atteinte (par exemple, profondeur maximale ou pureté des feuilles)

### Avantages 
    + Facilité d'interprétation et de visualisation.
    + Pas besoin de normalisation des données.
    + Gère les variables catégorielles et continues.1
### inconvénients

    + Sensibilité à l'overfitting.
    + Peut être biaisé si les classes sont déséquilibrées

### Exemple d'utilisation
    Dans notre cas nous allons l'utiliser dans le cadre de la predicion de salaire en fonction du grade de l'employé(Level).

### Conclusion

    Les arbres de décision sont des modèles polyvalents et interprétables qui peuvent être appliqués à de nombreux problèmes de classification et de régression. Comprendre leur fonctionnement et leur utilité est essentiel pour quiconque s'intéresse à l'analyse des données et au machine learning