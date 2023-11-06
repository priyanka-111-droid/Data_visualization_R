#-----QUESTION 1-----#
# Install and load the required library
install.packages("readr")
install.packages("reshape2")
install.packages("dplyr")
library(readr)
library(reshape2)
library(ggplot2)
library(dplyr)
library(lattice)

# Provide the full path to your local CSV files
website_traffic_path <- "C:\\Pooja\\VIT_SEM7\\Data_visualisation_R\\website-traffic.csv"
room_temperature_path <- "C:\\Pooja\\VIT_SEM7\\Data_visualisation_R\\room-temperature.csv"

# Load datasets
website_traffic <- read_csv(website_traffic_path)
room_temperature <- read_csv(room_temperature_path)

# View the data
View(website_traffic)
View(room_temperature)




#-------QUESTION 2-----------#
# Plot day of the week-wise average visit
avg_visits_plot <- ggplot(website_traffic, aes(x = DayOfWeek, y = Visits)) +
  geom_bar(stat = "summary", fun = "mean", fill = "skyblue") +
  labs(title = "Day of Week-wise Average Visit",
       x = "Day of Week",
       y = "Average Visits")

print(avg_visits_plot)




#----------QUESTION 3--------#
website_traffic$temp1<-gsub("[[:digit:]]","",website_traffic$MonthDay)
View(website_traffic)
ggplot(data=website_traffic,aes(x=DayOfWeek,y=Visits))+
  geom_point(aes(color=factor(temp1)))+
  ggtitle(label="Visits per DayOfWeek graph 1")
ggplot(data=website_traffic,aes(x=DayOfWeek,y=Visits))+
  geom_point(aes(shape=factor(temp1)))+
  ggtitle(label="Visits per DayOfWeek graph 2")





#----------QUESTION 4--------#
# Create a dataframe for boxplot
boxplot_data <- room_temperature[, c("FrontLeft", "FrontRight", "BackLeft", "BackRight")]

# Plot boxplot
boxplot_plot <- ggplot(melt(boxplot_data), aes(x = variable, y = value)) +
  geom_boxplot() +
  labs(title = "Boxplot of Temperature Sensors",
       x = "Sensor",
       y = "Temperature")

print(boxplot_plot)



#----------QUESTION 5----------#
# Reshape data for density plot
density_data <- melt(room_temperature[, c("FrontLeft", "FrontRight", "BackLeft", "BackRight")])

# Plot density plot with facet_wrap
density_plot <- ggplot(density_data, aes(x = value, fill = variable)) +
  geom_density(alpha = 0.7) +
  facet_wrap(~variable, scales = "free_y") +
  labs(title = "Density Plot of Temperature Sensors",
       x = "Temperature",
       y = "Density")

print(density_plot)

