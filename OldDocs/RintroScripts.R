# adding 1+3
additionVar = 1+3

additionVar

additionVar = 2 + 3

AdditionVar_2_Plus_3 = 2+3

#testing or "|"
(3 > 5) | (3 < 5)

#testing and "&"
logicalTest = (3 > 5) & (3 < 5)


logicalTest


stringVar = "Hello"

#testing for not equality
testStringNotEquality = ("hello") != ("Hello")


#list object
numlist = c(1,2,3,4)
numlist

numlist > 3

numrange = 1:4
numrange

wordlist = c('blue','red','white','green')
wordlist

#evaluating whether a string is in a list of strings
'Red' %in% wordlist

install.packages("tidyverse")

library(tidyverse)

data = read_csv('Heart_Disease_100sampled.csv')
data2 = read.csv('Heart_Disease_100sampled.csv')

# number of rows (first number) and columns (second number)
dim(data)
dim(data2)

ncol(data)

#summary of data frame columns
str(data)
str(data2)

data[c(1,3,5),2]
data[1:4,2]

entireCol2 = data[,2]
entireAgeCol = data$Age
entireAgeCol2 = data[,"Age"]


youngrows = entireAgeCol < 80
data[!youngrows,]


data2[!youngrows,]


# t-test whether BMI is different for patients with vs. without heart disaese
t.test(data[data$`Heart Disease Status` == 'Yes','BMI'],data[data$`Heart Disease Status` == 'No','BMI'])

HeartDiseaseYes = data[data$`Heart Disease Status` == 'Yes',]
HeartDiseaseYesBMI = data[data$`Heart Disease Status` == 'Yes',"BMI"]

HeartDiseaseNo = data[data$`Heart Disease Status` == 'No',]
HeartDiseaseNoBMI = data[data$`Heart Disease Status` == 'No',"BMI"]


t.test(HeartDiseaseYesBMI,HeartDiseaseNoBMI)

#Linear Model!!

IndepVar = data$BMI
GenderVar = as.factor(data$Gender)
SmokingVar = as.factor(data$Smoking)
Exercise = as.factor(data$`Exercise Habits`)

BMImodel = lm(IndepVar ~ GenderVar + SmokingVar + Exercise)
summary(BMImodel)

#plotting some outputs from the linear model
plot(BMImodel)


