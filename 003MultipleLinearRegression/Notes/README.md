# **REGRESSION LINÉAIRE MULTIPLE**

## **INFORMATION SUR LE DATASET**

Notre dataset contient les données sur  50 compagnies . on veut prédire les profits de chaque compagnie sur la base des variables.

La regression lineaire multiple est definie par la formule
#### **Y = a1X1 + a2X2 + a3X3 + ...+ b**
OU 
    + Y est la variable dependante
    + Xi la variable indépendante
    + ai, b sont des coefficients a determiner
    + en gros nous charchons a trouver une relation de la sorte **Profits = a1 * (R&D Spend) + a2 * Administration + a3 * (Marketing Spend) + a4 $ State + b**

Pour effectuer une regression linéaire sur les données , les hypotheses suivantes doivent etre vérifiés:
    + **Linearité**
    + **Homoscédasticité**
        La variance des erreurs ou residus est constante pour toutes les variables independantes
    + **Independance des erreurs**
        les erreurs de residus ne doivent pas etre correlées entre elles.
    + **Normalité multivariée**
        les residus ou errreus suivent une distribution normale car nécéssaire pour les tests d'hypotheses
    + **Abscence de multicolinéarité**
        deux variables ne doivent pas etre fortements correlés car elles rendraient difficile l'effet d'estimation des autres variables



Dans le cas de la regression linéaire multiple, on a plusieurs variables independantes . comment identifier celles qui n'impactent pas beaucoup le resultat de la regression lineaire multiple pour leur élimiter car n'ont pas beaucoup d'impact ?: **BackWard elimination**


▎Backward Elimination : Une technique de sélection de variables pour la régression

La Backward Elimination (élimination à rebours) est une méthode de sélection de variables utilisée dans la construction de modèles de régression. Elle permet d'identifier les variables explicatives les plus significatives pour prédire une variable dépendante, en partant d'un modèle complet et en éliminant progressivement les variables non significatives.



▎Étapes de la Backward Elimination :

1. Définir un seuil de significativité (α)  

   • Choisir un seuil (par exemple, α = 0,05) pour déterminer si une variable doit être conservée ou supprimée.

2. Construire le modèle initial  

   • Inclure toutes les variables explicatives dans le modèle de régression.

3. Ajuster le modèle et évaluer les p-valeurs  

   • Ajuster le modèle et examiner les p-valeurs associées à chaque variable.  

   • La p-valeur indique la probabilité que le coefficient d'une variable soit nul, ce qui signifie qu'elle n'a pas d'impact significatif sur la variable dépendante.

4. Identifier la variable la moins significative  

   • Trouver la variable avec la p-valeur la plus élevée.  

   • Si cette p-valeur est supérieure au seuil α, la variable est considérée comme non significative.

5. Supprimer la variable la moins significative  

   • Retirer cette variable du modèle.

6. Répéter les étapes 3 à 5  

   • Réajuster le modèle sans la variable supprimée et répéter le processus jusqu'à ce que toutes les variables restantes aient une p-valeur inférieure au seuil α.

7. Finaliser le modèle  

   • Lorsque toutes les variables restantes sont significatives, le modèle final est obtenu.

---

▎Exemple d'application :

Imaginons que vous développiez un modèle de régression linéaire pour prédire le prix des maisons basé sur les variables suivantes :

• Surface (m²)  

• Nombre de chambres  

• Âge de la maison (années)  

• Distance au centre-ville (km)  

• Qualité du quartier (score)  

▎Étapes :

1. Modèle initial : Inclure toutes les variables.

2. Ajuster le modèle : Obtenir les p-valeurs pour chaque variable.

   • Surface : p = 0,01  

   • Nombre de chambres : p = 0,03  

   • Âge de la maison : p = 0,45  

   • Distance au centre-ville : p = 0,02  

   • Qualité du quartier : p = 0,001  

3. Identifier la variable la moins significative :  

   • "Âge de la maison" a la p-valeur la plus élevée (0,45 > α = 0,05).  

4. Supprimer cette variable : Retirer "Âge de la maison" du modèle.

5. Réajuster le modèle : Répéter le processus avec les variables restantes.

6. Finaliser le modèle : Continuer jusqu'à ce que toutes les variables restantes aient une p-valeur < α.

---

▎Avantages de la Backward Elimination :

1. Simplicité : Facile à comprendre et à mettre en œuvre.

2. Efficacité : Réduit le nombre de variables, simplifiant ainsi le modèle et évitant le surajustement (overfitting).

3. Interprétabilité : Le modèle final est plus facile à interpréter car il ne contient que des variables significatives.

---

▎Inconvénients de la Backward Elimination :

1. Dépendance à l'ordre d'élimination : L'ordre dans lequel les variables sont supprimées peut influencer le résultat final.

2. Risque de perdre des interactions : Les interactions importantes entre variables peuvent être négligées.

3. Calculs intensifs : Pour un grand nombre de variables, le processus peut être long et complexe.

---

▎Quand utiliser la Backward Elimination ?

• Lorsque vous avez un nombre modéré de variables et que vous souhaitez identifier celles qui sont les plus pertinentes.

• Pour simplifier un modèle complexe en éliminant les variables redondantes ou non significatives.
