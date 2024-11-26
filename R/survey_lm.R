#'Takes in the surveys dataset, cleans the data, and performs a linear model analysis and plot for specified columns.
#'
#' The surveys dataset is installed and cleaned utilizing the survey_cleaner function.
#' Then the values of the predictor variable are extracted to the variable predict.
#' Also, the values of the response variable are extracted to the variable respond.
#' A linear model is fit for the relationship of the response variable with changes to the predictor using the lm function saved to survey_model.
#' A scatterplot of the linear relationship would created and saved under surveys_lm_plot.png to check for proper data input.
#' The function lastly returns a summary of the linear model test to get the relevant values from the statistical analysis.
#'
#' @param filepath The path to the csv file you want to process
#' @param predictor The predictor variable from the csv filepath inputted
#' @param response The response variable from the csv filepath inputted
#' @param x_title User-specified title for x-axis of plot
#' @param y_title User-specified title for y-axis of plot
#'
#' @return survey_plot Returns a scatterplot of detailing the linear model predicting change in the response variable based on a change in the predictor
#' @export
survey_lm <- function(filepath, predictor, response, x_title, y_title){
  #Ensures the survey dataset is downloaded and cleaned
  surveys <- survey_cleaner("/cloud/project/data/surveys.csv")

  #Extract the predictor variable to predict
  predict <- surveys %>%
    dplyr::select({{predictor}}) %>%
    dplyr::pull(tidyselect::all_of({{predictor}}))

  #Extract the response variable to repond
  respond <- surveys %>%
    dplyr::select({{response}}) %>%
    dplyr::pull(tidyselect::all_of({{response}}))

  #Create a linear model predicting the influence of the predictor on the response from the surveys dataset.
  survey_model <- stats::lm(respond ~ predict, data = surveys)
  summary(survey_model)

  #Create a scatterplot of the relationship between the predictor and reponse as well as plotting the trendline and value of r-squared.
  surveys_plot <- ggplot2::ggplot(surveys, aes_string(x = {{predict}}, y = {{respond}})) + geom_point() + geom_jitter() + labs(x = x_title, y = y_title) + geom_smooth(method = "lm", color = "red", fill = "deeppink4") + theme(axis.title.x = element_text(size = 20), axis.title.y = element_text(size = 20)  , axis.text.x = element_text(size = 20), axis.text.y = element_text(size = 20)) + annotate("text", x = 50, y = 90, label = paste("R^2 == ", summary(survey_model)$r.squared), parse=T, size=5)

  #Save the plot created to "surveys_lm_plot.png"
  ggplot2::ggsave("surveys_lm_plot.png", surveys_plot, width = 7, height = 7)

  return(summary(survey_model))

}
