
#Chargement du djeu de données
my_data <- read.table('./../../Datasets/data.csv', header = TRUE,  dec = '.', sep = ',', na.strings = c("","NA"," "));

#na.strings = c("","NA"," ") permet de remplacer les espaces vide ou valeurs manquantes par NA  dans le datset

#Affichage de quelques ligne du jeu de données
cat("Quelques lignes du jeu de données\n")
cat("\n");
head(my_data);

cat("\n");
cat("Description du jeu de données\n");
#Description du jeu de données
cat("\n");
summary(my_data);

cat("\n");


missingValuesCountry <- sum(is.na(my_data$Country));
missingValuesAge <- sum(is.na(my_data$Age));
missingValuesSalary <- sum(is.na(my_data$Salary));
missingValuesPurchased <- sum(is.na(my_data$Purchased));
missingValuesRegion <- sum(is.na(my_data$Region));


cat("Country missing values = ", missingValuesCountry, "\n");
cat("Age missing values = ", missingValuesAge, "\n");
cat("Purchased missing values = ", missingValuesPurchased, "\n");
cat("Salary missing values = ", missingValuesSalary, "\n");
cat("Region missing values = ", missingValuesRegion, "\n");

#Remplacons les valeurs manquantes par la moyenne, on utiliera les colonnes dont on a compté au moins une valeurs manquante

my_data$Age[is.na(my_data$Age)] <- mean(my_data$Age, na.rm=TRUE);
my_data$Salary[is.na(my_data$Salary)] <- mean(my_data$Salary, na.rm=TRUE);


#Remplacement des valeurs manqauntes de la colonne Region par le mode

#Definissons une fonction R pour calculer le mode

CalculerMode <- function(coulum_region_data) {
    new_data <- na.omit(coulum_region_data);#On omet ou ne considere pas les valeurs manquantes dans le calcul du mode
    table_mode <- table(new_data); #renvoie un tableau dans lequel figure chaque donnée unique de la colonne region avec son nombre d'occurence
    mode_value <- names(table_mode)[which.max(table_mode)];

    return (mode_value);
}


my_data$Region[is.na(my_data$Region)] <- CalculerMode(my_data$Region);


#ENCODAGE DES DONNÉES CATÉGORIELLES

#Effectuons du label encoder sur les colonnes pays et purchased

my_data$Country <- factor(my_data$Country, levels = c("France", "Spain", "Germany"), labels = c(1, 2, 3));

my_data$Purchased <- factor(my_data$Purchased, levels = c("Yes", "No"), labels = c(1, 0) );


#EFFCETUONS DU OneHotEncoding SUR LA COLONNE Region
#on effectue du oneHotEncoding car on considere qu'il n'y a pas d'odre de priorité entre les region, donc elles ont la meme importance
#Pour le faire on a besoin du package caret de R 

library(caret);

dummies <- dummyVars("~Region", data = my_data); 

#dummyVars : C’est une fonction du package caret qui est utilisée pour créer des variables indicatrices (ou "dummy variables") à partir d'une variable catégorielle. Les variables indicatrices sont des colonnes binaires (0 ou 1) qui indiquent la présence ou l'absence d'une catégorie dans la variable d'origine.
#~Region pour specifier a R que c'est la colonne Region qui nous interesse
#Le tilde ~ indique qu'il s'agit d'une formule, où ~Region est la variable à encoder
#data = my_data spécifie que la variable provient de l'objet my_data, qui devrait être un DataFrame contenant vos données.
my_data$Region <- predict(dummies, newdata = my_data); #Pour appliquer le modele crée par dummyVars aux données
#newdata = my_data pour signifié que l'on applique cela aux données d'origine

data_preproced <- as.data.frame(my_data);


#DIVISION DU JEU DE DONNÉES EN JEU DE TEST ET D'ENTRAINEMENT

library(caTools);

set.seed(123)# Pour assurer la reproductibili

split <- sample.split(data_preproced$Purchased, SplitRatio = 0.8); 
#Attribut 80% des données comme trainset et les identifies a TRUE et Pour les 20% du testset les identifie a FALSE
train_set <- subset(data_preproced, split == TRUE); 
test_set <- subset(data_preproced, split == FALSE);


#NORMALISATION DES DONNÉES D'ENTRAINEMENTS ET DE TEST 
#ici les seules colonnes qu'on doit normaliser sont les colonnes, country, salary et Age
#les colonnes Country, Region, et purchased sont bien encodées
train_set[, 2:3] <- scale(train_set[, 2:3]);#On normalise les colonnes Age et salary du trainset

test_set[, 2:3] <- scale(test_set[, 2:3]);#On normalise les colonnes Age et salary du testset


#REMARQUE: 
#On aurai toujours pu proceder de la maniere suivante :

# train_set[, c("Age", "Salary")] <- scale(train_set[, c("Age", "Salary")])  
# test_set[, c("Age", "Salary")] <- scale(test_set[, c("Age", "Salary")])  

# Vérifier les ensembles de données  
head(train_set)  
head(test_set)