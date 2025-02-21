
#Chargement du djeu de données

data <- read.table('./../../Datasets/data.csv', header = TRUE,  dec = '.', sep = ',')

head(data)

summary(data)