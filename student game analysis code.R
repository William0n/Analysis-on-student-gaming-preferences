studData <- read.csv("a3data.csv")
apSubset <- subset(studData, grade == "1")
notapSubset <- subset(studData, Grade == "A " | Grade == "B " | Grade == "C ")


gamerMale <- subset(studData, like == "1" & sex == "Male")
gamerFemale <- subset(studData, like == "1" & sex == "Female")

notGamerMale  <- subset(studData, like == "0" & sex == "Male")
notGamerFemale <- subset(studData, like == "0" & sex == "Female")
  
                           
### Proportion Table

contTable <- matrix(c(nrow(gamerMale),nrow(gamerFemale), nrow(notGamerMale), nrow(notGamerFemale)), nrow= 2, byrow = TRUE)
dimnames(contTable) <- list(c("Likes Games", "Doesn't Like Games"), c("Male", "Female"))
names(dimnames(contTable)) <- c("Game Preference", "Sex")

diffPropTest <- prop.test(contTable, correct = FALSE)
fisherTest <- fisher.test(contTable)

################################################################################ A++++++++++++

gamerMaleAp <- subset(apSubset, like == "1" & sex == "Male")
gamerFemaleAp <- subset(apSubset, like == "1" & sex == "Female")

notGamerMaleAp  <- subset(apSubset, like == "0" & sex == "Male")
notGamerFemaleAp <- subset(apSubset, like == "0" & sex == "Female")

contTableAp <- matrix(c(nrow(gamerMaleAp),nrow(gamerFemaleAp), nrow(notGamerMaleAp), nrow(notGamerFemaleAp)), nrow= 2, byrow = TRUE)
dimnames(contTableAp) <- list(c("Likes Games", "Doesn't Like Games"), c("Male", "Female"))
names(dimnames(contTableAp)) <- c("Game Preference", "Sex")

fishTest1 <- fisher.test(contTableAp)

################################################################################ NOT A++++++++

gamerMaleNotAp <- subset(notapSubset, like == "1" & sex == "Male")
gamerFemaleNotAp <- subset(notapSubset, like == "1" & sex == "Female")

notGamerMaleNotAp  <- subset(notapSubset, like == "0" & sex == "Male")
notGamerFemaleNotAp <- subset(notapSubset, like == "0" & sex == "Female")

contTableNotAp <- matrix(c(nrow(gamerMaleNotAp),nrow(gamerFemaleNotAp), nrow(notGamerMaleNotAp), nrow(notGamerFemaleNotAp)), nrow= 2, byrow = TRUE)
dimnames(contTableNotAp) <- list(c("Likes Games", "Doesn't Like Games"), c("Male", "Female"))
names(dimnames(contTableNotAp)) <- c("Game Preference", "Sex")

fishTest2 <- fisher.test(contTableNotAp)



####################### Logistic Models

like <- studData$like
sex <- studData$sex
grades <- studData$grade


model2.1 <- glm(like ~ sex * grades, family = binomial, data = studData)
model2.2 <- glm(like ~ sex + grades, family = binomial, data = studData)

summary1 <- summary(model2.1)
summary2 <- summary(model2.2)

######################## Poisson Models

# Below is code used to create 'count' data for the poisson models
count <- c(31,103,11,18,26,88,32,90)
like1 <- as.factor(c("no", "no", "no","no", "yes","yes","yes","yes"))
sex1 <- as.factor(c("female" , "female", "male", "male", "female", "female", "male", "male"))
grade1 <- as.factor(c("A+", "not A+", "A+", "not A+","A+", "not A+","A+", "not A+"))


pModel1 <- glm(count ~ like1 * sex1 * grade1, family = poisson)
pModel2 <- glm(count ~ (like1 + sex1 + grade1)^ 2, family = poisson)






