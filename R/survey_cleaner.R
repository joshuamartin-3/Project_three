#Takes in the surveys dataset filepath and rids the data of any type of non-applicable values returning the altered dataset.

survey_cleaner <- function(filepath){
  surveys <- read_csv(filepath, na = c("Not Recorded", "NA"))
  return(surveys)
}
