# install.packages("bibliometrix")
# install.packages("openxlsx")

# setwd("ENTER PATH TO WORKING DIRECTORY")

# activate libraries
library(bibliometrix)
library(openxlsx)

# set input file paths
wos_file <- "data/WoS_Database.bib"
scopus_file <- "data/Scopus_Database.csv"

# set output folder
output_file <- "data/merged_database.xlsx"

# Function to merge WoS and Scopus Databases
merge_wos_scopus <- function(wos_bibtex, scopus_csv, output_file) {
  
  # convert files
  W <- convert2df(wos_bibtex, dbsource = "isi", format = "bibtex")
  S <- convert2df(scopus_csv, dbsource = "scopus", format = "csv")
  
  # merge files and remove duplicates
  Database <- mergeDbSources(S, W, remove.duplicated = TRUE)
  
  # check the database dimension in console
  dim(Database)
  
  # write the database to excel file
  write.xlsx(Database, file = output_file)

  # print a message indicating successful concatenation
  cat("The merged BibTeX file has been successfully saved to", output_file, "\n")
}

# call the function to merge the WoS and Scopus databases
merge_wos_scopus(wos_file, scopus_file, output_file)
