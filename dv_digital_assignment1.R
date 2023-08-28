#1. load libary
library(tidyverse)
#1. view dataset
view(diamonds) 


#datatype of diamonds dataset(dataframe)
class(diamonds) 
#2. datatype of cut variable in diamonds dataset(factor)
class(diamonds$cut)
#2. datatype of price variable in diamonds dataset(integer)
class(diamonds$price)


#3. Only display data from the diamonds dataset that have price more than than 
# 10000 and save as dia_price
dia_price <- diamonds %>% 
  filter(price >= 10000)
dia_price



#4. Use dia_price to plot carat vs price
install.packages('ggplot2')
library(ggplot2)
p<-ggplot(data=dia_price,aes(x=carat,price))
#mark is color and attribute is cut
p+geom_point(aes(color=cut))


# 5. Use dia_price and select following from clarity(VS1,VS2,VVS2) and save as dia_clarity
dia_clarity <- dia_price %>% filter(clarity == "VS1" | clarity == "VS2" | clarity == "VVS2")
dia_clarity


# 6. use dia_clarity to plot carat vs price. Include "cut" and "clarity" attributes using 2 different marks in same plot
p<-ggplot(data=dia_clarity,aes(x=carat,price))

#first mark is alpha and use cut attribute as factor
#second mark is color and use clarity attribute as factor.
p+geom_point(aes(alpha=factor(cut),color=factor(clarity)))
