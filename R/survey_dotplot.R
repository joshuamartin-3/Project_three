#'Takes in the surveys dataset, cleans the data, and then creates a scatterplot comparing two specified columns in the dataset.
#'
#' @param filepath The path to the csv file you want to process
#' @param x_var the independent varaible infuencing the y-axis variable
#' @param y_var the dependent variable varying in response to the x-axis variable
#' @param color_group
#'
#' @return survey_plot the scatterplot using the surveys dataset comparing two variables x_var and y_var, grouping the two variables by color_group
#' @export

survey_dotplot <- function(filepath, x_var, y_var, color_group){
  dataframe <- survey_cleaner(filepath)

  survey_plot <- ggplot2::ggplot(dataframe, aes(x = {{x_var}}, y = {{y_var}}, color = {{color_group}})) + geom_point(size = 2) + labs(x = var_one, y = var_two) + theme(legend.position = "right")
  return(survey_plot)

}
