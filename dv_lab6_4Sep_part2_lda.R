# LDA for data classification,
# reduce dimensions
# only CRP and cut off will not give if viral or bacteria
# only temp and cutoff has same problem
# only LDA D1 works here(vertical)

library(MASS)
library(ggplot2)
library(tidyverse)

#attach iris dataset to make it easy to work with
?iris
attach(iris)
view (iris) #LDA supervised classification,need labels
#4 attributes and 1 label


#view structure
str(iris)
#convert label column to factor(need 1 column as factor)
#other columns not needed


iris_data <- iris
view(iris_data)
iris_data[1:4] <- scale(iris_data[1:4]) #convert mean to 0 and sd 1

#find mean of each predictor variable
?apply
apply(iris_data[1:4], 2, mean)
#in LDA,mean shd be 0,SD shd be 1

#find standard deviation of each predictor variable
apply(iris_data[1:4], 2, sd) 

#make this example reproducible
set.seed(1)


#Use 70% of dataset as training set and remaining 30% as testing set
sample <- sample(c(TRUE, FALSE), nrow(iris_data), replace=TRUE, prob=c(0.6,0.4))
train <- iris_data[sample, ]
test <- iris_data[!sample, ] 

#fit LDA model
model <- lda(Species~., data=train)


#view model output
model
#higher LDA works
#Interpretation
#Prior probabilities of group: These represent the proportions of each 
#Species in the training set. For example, 35.8% of all observations in 
#the training set were of species virginica.
#Group means: These display the mean values for each predictor variable 
#for each species.
#Coefficients of linear discriminants: These display the linear combination 
#of predictor variables that are used to form the decision rule of the 
#LDA model. For example:
#LD1: .792*Sepal.Length + .571*Sepal.Width - 4.076*Petal.Length - 2.06*Petal.Width
#LD2: .529*Sepal.Length + .713*Sepal.Width - 2.731*Petal.Length + 2.63*Petal.Width
#Proportion of trace: These display the percentage separation achieved by 
#each linear discriminant function.


#use LDA model to make predictions on test data
predicted <- predict(model, test)
names(predicted)
#This returns a list with three variables:
#class: The predicted class
#posterior: The posterior probability that an observation belongs to each class(Setosa etc)
#x: The linear discriminants

#view predicted class for first six observations in test set
head(predicted$class)

#view posterior probabilities for first six observations in test set
head(predicted$posterior)

#view linear discriminants for first six observations in test set
head(predicted$x)


#find accuracy of model
mean(predicted$class==test$Species)


#define data to plot
lda_plot <- cbind(train, predict(model)$x)

#create plot
ggplot(lda_plot, aes(LD1, LD2)) +
  geom_point(aes(color = Species))
#3 clusters formed of setosa,versi,virginica
