#' Takes in the surveys dataset filepath, checks if the file is not downloaded it downloads, and then rids the data of any type of non-applicable values returning the altered csv dataset.
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
  surveys <- readr::read_csv(filepath, na = c("Not Recorded", "NA", " "))
  return(surveys)
}
