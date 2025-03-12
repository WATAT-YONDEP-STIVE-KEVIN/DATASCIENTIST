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

# dataset[, 1:2]  <- scale(dataset[, 1:2]);
#-------------------Construction du modele-------------------------#
library(rpart);

regressor_tree <- rpart(formula = Salary ~ ., data = dataset, control = rpart.control(minsplit = 1));

summary(regressor_tree);



newdata <- data.frame(Level = 6.5)

y_pred <- predict(regressor_tree, newdata = newdata)

print(y_pred)
 

#---------------------VISUALISATION DES COURBES DES DEUX MODELES------------------#
library(ggplot2);


        #------Visualisation regression linéaire simple-------------#

ggplot() + geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") + geom_line(aes(x = dataset$Level, y = predict(regressor_tree, newdata = dataset)), colour = "blue") + ggtitle("Resultat Arbre de Décision") + xlab("Level") + ylab("salary");
  


        #------Visualisation regression polynomiale-------------#

ggplot() + geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") + geom_line(aes(x = dataset$Level, y = predict(regressor_tree, newdata = data.frame(Level = 6.5))), colour = "blue") + ggtitle("Resultat Arbre de Décision prédiction") + xlab("Level") + ylab("salary");




#--------------------Visualisation du model avec une grande resolution------------------#

#X_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)


#ggplot() + geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") + geom_line(aes(x = X_grid, y = predict(regressor_tree, newdata = dataset)), colour = "blue") + ggtitle("Resultat Arbre de Décision trainset haute resolution test") + xlab("Level") + ylab("salary");
  
