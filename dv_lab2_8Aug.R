library(dslabs)
data(murders)
region <- murders$region
region
value <- murders$total
value
region <- reorder(region, value, FUN = sum)
region
levels(region)



record <- list(name = "John Doe",
               student_id = 1234,
               grades = c(95, 82, 91, 97, 93),
               final_grade = "A")
record
class(record) #datatype
record$student_id
record[["student_id"]]
record2 <- list("John Doe", 1234)
record2
record2[[1]]



mat <- matrix(1:12, 4, 3)
mat
mat[2, 3]
mat[2, ]
mat[, 3]
mat[, 2:3]
mat[1:2, 2:3]
mat1 <- matrix(1:24, 4, 3)
mat1

as.data.frame(mat)

codes <- c(380, 124, 818)
codes
library(tidyverse)
view(codes)
country <- c("italy", "canada", "egypt")
view(country)
country1 <- c('italy', 'canada', 'egypt')
country1
misc <- c('italy', 'canada', 'egypt', 500)
view(misc)


codes <- c(italy = 380, canada = 124, egypt = 818)
view(codes)
class(codes)
names(codes)


seq(1, 10)
seq(1, 10, 2)
1:10
class(1:10)
class(seq(1, 10, 0.5))

codes[2]
codes[c(1,3)]
codes[1:2]
codes[c("egypt","italy")]


x <- c(1, "canada", 3)
x
class(x)


x <- 1:5
y <- as.character(x)
y
class (y)
as.numeric(y)


x <- c("1", "b", "3")
class(x)
as.numeric(x)
h <- c("1", "3")
class(h)
as.numeric(h)


library(dslabs)
data(murders)
view(murders)
sort(murders$total)


?airquality
data(airquality)
view(airquality)
summary(airquality)
par(mfrow=c(1,1))
plot(airquality)


boxplot(airquality[,1:3], main='Multiple Box plots')

install.packages("lattice")
library(lattice)


attach(mtcars)
view(mtcars)
head(mtcars)
mtcars_data <- mtcars

densityplot(carb, main="Density Plot",  xlab="density value")
splom(mtcars[c(1,3,4,5,6)], main="MTCARS Data")


