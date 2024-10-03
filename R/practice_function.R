practice_function <- function(filepath, clmns){
  dataframe <- read_csv(filepath)
  
  dataframe <- dataframe %>%
    na.omit(dataframe) %>% 
    pull({{clmns}})
  
  if(is.numeric(dataframe)){
    ##clmns references weight variable instead of dataframe index.
    message(clmns)
    squared = dataframe * dataframe
    return(squared)
  }else{
    print("Input non-numeric")
  }
}