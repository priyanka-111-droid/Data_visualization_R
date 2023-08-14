#Acquiring and plotting data - factors(),ggplot2,gather(),gsub(),spread(),line plot using filter


install.packages('ggplot2')
library(ggplot2)
library(tidyverse)
attach(mtcars)
mtcars_data <-mtcars
view(mtcars_data)


# create factors with value labels
mtcars_data$gear<-factor(mtcars_data$gear,levels=c(3,4,5),
        labels=c("3gears","4gears","5gears"))
mtcars_data$cyl<-factor(mtcars_data$cyl,levels=c(4,6,8),
                        labels=c("4cyl","6cyl","8cyl"))
mtcars_data$am<-factor(mtcars_data$am,levels=c(0,1),
                       labels=c("Automatic","Manual"))
view(mtcars_data)



#use ggplot2, aes is what you use on x and y axis
data(mtcars_data)
p<-ggplot(data=mtcars_data,aes(x=wt,mpg))
p+geom_point() #scatter plot
p+geom_point(aes(color=qsec)) #qsec is column. 
#negative correlation.light blue for high qsec, dark blue for low qsec
#multivariate analysis(1 att on x axis,1 att on y axis,another att for mark)
#mark means multivariate analysis
#here mark is color and attribute is qsec
p+geom_point(aes(alpha=qsec))
#here, mark is alpha and attribute is qsec.
#negative correlation. light rep is low qsec,dark is high qsec
p+geom_point(aes(size=qsec))
#here, mark is size and attribute is qsec
#negative correlation.small size is low qsec
p+geom_point(aes(shape=factor(cyl)))
#negative correlation bwn wt and mpg.
#Here mark is shape,3 types of shapes available.
#using cyl attribute as factor
p+geom_point(aes(shape=factor(cyl),color=factor(cyl)))
#negative correlation
#wrt cyl,wt and mpg having cluster kind of data
p+geom_point(aes(shape=factor(qsec),color=factor(cyl)))
#here qsec has many types of value like 15 ,15.5.
#when u use qsec as shape, only 3 values have shape,rest dont have
#qsec not good choice to assign as factor
#qsec not good to be used as mark too.
p+geom_point(aes(shape=factor(carb),color=factor(cyl)))
#2 attributes added-carb and cyl, to be used as marks
p+geom_point(aes(shape=factor(am),color=factor(cyl),size=factor(carb)))
#3 attributes as marks(am,cyl,carb)



#gather() - transform data,see in different way
Country_Name <- c('Qatar','United States','Germany','United Kingdom','Canada') #vector type data
Y2009<-c(59094,47000,41567,40890,56789)
Y2010<-c(89000,87000,45000,98000,67000)
Y2011<-c(78000,12000,45000,56000,89000)
#combine all columns to make own dataset
gdp<-data.frame(Country_Name,Y2009,Y2010,Y2011)
view(gdp)
gdp_gather<- gdp %>% gather("Year","GDP",2:4) #changing representation of columns 2 to 4
view(gdp_gather)
gdp_gather$Year<-gsub("[a-zA-Z]","",gdp_gather$Year)#exclude (character)Y from Y2009 etc.
gdp_gather$year<-as.integer(gdp_gather$Year) #convert to integer
view(gdp_gather)
glimpse(gdp_gather)

attach(mtcars)
mtcars_data<-mtcars
view(mtcars_data)
mtcars_data$cyl<-gsub("[[:digit:]]+","",mtcars_data$cyl) #exclude digit part from cyl column


#spread() - transformation
Student <- c('Jack', 'Jack', 'Jack', 'Jack', 'Jack', 'Jack',
             'Rose', 'Rose', 'Rose', 'Rose', 'Rose', 'Rose')
Subject <- c('English', 'Biology', 'Chemistry', 'Maths', 'Physics',
             'Social Science', 'English', 'Biology', 'Chemistry',
             'Maths', 'Physics', 'Social Science')
Marks <- c(80, 70, 87, 75, 90, 82, 65, 70, 88, 92, 79, 93)
reportCard <- data.frame(Student, Subject, Marks)
View(reportCard)
reportCard_spread1 <- reportCard %>% spread(Subject, Marks)
View(reportCard_spread1)
reportCard_spread2 <- reportCard %>% spread(Student,Marks)
View(reportCard_spread2)


#Basic line plot using filter
view(mtcars_data)
mtcars_data$am <- factor(mtcars_data$am,levels=c(0,1),  
                         labels=c("Automatic","Manual"))
ggplot(mtcars_data %>% filter(am == "Automatic")) +
  geom_line(aes(x = mpg, y = disp), 
            lwd = 1.25, color = 'darkgreen') +
  ggtitle("Basic Line Plot", subtitle = "name - mtcars") +
  xlab("mpg") +
  ylab("disp") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))

ggplot(mtcars_data) +
  geom_line(aes(x = mpg, y = disp, 
                color = am, lty = am), lwd = 1.25) +
  ggtitle("Line Plot with feature differentiation") +
  xlab("mpg") +
  ylab("disp") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


view(diamonds)
diamonds %>%
  ggplot(aes(x = cut, y = mean(price), fill = cut)) +
  geom_bar(stat = "identity") +
  ggtitle("Basic Bar Plot") +
  xlab("CUT") +
  ylab("price") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#Bar charts
diamonds %>%
  ggplot(aes(x = cut, fill = cut)) + # removed y argument and value
  geom_bar()
#is same as
diamonds %>%
  ggplot(aes(x = cut, fill = cut)) + # removed y argument and value
  geom_bar(stat = "count")


diamonds %>%
  ggplot(aes(x = clarity, y = price)) +
  geom_bar(stat = "identity")


ggplot(diamonds) +
  geom_density(aes(x = price, 
                   fill = cut), alpha = 0.7)+
  ggtitle("Density Plot") +
  xlab("price") +
  ylab("Density") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))

#read.csv to read csv file