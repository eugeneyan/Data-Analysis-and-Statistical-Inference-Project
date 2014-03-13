#load data from URL
load(url("http://bit.ly/dasi_gss_data"))
View(gss)

#thesis topic
#1. how does education affect current income?  
#2. how does family income at 16 affect education?
#3. how does family income at 16 affect current income?
#4. is there an interaction effect between education and family income at 16 on current income?

#subsetting the data
gss1 <- subset(gss, select = c(caseid, year, age, sex, educ, degree, coninc, incom16))
View(gss1)

#variables to examine
#highest year of school completed
summary(gss$educ)

#highest education qualification
degree_table <- table(gss$degree)
degree_table
prop.table(degree_table)
plot(gss$degree)

#constant income
summary(gss$coninc)
hist(gss$coninc, xlab = "total family income")
?hist

#family income when 16 years old
fam_income <- table(gss$incom16)
prop.table (fam_income)

#exploratory analysis
model <- lm(gss$coninc ~ gss$degree)
summary(model)
plot(gss$coninc ~ gss$degree, xlab = "education level", ylab = "total family income")
anova(model)
