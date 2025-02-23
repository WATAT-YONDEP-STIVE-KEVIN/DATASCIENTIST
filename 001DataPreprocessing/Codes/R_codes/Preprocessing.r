
#Chargement du djeu de données
data <- read.table('./../../Datasets/data.csv', header = TRUE,  dec = '.', sep = ',');

#Affichage de quelques ligne du jeu de données
cat("Quelques lignes du jeu de données\n")
cat("\n");
head(data);

cat("\n");
cat("Description du jeu de données\n");
#Description du jeu de données
cat("\n");
summary(data);

cat("\n");


missingValuesCountry <- sum(is.na(data$Country));
missingValuesAge <- sum(is.na(data$Age));
missingValuesSalary <- sum(is.na(data$Salary));
missingValuesPurchased <- sum(is.na(data$Purchased));
missingValuesRegion <- sum(is.na(data$Region));


cat("Country missing values = ", missingValuesCountry, "\n");
cat("Age missing values = ", missingValuesAge, "\n");
cat("Purchased missing values = ", missingValuesPurchased, "\n");
cat("Salary missing values = ", missingValuesSalary, "\n");
cat("Region missing values = ", missingValuesRegion, "\n");

#Remplacons les valeurs manquantes par la moyenne, on utiliera les colonnes dont on a compté au moins une valeurs manquante

data$Age[is.na(data$Age)] <- mean(data$Age, na.rm=TRUE);
data$Salary[is.na(data$Salary)] <- mean(data$Salary, na.rm=TRUE);

cat(data$Region)