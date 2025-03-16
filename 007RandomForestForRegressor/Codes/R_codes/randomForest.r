#----------------------------Chargement du jeu de données--------------------------------------------------------#

PositionSalary <- read.table('./../../Datasets/Position_Salaries.csv', header = TRUE,  sep=",", dec=".", na.string="?");


#-----------------------------------Visualisation de l'entete du jeu de données----------------------------------------#

head(PositionSalary);


#------------------------------------------Information sur le jeu de données---------------------------------------------#
summary(PositionSalary)




#considerons la colonne Level est l'encodage  de la colonne position , donc on ne va considerer que les colonnes level et salary comme faisant partir de notre dataset
#Étant donné que l'on a que 10 données on ne va pas les separer en train_set et test_set

dataset <- PositionSalary[2:3];
head(dataset);

#-------------------Construction du modele-------------------------#
library(randomForest);
set.seed(1234)#joue le meme role que random_state dans python

randomRegressor_tree <- randomForest(x = dataset[1], y = dataset$Salary, ntree = 200);#
#Le nombre d'arbre joue un grand role dans les randomForest donc il faudrait tester plusieurs valeurs differentes  pour ntree afin de trouver le meilleur nombre de  randomforest
summary(randomRegressor_tree);



newdata <- data.frame(Level = 6.5)

y_pred <- predict(randomRegressor_tree, newdata = newdata)

print(y_pred)
 

#---------------------VISUALISATION DES COURBES DES DEUX MODELES------------------#
library(ggplot2);


        #------Visualisation regression linéaire simple-------------#
pdf ("randomForestSalaryData.pdf", width = 7, height = 6);
ggplot() + geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") + geom_line(aes(x = dataset$Level, y = predict(randomRegressor_tree, newdata = dataset)), colour = "blue") + ggtitle("Resultat Random forest trainset") + xlab("Level") + ylab("salary");
  


        #------Visualisation regression polynomiale-------------#

ggplot() + geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") + geom_line(aes(x = dataset$Level, y = predict(randomRegressor_tree, newdata = data.frame(Level = 6.5))), colour = "blue") + ggtitle("Resultat randomForest prédiction") + xlab("Level") + ylab("salary");




#--------------------Visualisation du model avec une grande resolution------------------#

# Créez une grille avec les niveaux  
X_grid = data.frame(Level = seq(min(dataset$Level), max(dataset$Level), 0.1))  

# Prédisez les valeurs en utilisant le modèle  
predicted_salaries = predict(randomRegressor_tree, newdata = X_grid)  

# Créez le graphique  
ggplot() +  
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") +  
  geom_line(aes(x = X_grid$Level, y = predicted_salaries), colour = "blue") +  
  ggtitle("Resultat randomForest trainset haute resolution test") +  
  xlab("Level") +  
  ylab("Salary")  