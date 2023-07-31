#To install package dslabs, Tools->Install Package
library(dslabs) #after installing,if we want to use package
# Ctrl+Enter used for execution of package

#Without using Tools->Install Package
install.packages("tidyverse") 
library(tidyverse) #to use package

installed.packages()

#define variables
a<-1
b<-1
c<-1

#see value of a
a
print(a)

#see all variables saved in workspace
ls()
a <-sqrt(b)
a

#to see help
?log
args(log)
?"+"

#see all available datasets
data()

#see dataset
co2

#to see datatype
class(a) #numeric - float data too,integer - no float

library(dslabs)
data(murders) #environment frame
#datatype of murders(dataframe)
class(murders) 

#info about murders dataset -don't have to execute class() and data() separately
str(murders) 

#first 6 lines using head()
head(murders) 

#investigate population variable(column) in murders dataset
# $ is called accessor operator
murders$population 
murders$p # allowed as only population var starts with p

#access variable name(fields)
names(murders)

#copy column contents to variable pop
pop<-murders$population
length(pop)
length(murders$abb)
class(pop)
class(murders$state)


#logical datatype
z<-3==2
z
class(z)

#factors datatype(categorical data storage)
class(murders$region)
levels(murders$region) #levels for categorical data

#plot data
summary(murders)
plot(murders$region)

#points and lines
plot(murders$population,type="p") #point type not for categorical data
plot(murders$population,type="l")
plot(murders$population,type="b")
plot(murders$population)
plot(murders$population,type="h") #high density population lines
#box plot - 
# 1st meaning - concise
# 2nd meaning - min, Q1,median ,Q3,max, Q1 to Q4 is IQ.min to Q1 and Q3 to max is whisker
# 3rd meaning 
# - normal skew-median in center
# - positive(right) skew - median close to min 
# - else negative(left) skew
# can also see outliers
plot(murders$region,murders$population) 

#labels and title
plot(murders$region,xlab="names",ylab="No of Instances",main="region plot",col="green")

#horizontal bar plot
barplot(murders$population, main = 'population plot',xlab = 'values', ylab = 'No of Instances', col= 'green',horiz = TRUE)

#vertical bar plot
barplot(murders$population, main = 'population plot',xlab = 'No of Instances', ylab = 'values', col= 'green',horiz = FALSE)

#histogram:represents frequencies of variable bucketed into ranges
#ignore categorical data
hist(murders$population,breaks=3) #so 3 bins
hist(murders$population, main = 'population',xlab = 'values', col='red')

#box plot
boxplot(murders$population)

?par #subplot, plot diff thing in each part
#bty - type of box drawn about points(o,l,c,u,j,7),las - style of axis labels, 
par(mfrow=c(3,3),mar=c(3,5,2,1),las=0,bty="n")
plot(murders$region)
plot(murders$population, type= "p")
plot(murders$population, type= "l")
plot(murders$population, type= "b")
plot(murders$region, murders$population)
hist(murders$population, main = 'population',xlab = 'values', col='red')
barplot(murders$population, main = 'population plot',xlab = 'values', ylab = 'No of Instances', col= 'green',horiz = TRUE)
plot(murders$population, type= "h")
boxplot(murders$region)

plot(murders) #cannot interpret this as very big dataset!!!
