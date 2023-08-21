install.packages("nycflights13")
install.packages('ggplot2')
library(nycflights13)
library(tidyverse)
library(ggplot2)
attach(mtcars)
view(mtcars)
mtcars_data <-mtcars
view(mtcars_data)
?flights
data(flights)
colnames(flights)
view(flights)
flight <- flights %>% select(year, month, day, dep_delay, 
                             arr_delay, distance, air_time )
View(flight)
#Now we will create two new variables- time_gain by subtracting arr_delay 
#from dep_delay and speed by dividing distance by air_time and multiplying with 60.
# use mutate to derive new variable
flight_mutate <- flight %>% 
  mutate(time_gain = dep_delay - arr_delay ,
         speed = distance / air_time * 60)
View(flight_mutate)
mtcars_data$am<-factor(mtcars_data$am,levels=c(0,1),
                       labels=c("Automatic","Manual"))
view(mtcars_data)

#line plot
ggplot(mtcars_data %>% filter(am == "Automatic")) +
  geom_line(aes(x = mpg, y = disp), 
            lwd = 1.25, color = 'darkgreen') +
  
  ggtitle("Basic Line Plot", subtitle = "name - mtcars") +
  xlab("mpg") +
  ylab("disp") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#Line Plot with feature differentiation by color & line type
ggplot(mtcars_data) +
  geom_line(aes(x = mpg, y = disp, 
                color = am, lty = am), lwd = 1.25) +
  
  ggtitle("Line Plot with feature differentiation") +
  xlab("mpg") +
  ylab("disp") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#Basic Bar Plot
#for Fill,use data with few variations only.Not depth
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

# graphing the frequency/count of the cut categories
diamonds %>% 
  ggplot(aes(x = cut, fill = cut)) + # removed y argument and value
  geom_bar()
#is same as
diamonds %>% 
  ggplot(aes(x = cut, fill = cut)) + # removed y argument and value
  geom_bar(stat = "count")

#Stacked Bar Plot
data(diamonds)
view(diamonds)
diamonds %>% 
  ggplot(aes(x = cut, fill = clarity)) + # removed y argument and value
  geom_bar() +
  ggtitle("Stacked Bar Plot") +
  xlab("CUT") +
  ylab("COUNT") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))

#Stacked Bar Plot in same height
data_diamonds <- diamonds
ggplot(data_diamonds) +
  geom_bar(aes(x = cut, fill = clarity), position = 'fill') +
  
  ggtitle("Stacked Bar Plot (same height)") +
  xlab("CUT") +
  ylab("COUNT") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))

#Grouped Bar Plot
ggplot(data_diamonds) +
  geom_bar(aes(x = cut, fill = clarity), position = 'dodge') +
  
  ggtitle("Grouped Bar Plot") +
  xlab("CUT") +
  ylab("COUNT") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


# this calculates the total cost of all diamonds within each clarity category
diamonds %>% 
  ggplot(aes(x = clarity, y = price)) + 
  geom_bar(stat = "identity") 

#tiles plot
ggplot(as.data.frame(table(data_diamonds$cut, 
                           data_diamonds$color))) +
  geom_tile(aes(x = Var1, y = Var2, fill = Freq)) +
  geom_text(aes(x = Var1, y = Var2, label = Freq), 
            color = "yellow") +
  
  ggtitle("Tiles Plot") +
  xlab("CUT") +
  ylab("COLOR") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#histogram
ggplot(data_diamonds) +
  geom_histogram(aes(x = price), fill = 'blue', 
                 color = "lightblue", binwidth = 500)+
  
  ggtitle("Basic Histogram") +
  xlab("PRICE") +
  ylab("Frequency") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#stacked histogram
ggplot(data_diamonds) +
  geom_histogram(aes(x = price, fill = cut), 
                 color = "lightblue", binwidth = 500)+
  
  ggtitle("Stacked Histogram") +
  xlab("PRICE") +
  ylab("Frequency") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))

#density plot
#A density plot is a representation of the distribution of a 
#numeric variable. It uses a kernel density estimate to show the 
#probability density function of the variable (see more). It is a 
#smoothed version of the histogram and is used in the same concept.
ggplot(data_diamonds) +
  geom_density(aes(x = price, 
                   fill = cut), alpha = 0.7)+
  
  ggtitle("Density Plot") +
  xlab("price") +
  ylab("Density") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))

dataneeded<-mtcars[c(3,10)]
view(dataneeded)
ggplot(dataneeded) +
  geom_density(aes(x = disp,
                   fill = gear), alpha = 0.4) +
  facet_wrap(~gear)

#multiple density plots
ggplot(gdp_gather) +
  geom_density(aes(x = GDP,
                   fill = Country_Name, adjust=1.5), alpha = 0.4) +
  facet_wrap(~Country_Name)

#boxplot
ggplot(data_diamonds) +
  geom_boxplot(aes(x = cut, y = carat, fill = cut)) +
  
  ggtitle("Basic Box Plot") +
  xlab("CUT") +
  ylab("CARAT") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))

#grouped boxplot
ggplot(data_diamonds) +
  geom_boxplot(aes(x = cut, y = carat, fill = clarity)) +
  
  ggtitle("Grouped Box Plot") +
  xlab("CUT") +
  ylab("CARAT") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#violin plot
ggplot(data_diamonds) +
  geom_violin(aes(x = cut , y = carat, fill = cut)) +
  
  ggtitle("Violin Plot") +
  xlab("CUT") +
  ylab("CARAT") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))

# if cut is fair,max carats are 1

#Ridge Plot
install.packages("ggridges")
library(ggridges)
ggplot(data_diamonds) +
  geom_density_ridges(aes(x = carat , y = cut, 
                          fill = clarity), alpha = 0.7) +
  
  ggtitle("Ridge Plot") +
  xlab("carat") +
  ylab("CUT") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))
#choose column with less variation
# if cut is fair, max data is having clarity IF.
