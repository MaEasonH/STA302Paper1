
#### Acquire ####

install.packages("opendatatoronto")
install.packages("knitr")
library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)

packagedata <- search_packages("race")
toronto_gender <-
  list_package_resources("police-race-and-identity-based-data-use-of-force") |>
  filter(name == 
           "Gender Composition") |>
  get_resource()
write_csv(
  x = toronto_gender,
  file = "toronto_gender.csv"
)
head(toronto_gender)
