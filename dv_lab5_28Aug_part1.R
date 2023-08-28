install.packages("ggpubr")
library(ggplot2)
library(tidyverse)
library("ggpubr")
attach(mtcars)
mtcars_data <- mtcars
mtcars_data$gear<-factor(mtcars_data$gear,levels=c(3,4,5),
                         labels=c("3gears","4gears","5gears")) #convert to factor
view(mtcars_data)

p <- ggplot(data = mtcars_data, aes(x = wt, mpg))
p+geom_point()
sp <- p + geom_point(aes(color = factor(mtcars_data$gear)))
sp
#for seq data,use seq color palette
#for diverging data,use div palette
#for cat data,qualitative palette

#change color manually
sp + scale_color_manual(values=c("red", "green", "blue"))
sp + scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))
#Using RColorBrewer palettes
install.packages("RColorBrewer")
library("RColorBrewer")
display.brewer.all()
#There are 3 types of palettes : sequential, diverging, and qualitative.
#Sequential palettes are suited to ordered data that progress from low to 
#high (gradient). The palettes names are : Blues, BuGn, BuPu, GnBu, Greens, 
#Greys, Oranges, OrRd, PuBu, PuBuGn, PuRd, Purples, RdPu, Reds, YlGn, YlGnBu 
#YlOrBr, YlOrRd.
#Diverging palettes put equal emphasis on mid-range critical values and 
#extremes at both ends of the data range. The diverging palettes are : 
#BrBG, PiYG, PRGn, PuOr, RdBu, RdGy, RdYlBu, RdYlGn, Spectral
#Qualitative palettes are best suited to representing nominal or categorical 
#data. They not imply magnitude differences between groups. The palettes names 
#are : Accent, Dark2, Paired, Pastel1, Pastel2, Set1, Set2, Set3

# View a single RColorBrewer palette by specifying its name
display.brewer.pal(n = 11, name = 'RdBu')
sp + scale_color_brewer(palette="RdBu")


#color_gradient for continuous data
#Use gray colors
sp + scale_color_grey() + theme_classic()
#Gradient colors for scatter plots
sp2<-ggplot(mtcars, aes(x=wt, y=mpg, color=qsec)) + geom_point()
sp2
sp2+scale_color_gradient(low="blue", high="red") # Sequential color scheme




# Diverging color scheme
mid<-mean(mtcars$qsec)
sp2+scale_color_gradient2(midpoint=mid, low="blue", mid="white",
                          high="red", space ="Lab" )
?scale_color_gradient2
# Gradient between n colors
sp2+scale_color_gradientn(colours = rainbow(5))
# Use rainbow colors
barplot(1:5, col=rainbow(5))
# Use heat.colors
barplot(1:5, col=heat.colors(5))
# Use terrain.colors
barplot(1:5, col=terrain.colors(5))
# Use topo.colors
barplot(1:5, col=topo.colors(5))
# Use cm.colors
barplot(1:5, col=cm.colors(5))

