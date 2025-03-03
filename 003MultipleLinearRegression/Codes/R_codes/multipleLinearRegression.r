#----------------------------Chargement du jeu de données--------------------------------------------------------#

StartupData <- read.table('./../../Datasets/50_Startups.csv', header = TRUE,  sep=",", dec=".", na.string="?");


#-----------------------------------Visualisation de l'entete du jeu de données----------------------------------------#

head(StartupData);


#------------------------------------------Information sur le jeu de données---------------------------------------------#
summary(StartupData)


#----------------------------------------------Verifications et comptage des valeurs manquantes------------------------------------#

Spend <- sum(is.na(StartupData$R.D.Spend));
Administration <- sum(is.na(StartupData$Administration));
Marketing <- sum(is.na(StartupData$Marketing.Spend));
State <- sum(is.na(StartupData$State));
Profit <- sum(is.na(StartupData$Profit));

missing_vector_count_values <- c(Spend, Administration, Marketing, State, Profit);

cat("le nombre de valeur manqaunte pour chaque variable dans l'ordre est: \n", missing_vector_count_values);


#-------------------------------OneHotEncoding de la colonne State------------------------------------------#

library(caret);

dummies <- dummyVars("~State", data = StartupData); 

StartupData$State <- predict(dummies, newdata = StartupData);

StartupData_preproced <- as.data.frame(StartupData);

head(StartupData);#On aurait pu toujours utiliser du label encoder pour encoder les etats(States).


#---------------------Séparation du jeu de données en test-set et train-set----------------------------------#

library(caTools);

set.seed(123)

split <- sample.split(StartupData_preproced$Profit, SplitRatio = 0.85); 
train_set <- subset(StartupData_preproced, split == TRUE); 
test_set <- subset(StartupData_preproced, split == FALSE);

head(test_set);
head(train_set);


#--------------------------------Definition du modele de regression-------------------------------------#

regressor <- lm(formula = Profit ~ ., data = train_set); # equivalent a :    formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + etc... ecris tout cela serait trop long don on prefere ecrire formula = Profit ~ . pour regrouper toutes les variables indépzndantes


#---------------------------Information sur le modle-----------------------------------#

summary((regressor));


#------------------Session commentaire-------------------------------------#
#Avec python le backwardElimination se faisait avec une fonction de la bibiotheque statsmodels, hors sur R la fonction summary appliqué au modele nous affiche 
#deja les P-values des variables independantes  et on a plus qu'a regarer et selectionner celles qui dont la valeur(probabilité) est inferieur ou egale au seuil SL

#ci dessous est le rendu de la fonction summary on voit les valeurs de p-values(Pr(>|t|)) sur leur colonne.

# Coefficients: (1 not defined because of singularities)
#                        Estimate Std. Error t value Pr(>|t|)    
# (Intercept)           4.995e+04  7.477e+03   6.680 8.65e-08 ***
# R.D.Spend             8.040e-01  5.418e-02  14.840  < 2e-16 ***
# Administration       -3.204e-02  5.715e-02  -0.561    0.579    
# Marketing.Spend       3.378e-02  2.050e-02   1.648    0.108    
# StateStateCalifornia -3.286e+02  3.560e+03  -0.092    0.927    
# StateStateFlorida    -3.829e+02  3.989e+03  -0.096    0.924    
# StateStateNew York           NA         NA      NA       NA    
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# 0 '***'0.001 signifie que lorque la p-value est comprise entre cet intervalle la variable est tres significative pour dire tres importante
# 0.001 '**'0.01 signifie que lorque la p-value est comprise entre cet intervalle la variable est moyennant significative 
# 0.01 '**'0.05 signifie que lorque la p-value est comprise entre cet intervalle la variable est quand meme significative
#0.05 ‘.’ 0.1  signifie  la variable est dans la mesure significative
#’ 0.1 ‘ ’ 1 : pas du tout significative

# Residual standard error: 9730 on 36 degrees of freedom
# Multiple R-squared:  0.9529,    Adjusted R-squared:  0.9464 
# F-statistic: 145.7 on 5 and 36 DF,  p-value: < 2.2e-16


#----------------------------------Test du modele-------------------------------------------#

y_pred <- predict(regressor, newdata=test_set);
cat("\n\nResultat des données de prédictions sur le test_set\n\n");
head(y_pred);
cat("\n\nDonnées du test_set \n\n");
head(test_set);



#-------------------------------BackWard Elimination en eliminant une variable a la fois------------------------------------#


#__1er BackWard élimination

regressor_one <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = train_set);
summary(regressor_one);

            #---------les p-values de state(0.927, 0.924) sont  >= 0.05() donc on les retire.

#__2er BackWard élimnation 

regressor_two <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend , data = train_set);
summary(regressor_two);

        #La p-value de Administration est de 0.5541 >= 0.05, on retire la variable Administration et on entraine de nouveau le modele

#__3er BackWard élimination
regressor_three <- lm(formula = Profit ~ R.D.Spend + Marketing.Spend , data = train_set);
summary(regressor_three);

        #On elimine la variable Marketing Spend car sa p-value est 0.055 > 0.05



#Comme nous avons dit avec la fonction summary() on va juste regarder les p-values et selectionner celle qui sont inferieure au seuil SL = 0.05
#Dans ce cas la seule variable qui est retun est R.D.Spend
#Une foi qu'on a vu ces resultat on va juste appliquer le modele de regression sur les variables significatives dans ce cas la variables R.S.Spend pour un seuil SL = 0.05


final_regressor <- lm(Profit ~ R.D.Spend, data = train_set);

summary(final_regressor);

        #--------------------Predictions sur le test_set---------------------------------#
        final_y_pred <- predict(final_regressor, newdata = test_set);


#---------------------affichons les predictions avec les deux modeles--------------#

cat("\n\nDonnées de test_set\n\n");
test_set;
cat("\n\nResultat des données de prédictions sur le test_set avec le modele sans BackWard élimination\n\n");
y_pred;

cat("\n\nResultat des données de prédictions sur le test_set avec le modele sans BackWard élimination\n\n");
final_y_pred