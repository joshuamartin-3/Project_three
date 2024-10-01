practice_function <- function(filepath, clmns){
  dataframe <- read_csv(filepath)
  
  dataframe <- dataframe %>%
    select({{clmns}}) %>%
    na.omit(dataframe)
  
  if(is.numeric(clmns)){
    ##clmns references weight variable instead of dataframe index.
    message(clmns)
    dataframe <- dataframe %>% 
      mutate(squared = {{clmns}} * {{clmns}})
    return(dataframe)
  }else{
    print("Input non-numeric")
  }
}