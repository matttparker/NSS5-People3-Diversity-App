library(tidyverse)
library(readxl) 

read_excel_allsheets <- function(filename, tibble = FALSE) {
  sheets <- readxl::excel_sheets(filename)
  x <- lapply(sheets, function(X) readxl::read_excel(filename, sheet = X))
  if(!tibble) x <- lapply(x, as.data.frame)
  names(x) <- sheets
  x
}

user_test <- read_excel_allsheets("Example_Profile.xlsx")

user_test_age <- data.frame(user_test[1])
View(user_test_age)

census_df_test <- readRDS('census_df.rmd')
test_age_df <- data.frame(census_df_test[1])
View(test_age_df)
