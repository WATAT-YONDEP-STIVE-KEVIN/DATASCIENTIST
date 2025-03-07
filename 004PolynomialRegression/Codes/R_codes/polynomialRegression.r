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


#--------------------------------Entrainement sur un modele de regression linéaire-------------------------------------#

linearRegressor <- lm(formula=Salary ~ ., data = dataset);

summary(linearRegressor);


#-------------------------Entrainement sur un mode de regression polynomial------------------------------#

#Ajouter des colonnes suplumentaires qui serat le carré, cube etc... de la colonne Level pour une regression de degré souhaitéé
dataset$Level2 <- dataset$Level ^ 2; 
dataset$Level3 <- dataset$Level ^ 3; 
dataset$Level4 <- dataset$Level ^ 4; 
head(dataset);
polynomialRegression <- lm(formula=Salary ~ ., data = dataset)
summary(polynomialRegression);



#---------------------VISUALISATION DES COURBES DES DEUX MODELES------------------#
library(ggplot2);


        #------Visualisation regression linéaire simple-------------#

ggplot() + geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") + geom_line(aes(x = dataset$Level, y = predict(linearRegressor, newdata = dataset)), colour = "blue") + ggtitle("Resultat regression linéaire") + xlab("Level") + ylab("salary");
  


        #------Visualisation regression polynomiale-------------#

ggplot() + geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") + geom_line(aes(x = dataset$Level, y = predict(polynomialRegression, newdata = dataset)), colour = "blue") + ggtitle("Resultat regression polynomiale") + xlab("Level") + ylab("salary");



#----------------------EValuation des deux modeles sur une données en entréé------------------------#

                #------ regression linéaire simple-------------#
                new_predict_1 <- predict(linearRegressor, newdata = data.frame(Level = 6.5));


                 #------ regression POLYNOMIALE-------------#
                new_predict_2 <- predict(polynomialRegression, newdata = data.frame(Level = 6.5,
                                                                                    Level2 = (6.5) ^ 2,
                                                                                    Level3 = (6.5) ^ 3, 
                                                                                    Level4 = (6.5) ^ 4
                                                                                    )); 

                #On ajoute Level1 jusqu'a Level4 car on avait 4 Levels au moment de l'entrainement

vectorPrediction <- c(new_predict_1, new_predict_2);     

cat(vectorPrediction);