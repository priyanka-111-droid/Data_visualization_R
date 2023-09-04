install.packages('corrplot')
library(corrplot)


#correlation matrix
M<-cor(mtcars)
head(round(M,2)) #correlations coefficients between the possible pairs of variables
corrplot(M,method="circle") #correlogram needs M(correlation matrix)
corrplot(M,method="pie")
corrplot(M,method="number")

library(RColorBrewer)
#Types of correlogram layout
# "full" (default) : display full correlation matrix
#"upper": display upper triangular of the correlation matrix
#"lower": display lower triangular of the correlation matrix
corrplot(M, type="upper")
corrplot(M, type="lower")

#The correlation matrix can be reordered according to the correlation 
#coefficient. This is important to identify the hidden structure and 
#pattern in the matrix. "hclust" for hierarchical clustering order is 
#used in the following examples.
corrplot(M, type="upper", order="hclust")

# Using different color spectrum
col<- colorRampPalette(c("red", "white", "blue"))(20)
corrplot(M, type="upper", order="hclust", col=col)

## Change background color to lightblue
corrplot(M, type="upper", order="hclust", col=c("black", "white"),
         bg="lightblue")

library(RColorBrewer)
corrplot(M, type="upper", order="hclust", 
         col=brewer.pal(n=8, name="RdBu"))
corrplot(M, type="upper", order="hclust",
         col=brewer.pal(n=8, name="RdYlBu"))
corrplot(M, type="upper", order="hclust",
         col=brewer.pal(n=8, name="PuOr"))

#Changing the color and the rotation of text labels
#tl.col (for text label color) and tl.srt (for text label string rotation) 
#are used to change text colors and rotations.
corrplot(M, type="upper", order="hclust", tl.col="black", tl.srt=45)

#Correlation matrix with significance levels (p-value)
#The function rcorr() [in Hmisc package] can be used to compute the 
#significance levels for pearson and spearman correlations. It returns 
#both the correlation coefficients and the p-value of the correlation 
#for all possible pairs of columns in the data table.
install.packages("Hmisc")
library("Hmisc")
res2 <- rcorr(as.matrix(my_data))
res2
#The output of the function rcorr() is a list containing the following 
#elements : - r : the correlation matrix - n : the matrix of the number 
#of observations used in analyzing each pair of variables - P : the 
#p-values corresponding to the significance levels of correlations.

# Extract the correlation coefficients
res2$r
# Extract p-values
res2$P

# Insignificant correlation are crossed
corrplot(res2$r, type="upper", order="hclust", 
         p.mat = res2$P, sig.level = 0.01)

# Insignificant correlations are leaved blank
corrplot(res2$r, type="upper", order="hclust", 
         p.mat = res2$P, sig.level = 0.01, insig = "blank")

#display a chart of a correlation matrix
install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
my_data <- mtcars[, c(1,3,4,5,6,7)]
chart.Correlation(my_data, histogram=TRUE, pch=19)
#Each significance level is associated to a symbol : 
#p-values(0, 0.001, 0.01, 0.05, 0.1, 1) <=> symbols("***", "**", 
#"*", ".", " ")