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
#Attribut 85% des données comme trainset et les identifies a TRUE et Pour les 20% du testset les identifie a FALSE
train_set <- subset(dataset, split == TRUE); 
test_set <- subset(dataset, split == FALSE);


#-----------------Normalisation des données---------------------#
train_set[, 1:2] <- scale(train_set[, 1:2]);

test_set[, 1:2] <- scale(test_set[, 1:2]);


#-------------------construction du modele svm(svc)------------------------#
library(e1071)

classifier = svm(formula = Purchased ~ ., data = train_set, type = 'C-classification', kernel = 'linear');


y_pred = predict(classifier, type = 'response', newdata = test_set[1:2]);

#----------Arrondissons les resultats---------------#

cat("Test set :\n");
print(test_set[, 3])
cat("Predictions :\n");
print(y_pred)

#---------matrice de confusion-----------#

confusionMatrix = table(test_set[, 3], y_pred);

confusionMatrix;
