library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(readr)

data <- read_csv("/cloud/project/toronto_gender.csv")

data_sorted <- data[order(-data$Incident_Count), ]
top_10 <- head(data_sorted, 10)

data_selected <- select(top_10, Perceived_Race_of_People_Involv, Incident_Count)
data_selected$Incident_Count[is.na(data_selected$Incident_Count)] <- 0
data_reduced <- head(data_selected, 10)


data_grouped <- data %>%
  group_by(Perceived_Race_of_People_Involv) %>%
  summarise(Incident_Count = sum(Incident_Count, na.rm = TRUE))

print(data_grouped)

write.csv(data_grouped, 'clean_reduced.csv', row.names = FALSE)

