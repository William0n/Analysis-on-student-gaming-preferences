 # Analysis on Student Gaming Preferences
  
## Introduction

With gaming becoming an increasingly popular past time activity for students around the world, it is no surprise that we would be interested in studying what factors affect a student’s gaming preferences. More specifically, in this study, I hope to answer 2 questions: 
* Does a student’s sex plays a role in their preference for games? 
* Does the relationship between a student’s preference for games and their sex change depending on their expected grades?

## Preliminary Analysis
## Methods 
For this study, logistic models and Poisson models were fitted to the data in R. Both these models were used in order to show two different approaches of answering the study question. A logistic model was chosen as the data consisted of a discrete categorical variable. It should also be noted that the Poisson model was fitted to data which consisted of the counts of students who liked and did not like video games.

<ins>Logistic Models:<ins>

Let X= grade, W = sex. Where X represents the 2 levels of the variable ‘grade’ (i.e. 1= student’s grade is A+, and 0 = student’s grade is not A+), and W represents the 2 levels of the variable ‘sex’ (i.e. 1= male, 0 = Female). In addition, π<sub>i</sub>, represents the probability of a student liking to play video games.

**Model 2.1:** logit(π<sub>i</sub>) = β<sub>0</sub> + β<sub>1</sub>X + β<sub>2</sub>W + β<sub>3</sub>XW for i = 1,…,399 <sub></sub>	     
**Model 2.2:** logit(π<sub>i</sub>) = α<sub>0</sub> + α<sub>1</sub>X + α<sub>2</sub>W  for i = 1,…,399
                    

<ins>Poisson Models:<ins>
  
Let X represent variable ‘like’ (X= 1for likes game, X=0 otherwise). Let W represent the variable ‘sex’ (W =1 for male, W=0 otherwise). Let Z represent the variable ‘grade’ (Z=1 for grade of A+, Z=0 otherwise). 

**Model 3.1:** log(µ<sub>ijk</sub>) = β<sub>0</sub> + β<sub>1</sub>X + β<sub>2</sub>W + β<sub>3</sub>Z+ β<sub>4</sub>XW + β<sub>5</sub>XZ + β<sub>6</sub>WZ+ β<sub>7</sub>XWZ <br/>
**Model 3.2:** log(µµ<sub>ijk</sub>) = β<sub>0</sub> + β<sub>1</sub>X + β<sub>2</sub>W + β<sub>3</sub>Z+ β<sub>4</sub>XW + β<sub>5</sub>XZ + β<sub>6</sub>WZ

## Model Selection
In order to choose the best logistic model, both a Likelihood Ratio Test and a Wald’s Test were conducted on Models 2.1 & 2.2. Similarly, to determine the better poisson model, just a Wald's Test was conducted on Models 3.1 & 3.2. Based on the resulting p-values shown, a reduced model for both types of models (i.e. Model 2.2 for logistic and Model 3.2 for poisson) was chosen. 

**LRT:** p-value = 0.3272 <br/>
**Wald's Test (Logistic Model):** p-value= 0.3230 <br/>
**Wald's Test (Poisson Model):** p-value= 0.3234
