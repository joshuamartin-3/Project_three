#'Takes in the surveys dataset from a given filepath and performs an ANOVA analysis of the data for two given column types.
#'
#' The surveys dataseet is installed and cleaned utilizing the survey_cleaner function.
#' Then the values of the predictor variable are extracted to the variable predict.
#' Also, the values of the response variable are extracted to the variable respond.
#' A linear model is fit for the relationship of the response variable with changes to the predictor using the lm function saved to survey_model.
#' An ANOVA model is fit to the pre-existing model using the aov function saved to anova_surveys.
#' A scatterplot of the linear relationship would created and saved under anova_plot.png to check for proper data input.
#' The function lastly returns a summary of the ANOVA test to get the relevant values from the statistical analysis.
#'
#' @param filepath The path to the csv file you want to process
#' @param predictor The predictor variable from the csv filepath inputted
#' @param response The response variable from the csv filepath inputted
#'
#' @return anova_plot Returns a scatterplot of the anova model predicting change in the response variable based on a change in the predictor
#' @export
survey_anova <- function(filepath, predictor, response, x_title, y_title){
  #Ensure the surveys dataset is downloaded and cleaned of NA values.
  surveys <- survey_cleaner("/cloud/project/data/surveys.csv")

  #Extract the predictor variable to predict
  predict <- surveys %>%
    dplyr::select({{predictor}}) %>%
    dplyr::pull(tidyselect::all_of({{predictor}}))

  #Extract the response variable to repond
  respond <- surveys %>%
    dplyr::select({{response}}) %>%
    dplyr::pull(tidyselect::all_of({{response}}))

  #Create a linear model of the relationship the predictor has on the response.
  survey_model <- stats::lm(respond ~ predict, data = surveys)

  #Fit an ANOVA model to the linear model.
  anova_surveys <- stats::aov(survey_model)

  #Create a scatterplot used to check and ensure the base linear model is correct.
  anova_plot <- ggplot2::ggplot(surveys, aes_string(x = {{predict}}, y = {{respond}})) + geom_point() + geom_jitter() + labs(x = x_title, y = y_title) + geom_smooth(method = "lm", color = "red", fill = "deeppink4") + theme(axis.title.x = element_text(size = 20), axis.title.y = element_text(size = 20)  , axis.text.x = element_text(size = 20), axis.text.y = element_text(size = 20)) + annotate("text", x = 50, y = 90, label = paste("R^2 == ", summary(survey_model)$r.squared), parse=T, size=5)

  #Save the plot to the local machine under "anova_plot.png"
  ggplot2::ggsave("anova_plot.png", anova_plot, width = 7, height = 7)

  return(summary(anova_surveys))
}
