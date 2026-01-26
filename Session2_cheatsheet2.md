# Session 2 Command Cheatsheet

This cheatsheet contains useful `dplyr` and `ggplot` commands that we will be covering in the Session 2 tutorial.

## Loading the package and importing the spreadsheet

```r
# load package
library(tidyverse)

# load dataset
data = read_csv("Heart_Disease_100sampled.csv")
```

## Data specifications

```r
# check data frame dimension
dim(data)

# display full column specification for the data
spec(data)

# preview of the data frame
View(data)
```

## Columns

```r
# select single column
select(data, ptID)

# select multiple columns
select(data, ptID, BMI, `CRP Level`)

# select range of columns
select(data, ptID:BMI)

# exclude a column
select(data, !`Sleep Hours`)

# rename column header
data_renameAge = rename(data, `Age (Year)` = Age)

# add new column
data_addCol = mutate(data_renameAge, `Age (Month)` = `Age (Year)` * 12)

# move column
relocate(data_addCol, `Age (Month)`, .after = `Age (Year)`)
```

## Rows

```r
# select rows by criteria
filter(data, Smoking == "Yes")
filter(data, Smoking == "Yes" & `Exercise Habits` == "Low")

# select rows by index
slice(data, 20:50)

# select top/bottom rows
slice_head(data, n=5)
slice_tail(data, n=5)

# randomly select rows
slice_sample(data, n = 10)

# select top rows based on variable
slice_min(data, order_by = BMI, n=5)
slice_max(data, order_by = Age, n=5)

# sort data frame
arrange(data, Age)
arrange(data, desc(Age))
```

## Statistics

```r
# mean and median
summarise(data, mean(BMI), median(BMI))

# standard deviation and variance
summarise(data, sd(BMI), var(BMI))

# minimum and maximum
summarise(data, min(BMI), max(BMI))
```

## Getting help

```r
# introduction to dplyr
vignette("dplyr")
```

## Data visualization

### Scatter plot

```r
data %>%
  ggplot(aes(x = `Fasting Blood Sugar`, y = `Homocysteine Level`, color = Gender)) +
  geom_point() +
  theme_bw() +
  labs(x = "Fasting Blood Sugar [mg/dL]", y = "CRP Level [mg/L]", title = "Fasting blood sugar VS CRP level") +
  theme(
    axis.title.x = element_text(size = 14, color = "red"),
    axis.title.y = element_text(size = 14, color = "blue"),
    plot.title = element_text(hjust = 0.5, face = "bold", size = 18, color = "black")
    ) +
  geom_smooth(method = "lm", se = TRUE)
```

### Box-and-whisker plot

```r
data %>%
  ggplot(aes(x = `Heart Disease Status`, y = `Triglyceride Level`, color = `Heart Disease Status`)) +
  geom_boxplot(outlier.shape = NA) +
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_jitter() +
  theme_bw()
```
