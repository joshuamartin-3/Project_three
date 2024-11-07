#' Takes in a csv database and squares the values of a numeric column specified
#'
#' @param filepath The path to the csv file you want to process
#' @param clmns The column of values you wish to get squared values for
#'
#' @return sqrd the original dataset with a new column of squared values.
#' @export
squared_surveys <- function(filepath, clmns){
  dataframe <- readr::read_csv(filepath)

  dataframe <- dataframe %>%
    na.omit(dataframe) %>%
    dplyr::pull({{clmns}})

  if(is.numeric(dataframe)){
    ##clmns references weight variable instead of dataframe index.
    message(clmns)
    sqrd = dataframe * dataframe
    return(sqrd)
  }else{
    print("Input non-numeric")
  }
}
