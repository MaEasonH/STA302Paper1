library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)


library(dplyr)


data <- read.csv('toronto_gender.csv')
data_selected <- select(data, Perceived_Race_of_People_Involv, Incident_Count)
data_selected$Incident_Count[is.na(data_selected$Incident_Count)] <- 0
data_reduced <- head(data_selected, 10)


print(data_reduced)
write.csv(data_reduced, 'clean_reduced.csv', row.names = FALSE)
cat("The data_reduced has been saved to 'data_reduced.csv'")
