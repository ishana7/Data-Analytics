

#give details of iris dataset  

library (datasets)
data("iris")

#display attributes of iris dataset
names(iris)

#display dimensions of dataset
dim(iris)

#view the contents of dataset
View(iris)

#internal strucutre of dataset
str(iris)

#minimum value
# symbol "$" is used to choose attribute of dataset
min(iris$Sepal.Length)
min(iris$Sepal.Width)

#max value
max(iris$Sepal.Length)
max(iris$Sepal.Width)

#mean value
mean(iris$Sepal.Length)

# range of attribute value
range(iris$Sepal.Length)

#standard deviation
sd(iris$Sepal.Length)

#variance
var(iris$Sepal.Length)

# 1st 2nd and all quantile
quantile(iris$Sepal.Length)

# 1st 2nd and all quantile
quantile(iris$Sepal.Length,c(0.3,0.6,0.9))

#drawing histogram

h<-hist(iris$Sepal.Length,main= "sepal length frequency- histogram", xlab="sepal length", xlim=c(3.5,8.5), col="blue")


h<-hist(iris$Sepal.Length,main= "sepal length frequency- histogram", xlab="sepal length", xlim=c(3.5,8.5), col="blue", labels=
          
          TRUE, breaks =3)


h<-hist(iris$Sepal.Length,main= "sepal length frequency- histogram", xlab="sepal length", xlim=c(3.5,8.5), col="blue", labels=
          
          TRUE, breaks =3, border = "green",las = 2)

h<-hist(iris$Sepal.Width,main= "sepal length frequency- histogram", xlab="sepal Width", xlim=c(1.5,5.5), col="blue", labels=
          
          TRUE, breaks =3, border = "green",las = 2)

#boxplot code
boxplot(iris$Sepal.Length,main = "Boxplot", xlab = "Length")
boxplot(iris$Sepal.Width,main = "Boxplot", xlab = "Width")

#display summary of boxplot

summary(iris$Sepal.Length)

#combined boxplot for all 4 feature
boxplot(iris[,-5])

#identify outliers
myboxplot<-boxplot(iris[,-5])
myboxplot$out

