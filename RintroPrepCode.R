library(tidyverse)

data = read_csv('heart_disease.csv')
dataFull = data %>% drop_na()
str(dataFull)


data100 = dataFull %>% 
  mutate(ptID = paste('pt',seq(nrow(dataFull)))) %>%
  relocate(ptID) %>%
  slice_sample(n = 100)

data100 %>%
  ggplot() + 
  aes(y = `Triglyceride Level`,x = `Heart Disease Status`) +
  geom_boxplot(outlier.shape = NA) + 
  geom_jitter()

?write_csv()

data100 %>%
  pivot_wider(names_from = `Heart Disease Status`, values_from = BMI) %>%
  str()

