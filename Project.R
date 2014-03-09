#load data from URL
load(url("http://bit.ly/dasi_gss_data"))
View(gss)

#thesis topic
#1. how does education affect current income?  
#2. how does family income at 16 affect education?
#3. how does family income at 16 affect current income?
#4. is there an interaction effect between education and family income at 16 on current income?

#variables to examine
#highest year of school completed
summary(gss$educ)

#highest education qualification
degree_table <- table(gss$degree)
prop.table(degree_table)

#constant income
summary(gss$coninc)

#family income when 16 years old
fam_income <- table(gss$incom16)
prop.table (fam_income)
