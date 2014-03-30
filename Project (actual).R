#load data from URL
load(url("http://bit.ly/dasi_gss_data"))
View(gss)
str(gss)
summary(gss)

#subset data for 2012
gss2012a <- subset(gss, year == 2012, select = c(caseid, year, age, sex, educ, degree, coninc, incom16))
gss2012 <- subset(gss2012a, !is.na(degree))
summary(gss2012)

?subset

#R markdown template
download.file(url = "http://bit.ly/dasi_project_template", destfile = "dasi_project_template.Rmd")

#inference function
source("http://bit.ly/dasi_inference")
#load libraries
library(psych)
library(lattice)
library(ggplot2)

#thesis topic
#1. how does education affect current income?  
#2. how does family income at 16 affect education?
#3. how does family income at 16 affect current income?
#4. is there an interaction effect between education and family income at 16 on current income?

#Exploratory Data Analysis
#degree
summary(gss2012$degree)
table(gss2012$degree)
prop.table(table(gss2012$degree))
barplot(table(gss2012$degree))

#income
summary(gss2012$coninc)
hist(gss2012$coninc)
hist(gss2012$coninc, breaks = 15)

#overlapping plots of income by education
g <- ggplot(gss2012, aes(coninc))
g + geom_density() + labs(title = "Distribution of income in 2012") + labs(x = "Total Family Income", y = "Frequency")

g <- ggplot(gss2012, aes(coninc, fill = degree))
g + geom_density (alpha = 0.2) + labs(title = "Income Level distributions across Education Levels") + labs(x = "Total Family Income", y = "Frequency")
boxplot(gss2012$coninc ~ gss2012$degree, xlab = "Education Level", ylab = "Total Family Income", main = "Boxplot of Total Family Income by Education Level")

#boxplot of income vs degree
boxplot(gss2012$coninc ~ gss2012$degree, xlab = "Education Level", ylab = "Total Family Income", main = "Boxplot of Total Family Income by Education Level")

#distribution of current income by education level
Lt_High <- subset(gss2012, degree == "Lt High School")
High <- subset(gss2012, degree == "High School")
JC <- subset(gss2012, degree == "Junior College")
Bach <- subset(gss2012, degree == "Bachelor")
Grad <- subset(gss2012, degree == "Graduate")

par(mfrow = c(5,1))
hist(Lt_High$coninc)
hist(High$coninc)
hist(JC$coninc)
hist(Bach$coninc)
hist(Grad$coninc)

#ggplot
ggplot(gss2012$coninc, aes(length, fill = gss2012$degree)) + geom_density(alpha = 0.2)
gss2012i <- structure(c(gss2012$coninc, gss2012$degree), dim = c(1974,2), dimnames = list(c("coninc"), c("degree")))

#anova of gss2012$coninc ~ gss2012$degree
inference(y = gss2012$coninc, x = gss2012$degree, est = "mean", type = "ht", null = 0, alternative = "greater", method = "theoretical")

#anova of gss2012$coninc ~ gss2012$incom16
inference(y = gss2012$coninc, x = gss2012$incom16, est = "mean", type = "ht", null = 0, alternative = "greater", method = "theoretical")

#regression models
#current income ~ education level
model1 <- lm(gss2012$coninc ~ gss2012$degree)
summary(model1)

#current income ~ income at age of 16
model2 <- lm(gss2012$coninc ~ gss2012$incom16)
summary(model2)

#current income ~ education level + income at age of 16
model3 <- lm(gss2012$coninc ~ gss2012$degree + gss2012$incom16)
summary(model3)

plot(model1)
plot(gss2012$coninc ~ gss2012$degree)
