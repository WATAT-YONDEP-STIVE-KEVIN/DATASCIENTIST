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

set.seed(123)# Pour assurer la reproductibilité des données
#On divise le jeu de données en trainset et testset
#On utilise la fonction sample.split pour diviser le jeu de données en trainset et testset

split <- sample.split(dataset$Purchased, SplitRatio = 0.85); 
#Attribut 5% des données comme trainset et les identifies a TRUE et Pour les 20% du testset les identifie a FALSE
train_set <- subset(dataset, split == TRUE); 
test_set <- subset(dataset, split == FALSE);


# #-----------------Normalisation des données---------------------#
# train_set[, 1:2] <- scale(train_set[, 1:2]);

# test_set[, 1:2] <- scale(test_set[, 1:2]);


#-------------------construction du modele de knn------------------------#
library(class)
y_pred = knn(train_set[, 1:2], test_set[, 1:2], cl = train_set[, 3], k = 5);

cat("Test set \n")
print(test_set[, 3])
cat("Predictions \n")
print(y_pred)

#---------matrice de confusion-----------#

confusionMatrix = table(test_set[, 3], y_pred);

confusionMatrix;
