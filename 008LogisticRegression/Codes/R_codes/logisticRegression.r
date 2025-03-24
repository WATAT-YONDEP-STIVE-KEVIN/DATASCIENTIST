#----------------------------Chargement du jeu de données--------------------------------------------------------#

socialNetwork <- read.table('./../../Datasets/Social_Network_Ads.csv', header = TRUE,  sep=",", dec=".", na.string="?");


#-----------------------------------Visualisation de l'entete du jeu de données----------------------------------------#

head(socialNetwork);


#------------------------------------------Information sur le jeu de données---------------------------------------------#
summary(socialNetwork)




dataset <- socialNetwork[1:3];
head(dataset);

#-----------------------Division du jeu de données----------------#
library(caTools);

set.seed(123)# Pour assurer la reproductibili

split <- sample.split(dataset$Purchased, SplitRatio = 0.85); 
#Attribut 5% des données comme trainset et les identifies a TRUE et Pour les 20% du testset les identifie a FALSE
train_set <- subset(dataset, split == TRUE); 
test_set <- subset(dataset, split == FALSE);


#-----------------Normalisation des données---------------------#
train_set[, 1:2] <- scale(train_set[, 1:2]);

test_set[, 1:2] <- scale(test_set[, 1:2]);


#-------------------construction du modele de regression logistique------------------------#

classifier = glm(formula = Purchased ~ ., family = binomial, data = train_set);


probability_pred = predict(classifier, type = 'response', newdata = test_set[1:2]);

#----------Arrondissons les resultats---------------#

y_pred = ifelse (probability_pred > 0.5, 1, 0);
print(test_set[, 3])
print(y_pred)

#---------matrice de confusion-----------#

confusionMatrix = table(test_set[, 3], y_pred);

confusionMatrix;





 

# #---------------------VISUALISATION DES COURBES DES DEUX MODELES------------------#
# library(ggplot2);


#         #------Visualisation regression linéaire simple-------------#
# pdf ("randomForestSalaryData.pdf", width = 7, height = 6);
# ggplot() + geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") + geom_line(aes(x = dataset$Level, y = predict(randomRegressor_tree, newdata = dataset)), colour = "blue") + ggtitle("Resultat Random forest trainset") + xlab("Level") + ylab("salary");
  


#         #------Visualisation regression polynomiale-------------#

# ggplot() + geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") + geom_line(aes(x = dataset$Level, y = predict(randomRegressor_tree, newdata = data.frame(Level = 6.5))), colour = "blue") + ggtitle("Resultat randomForest prédiction") + xlab("Level") + ylab("salary");

