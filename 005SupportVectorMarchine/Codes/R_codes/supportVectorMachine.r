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

