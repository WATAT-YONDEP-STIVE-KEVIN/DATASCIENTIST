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
#---------------------Séparation du jeu de données en test-set et train-set----------------------------------#

# library(caTools);

# set.seed(123)

# split <- sample.split(StartupData_preproced$Profit, SplitRatio = 0.85); 
# train_set <- subset(StartupData_preproced, split == TRUE); 
# test_set <- subset(StartupData_preproced, split == FALSE);

# head(test_set);
# head(train_set);

#-------------------------Creation du model SVR-----------------------------#
#install.packages('e1071');
library(e1071);

regressor_svr <- svm(formula = Salary ~ ., data = dataset, type = 'eps-regression');
#type = 'eps-regression' pour signifier qu'il s'agit de la regression(SVR) , on aurai pu ajouter un autre parametre qui est le kernel

summary(regressor_svr);

newdata <- data.frame(Level = 6.5)

y_pred <- predict(regressor_svr, newdata = newdata)

print(y_pred)
 

#----------------------affichage de la courbe d'aprentissage -----------------#
#---------------------VISUALISATION DES COURBES DES DEUX MODELES------------------#
library(ggplot2);


        #------Visualisation regression linéaire simple-------------#

ggplot() + geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") + geom_line(aes(x = dataset$Level, y = predict(regressor_svr, newdata = dataset)), colour = "blue") + ggtitle("Resultat SVR") + xlab("Level") + ylab("salary");
  


        #------Visualisation regression polynomiale-------------#

ggplot() + geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") + geom_line(aes(x = dataset$Level, y = predict(regressor_svr, newdata = data.frame(Level = 6.5))), colour = "blue") + ggtitle("Resultat SVR prediction") + xlab("Level") + ylab("salary");