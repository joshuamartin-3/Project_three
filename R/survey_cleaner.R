#' Takes in the surveys dataset filepath, checks if the file is not downloaded it downloads, and then rids the data of any type of non-applicable values returning the altered csv dataset.
#'
#' The function takes in a filepath where surveys.csv will be stored.
#' It checks to ensure that the surveys.csv file exists within "/cloud/project/data/surveys.csv".
#' If the file is not available the file is downloaded from the source url.
#' The function read_csv was used to read the surveys dataset into the variable surveys specifying common types of NA.
#' The NA values are then ommitted using na.omit from the dataset and the function returns the dataset "cleaned" of any NA values.
#'
#' @param filepath The path to the csv file you want to process
#'
#' @return surveys the cleaned dataset with no values labeled NA, "Not Recorded", or an empty space.
#' @export
survey_cleaner <- function(filepath){

  #Download file from class github repository
  if(!file.exists("/cloud/project/data/surveys.csv")){
    utils::download.file(url="https://ndownloader.figshare.com/files/2292169", destfile = "/cloud/project/data/surveys.csv")
  }

  #read in the file from the local machine and alter the csv to get rid of various types of NA data.
  surveys <- readr::read_csv(filepath, na = c("Not Recorded", "NA", ""))

  #Omit NA values from the dataset, commenting out the segment of code directly below will allow for the NA values to remain visible for error checking purposes
  surveys <- surveys%>%
    stats::na.omit()

  return(surveys)


}
