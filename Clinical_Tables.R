#Preparing a table of summary statistics for clinical data

# Load necessary libraries
library(tidyverse)
library(tableone)

# Load your dataset
data <- read.csv("Analyse_Clinical.csv", stringsAsFactors = TRUE)

# View column names to confirm
names(data)

# Convert appropriate variables to factors (categorical)
factor_vars <- c(
  "History", "Tumor_Location", "Histopathology", "Stage",
  "Molecular_Subtype", "Smoking", "Alcohol", "Oral_contraceptives",
  "Menpause", "Hypertension", "Diabetes"
)
data[factor_vars] <- lapply(data[factor_vars], factor)

# Create Table 1
vars <- c(
  "Age", "Height", "Weight", "Menarche", "History", "Tumor_Location",
  "Histopathology", "Stage", "Molecular_Subtype", "Smoking", "Alcohol",
  "Oral_contraceptives", "Menpause", "Age_Menopause", "Hypertension", "Diabetes"
)

# Define categorical variables
catVars <- factor_vars

# Generate the summary table
table1 <- CreateTableOne(vars = vars, data = data, factorVars = catVars, includeNA = TRUE)

# Print the table
print(table1, showAllLevels = TRUE, quote = FALSE, noSpaces = TRUE)

# Export to CSV
write.csv(print(table1, showAllLevels = TRUE, noSpaces = TRUE), "Table1_BreastCancer.csv")
