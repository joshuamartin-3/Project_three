#Not to be used in Project 3

alt_function <- function(path, inputone, inputtwo){
  dataframe <- read_csv(path)
  dataframe
  dataframe %>%
    na.omit(dataframe) %>%
    mutate(useless = as.double(inputone) * as.double(inputtwo))

  return(dataframe)
}
