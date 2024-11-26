#'Takes in the surveys dataset, cleans the data, and then creates a scatterplot comparing two specified columns in the dataset.
#'
#' The function survey_dotplot first takes in the filepath to the surveys dataset and ensures it is clean using the survey_cleaner function and saving the output to a variable dataframe.
#' Next, a custom ggplot function is created to make a scatterplot comparing the values of x_var and y_var. The titles for each axis are user-specified as the parameters x_title and y_title.
#' Lastly, the function returns the variable containing the saved dotplot survey_plot to be used outside of the bounds of the current function as well as check for proper graphing.
#'
#' @param filepath The path to the csv file you want to process
#' @param x_var the independent varaible infuencing the y-axis variable
#' @param y_var the dependent variable varying in response to the x-axis variable
#' @param x_title User-specified title for x-axis of plot
#' @param y_title User-specified title for y-axis of plot
#'
#' @return survey_plot the scatterplot using the surveys dataset comparing two variables x_var and y_var, grouping the two variables by color_group
#' @export

survey_dotplot <- function(filepath, x_var, y_var, x_title, y_title){
  #Cleaned surveys dataset assigned to the variable dataframe.
  dataframe <- survey_cleaner(filepath)

  #ggplot function used to create a custom scatterplot template using specified variables and titles for the x-axis and y-axis.
  survey_plot <- ggplot2::ggplot(data = dataframe, mapping = aes_string(x = x_var, y = y_var)) + geom_point() + labs(x = x_title, y = y_title) + theme(legend.position = "right")

  return(survey_plot)

}
