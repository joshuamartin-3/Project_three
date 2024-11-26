#' Takes in a csv database and squares the values of a numeric column specified
#'
#' The squared_surveys function takes in a filepath and a column name as parameters.
#' Next, the function reads the surveys dataset into the variable dataframe, and from this point NA values are removed and the relevant columns is isolated with the pull function.
#' Next, there is an error check to ensure no NA values remain and then the isolated values are multiplied by themselves to get squares.
#' Then an error check to determine if the dataframe is non-numeric occurs in order to avoid potential errors, and in one is used a message will appear: "Input non-numeric."
#' Lastly, the function returns the squared values with a message for checking the data modification occurred.
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
