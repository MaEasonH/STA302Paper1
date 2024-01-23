library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)



toronto_shelters_clean <-
  clean_names(toronto_shelters) |>
  mutate(occupancy_date = ymd(occupancy_date)) |> 
  select(occupancy_date, occupied_beds)

head(toronto_shelters_clean)

write_csv(
  x = toronto_shelters_clean,
  file = "cleaned_toronto_shelters.csv"
)
