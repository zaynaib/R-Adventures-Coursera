library(datasets)
data(iris)
?iris
#Question
# what is the mean of 'Sepal.Length' for the species virginica?
#I want a subset of row eqaul to virginica
#mean(x, trim = 0, na.rm = FALSE, ...)

newdata <- subset(mydata, age >= 20 | age < 10, 
                  select=c(ID, Weight))

irisV<- subset(iris,Species == 'virginica',select=Sepal.Length )
lapply(irisV,mean)


iris[iris$Species=='virginica',]
iris[iris$Species=='virginica',]

#Question 2
#Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
colMeans(iris)

apply(iris, 1, mean)

apply(iris[, 1:4], 1, mean)

apply(iris, 2, mean)

rowMeans(iris[, 1:4])

#apply(iris[, 1:4], 2, mean)

#Question 3

#How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.

library(datasets)
data(mtcars)

#with(mtcars, tapply(mpg, cyl, mean))

#tapply(mtcars$mpg, mtcars$cyl, mean)

sapply(mtcars, cyl, mean)

split(mtcars, mtcars$cyl)

apply(mtcars, 2, mean)

tapply(mtcars$cyl, mtcars$mpg, mean)

#sapply(split(mtcars$mpg, mtcars$cyl), mean)

mean(mtcars$mpg, mtcars$cyl)

lapply(mtcars, mean)

#Question 4
# average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars

tapply(mtcars$hp, mtcars$cyl, mean)

127
#Question 5