#Chargement des librairies nécéssaires
library(scales); #NECESSAIRE POUR UTILISER LA FONCTION hue
library(caTools);
library(ggplot2);
#chargement des données 

salaryData = read.table('./../../Datasets/Salary_Data.csv', header = TRUE,  sep=",", dec=".", na.string="?")

head(salaryData)


#Visualisation des données

#Nuage des points
pdf ("nuagePointSalary.pdf", width = 7, height = 6);
plot(salaryData$Salary, salaryData$YearsExperiences,pch = 16,
    xlab="Années experiences", ylab="Salaires", main="Salaire VS années experiences", col="blue");
dev.off()  # Fermez le fichier PDF
#Diagramme en bande ou histogramme

pdf ("HistogrammeSalary.pdf", width = 7, height = 6);
hist(salaryData$Salary, col=hue_pal()(4)[1], main="Histogramme", freq=FALSE);
lines(density(salaryData$Salary))
dev.off()  # Fermez le fichier PDF

#Pretraitement des données

salaryData$Salary[is.na(salaryData$Salary)] <- mean(salaryData$Salary, na.rm=TRUE);
salaryData$YearsExperience[is.na(salaryData$YearsExperience)] <- mean(salaryData$YearsExperience, na.rm=TRUE);


#Séparation du jeu de données en données de test et d'entrainement

set.seed(123)
split <- sample.split(salaryData$Salary, SplitRatio=0.8);
train_set<- subset(salaryData, split==TRUE);
test_set <- subset(salaryData, split==FALSE);




#Entrainement du modele

linearRegression = lm(formula=Salary~YearsExperience, data=train_set);
#formula=Salary~YearsExperience pour signifie que les deux variables sont liés

summary(linearRegression);

#Predictions des nouvelles predictions

y_predictions = predict(linearRegression, newdata=test_set);
head(test_set)
head(y_predictions)

train_set

#Construisons les graphes de l'entrainement du modele de data trainset
pdf ("courbeTrainSet.pdf", width = 7, height = 6);
ggplot() +
    geom_point(aes(x=train_set$YearsExperience, y=train_set$Salary), 
    colour="red")+
    geom_line(aes(x=train_set$YearsExperience, y=predict(linearRegression, newdata=train_set)),
    colour="blue") +
    ggtitle('Salaire vs Années experiences(training set)') +
    xlab("Années experiences") +
    ylab("Salaires");




#Construisons les graphes de test du modele 
pdf ("courbeTestSet.pdf", width = 7, height = 6);
ggplot() +
    geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary), 
    colour="red")+
    geom_line(aes(x=train_set$YearsExperience, y=predict(linearRegression, newdata=train_set)),
    colour="blue") +
    ggtitle('Salaire vs Années experiences(training set)') +
    xlab("Années experiences") +
    ylab("Salaires");