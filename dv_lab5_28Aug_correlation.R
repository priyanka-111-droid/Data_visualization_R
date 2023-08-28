#correlation

install.packages("ggpubr")
library(ggplot2)
library(tidyverse)
library("ggpubr")

my_data <- mtcars
head(my_data, 6)


#correlation between 2 variables mpg and wt
ggscatter(my_data, x = "mpg", y = "wt", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Miles/(US) gallon", ylab = "Weight (1000 lbs)")
#To show linear rel, we have used pearson. form the plot, the relationship is linear. In the situation where the 
#scatter plots show curved patterns, we are dealing with nonlinear 
#association between the two variables.
#negative correlation.




#Pearson Correlation test between mpg and wt variables:
res <- cor.test(my_data$wt, my_data$mpg,method = "pearson")
res
#The p-value of the test is 1.294e^{-10}, which is less than the 
#significance level alpha = 0.05. We can conclude that wt and mpg are 
#significantly correlated with a correlation coefficient of -0.87 and 
#p-value of 1.29410^{-10} .

# Extract the p.value
res$p.value
# Extract the correlation coefficient
res$estimate #between wt and mpg



#Kendall rank correlation test
res2 <- cor.test(my_data$wt, my_data$mpg,  method="kendall")
res2
#The correlation coefficient between x and y are -0.7278 and the p-value is 6.70610^{-9}.



#Spearman rank correlation coefficient
res3 <-cor.test(my_data$wt, my_data$mpg,  method = "spearman")
res3
#The correlation coefficient between x and y are -0.8864 and the p-value is 1.48810^{-11}.


#CORRELATION MATRIX
M<-cor(mtcars)
head(round(M,2)) #correlations coefficients between the possible pairs of variables
