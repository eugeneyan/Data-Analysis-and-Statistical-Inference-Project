### What is the relationship between one’s highest level education level attained and one’s income?




### Introduction:

“An investment in education pays the best interest” - Benjamin Franklin.  The quote above suggests that 

What is the relationship between one’s highest level education level attained and one’s income?

### Data:

To examine the research question above, this paper will be using data from the General Social Survey (“GSS”), a sociological survey used to collect data on demographic characteristics and attitudes of residents of the United States.  While the GSS provides data from 1972 - 2012, to simplify the analyses, I will examine only responses from the year 2012.  The intent is to control for possible confounding variables including time, improvements in the education system, and rising levels of income.  

Data collection for the GSS was conducted through (i) computer-assisted personal interviews, (ii) face-to-face interviews, (iii) and telephone interviews).  For the 2012 GSS data, the cases were a sample of all English and Spanish speaker people age 18 and over who were living in households at the time of the survey (or non-institutionalised) in the US.  The two variables studied are the highest level of education attained (“education”) and total family income in constant dollars (“income”); given that there is no data collected on personal income, total family income will be examined as a proxy instead.  In addition, while a measure of income in current dollars is available, I will examine income in constant dollars (i.e., inflation-adjusted income) to allow for comparison across time in future studies.  Education is a categorical level with 5 levels (i.e., “Less than High School”, “High School”, “Junior College”, “Bachelor”, “Graduate” (i.e., Masters and above) and is labeled “degree" in the dataset.  Income is a continuous variable ranging from $383 - $178712, with a median of $34470, and is labeled “coninc” in the data set.

The type of study is an observational study given that no random assignment of individuals to different conditions/treatments was conducting.  With regard to sampling, full probability sampling, where every individual had a chance of being selected, was conducted; notwithstanding, there are some exceptions to this which will be discussed below.  The sampling methodology is stratified sampling, where the population was stratified first by region followed by country.  With regard to experimental design, there was no random assignment of individuals to different conditions or treatments.  

With regard to generalizability, the population of interest is the working US population.  Given that the GSS data was collected via full probability sampling on the entire US population, the findings from this paper can be generalised to the entire working US population.  Potential sources of bias in the GSS may arise given that the GSS does not sample from (i) minors and (ii) people who do not speak either English and Spanish.  With regard to (i), the bias is likely to be minor (pun intended) given that our interest is examining one’s personal income; this is based on the assumption that minors are likely to still be pursuing an education and not have an income.  With regard to (ii), a quick check and calculation from a 2011 Census on language use in the US suggests that 0.294% of the US population do not speak English and/or Spanish.  Taking the above into account, the biases from the GSS are likely to have a negligible impact on the generalizability of this study.

With regard to causality, the data cannot be used to establish causal links between the variables of interest as there was no random assignment to the explanatory/independent variable (i.e., education).  Morally, randomly assignment people to different levels of education would be highly unethical.

### Exploratory data analysis:


```
## Lt High School    High School Junior College       Bachelor       Graduate 
##            222            869            130            319            180
```

```
## Lt High School    High School Junior College       Bachelor       Graduate 
##        0.12907        0.50523        0.07558        0.18547        0.10465
```

From the table above, we observe that most of the US population have education level of high school and below, with approximately 28.5% having a Bachelor, Masters, and above.  


```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##     383   16300   34500   48800   63200  179000
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

From the table above, the median income in the US in 2012 is $34470, with a mean of $48850, and a range of $383 - $178712.  The graph also shows that income distribution is bimodal and right skewed, with a gap between $125000 and $160000 another smaller peak at the top 10% of income.  

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-41.png) ![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-42.png) 

The box plot of income at different education levels suggests that there is a relationship between income and education.  An alternative visualization, the overlapping distribution plots, further bolsters the relationship between education and income, warranting a deeper investigation of the research question.

### Inference:

The hypotheses for this study are as stated below:   
Null Hypothesis: The mean income is the same across all levels of education.   
Alternative Hypothesis: At least one pair of mean incomes are different from each other.

There are three conditions for ANOVA, namely (i) independence, (ii) approximate normality, and (iii) equal variance.  For (i), the data was randomly sampled with full probability sampling, with the sample size for education group being less than 10% of the population and independent of each other.  For (ii), while the normal probability plots for each of the groups below show that the data is right skewed and deviates from normality, this is mitigated by the large samples sizes for each education group.  For (iii), the box plot of income by education level shows that there is roughly constant variance for the High School, Junior College, and Bachelor groups, while the Less that High School group has lower variance while the Graduate group has higher variance.  To address this, a non-parametric test such as the Kruskal-Wallis test can be used; however, this is not covered under the class syllabus.  Thus, this study will proceed with the ANOVA analysis.

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 



Given that the means between more than two groups (i.e., five) will be compared, the method to be used in this study is the analysis of variance (“ANOVA”).  The ANOVA analysis will compare the means across the five groups and determine if the observed differences are attributed to between group variability (i.e., education) or within group variability (other factors).  


```r
# anova of gss2012$coninc ~ gss2012$degree
inference(y = gss2012$coninc, x = gss2012$degree, est = "mean", type = "ht", 
    null = 0, alternative = "greater", method = "theoretical")
```

```
## Response variable: numerical, Explanatory variable: categorical
## ANOVA
## Summary statistics:
## n_Lt High School = 222, mean_Lt High School = 21657, sd_Lt High School = 22693
## n_High School = 869, mean_High School = 37665, sd_High School = 35146
## n_Junior College = 130, mean_Junior College = 46221, sd_Junior College = 39487
## n_Bachelor = 319, mean_Bachelor = 75871, sd_Bachelor = 55549
## n_Graduate = 180, mean_Graduate = 90371, sd_Graduate = 58309
```

```
## H_0: All means are equal.
## H_A: At least one mean is different.
## Analysis of Variance Table
## 
## Response: y
##             Df   Sum Sq  Mean Sq F value Pr(>F)
## x            4 8.17e+11 2.04e+11     118 <2e-16
## Residuals 1715 2.98e+12 1.74e+09               
## 
## Pairwise tests: t tests with pooled SD 
##                Lt High School High School Junior College Bachelor
## High School                 0          NA             NA       NA
## Junior College              0      0.0291             NA       NA
## Bachelor                    0      0.0000              0       NA
## Graduate                    0      0.0000              0    2e-04
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 


```
## [1] "Bonferroni Correction: Modified Significance Level = 0.5/((5*4)/2) = 0.005"
```


The p-value from the ANOVA is almost 0 (i.e., less than 2.2e-16).  Thus, we reject the null hypothesis, at the 5% significance level, and conclude that the data provides convincing evidence that at least one pair of income means are different from each other.  To examine which education levels different in mean incomes, we will examine the pairwise tests with a modified significance level is 0.5% (based on the Bonferroni correction).  At the 0.5% significance level, the p-values from the pairwise tests are all significant, except for the high school-junior college pair.  Thus, we conclude that the data provides convincing evidence that the mean income is different across all education pairs except for the high school-junior college pair.  The box plots of the high school and junior college levels also suggests this, given that the centres are close to each other.  There is no associated confidence interval for the ANOVA technique and thus there is nothing to compare the ANOVA results with. 

### Conclusion:

Insert conclusion here...

