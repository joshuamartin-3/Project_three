#' Takes in a csv database and squares the values of a numeric column specified
#'
#' @param filepath The path to the csv file you want to process
#' @param clmns The column of values you wish to get squared values for
#'
#' @return sqrd the squared values of the original column.
#' @export
squared_surveys <- function(filepath, clmns){
  #Read in the surveys dataset
  dataframe <- readr::read_csv(filepath)

  #Ensure NA values are omitted from the dataset and extract the specifed column from the surveys dataset.
  dataframe <- dataframe %>%
    stats::na.omit(dataframe) %>%
    dplyr::pull({{clmns}})

  #Error check if the specified column contains NA values.
  if(is.na({{clmns}})){
    message("NA values still in surveys dataset!")
  }

  if(is.numeric(dataframe)){
    ##clmns references weight variable instead of dataframe index.
    message(clmns)
    #Square the column data and return squared values.
    sqrd = dataframe * dataframe
    return(sqrd)
  }else{
    print("Input non-numeric")
  }
}
