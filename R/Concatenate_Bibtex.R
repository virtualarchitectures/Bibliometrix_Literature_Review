# setwd("ENTER PATH TO WORKING DIRECTORY")

# specify the folder path containing BibTeX files
folder_path <- "data/bibtex_to_concatenate"

# specify the output file where the concatenated content will be stored
output_file <- "data/concatenated_bibtex.bib"

# function to concatenate BibTeX files
concatenate_bibtex_files <- function(folder_path, output_path) {
  # get a list of all BibTeX files in the specified folder
  bibtex_files <- list.files(folder_path, pattern = "\\.bib$", full.names = TRUE)
  
  # check if there are any BibTeX files in the folder
  if (length(bibtex_files) == 0) {
    stop("No BibTeX files found in the specified folder.")
  }
  
  # initialize an empty character vector to store BibTeX entries
  bibtex_entries <- character()
  
  # read each file and concatenate its content
  for (file_path in bibtex_files) {
    # read the content of the current BibTeX file
    current_content <- readLines(file_path, warn = FALSE)
    
    # append the content to the vector of BibTeX entries
    bibtex_entries <- c(bibtex_entries, current_content)
  }
  
  # write the concatenated content to the output file
  writeLines(bibtex_entries, con = output_path)

  # print a message indicating successful concatenation
  cat("BibTeX files have been successfully concatenated and saved to", output_path, "\n")
  
}

# call the function to concatenate BibTeX files
concatenate_bibtex_files(folder_path, output_file)
