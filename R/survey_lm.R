#'Takes in the surveys dataset, cleans the data, and performs a linear model analysis and plot for specified columns.
#'
#' @param filepath The path to the csv file you want to process
#' @param predictor The predictor variable from the csv filepath inputted
#' @param response The response variable from the csv filepath inputted
#'
#' @return survey_plot Returns a scatterplot of detailing the linear model predicting change in the response variable based on a change in the predictor
#' @export
survey_lm <- function(filepath, predictor, response){

  surveys <- survey_cleaner("/cloud/project/data/surveys.csv")

  survey_model <- stats::lm({{response}} ~ {{predictor}}, data = surveys)
  summary(survey_model)

  surveys_plot <- ggplot2::ggplot(surveys, aes(x = weight, y = hindfoot_length)) + geom_point() + geom_jitter() + labs(x = predictor, y = response) + geom_smooth(method = "lm", color = "red", fill = "deeppink4") + theme(axis.title.x = element_text(size = 20), axis.title.y = element_text(size = 20)  , axis.text.x = element_text(size = 20), axis.text.y = element_text(size = 20))

  ggplot2::ggsave("surveys_lm_plot.png", surveys_plot)
  return(survey_plot)

}
