#Takes in the surveys dataset from a given filepath and performs an ANOVA analysis of the data for two given column types.
#'
#' @param filepath The path to the csv file you want to process
#' @param predictor The predictor variable from the csv filepath inputted
#' @param response The response variable from the csv filepath inputted
#'
#' @return anova_plot Returns a scatterplot of the anova model predicting change in the response variable based on a change in the predictor
#' @export
survey_anova <- function(filepath, predictor, response){

  surveys <- survey_cleaner("/cloud/project/data/surveys.csv")

  survey_model <- stats::lm({{response}} ~ {{predictor}}, data = surveys)

  anova_surveys <- stats::aov(survey_model)
  summary(anova_surveys)


  anova_plot <- ggplot2::ggplot(surveys, aes(x = {{predictor}}, y = {{response}})) + geom_point() + geom_jitter() + labs(x = predictor, y = response) + geom_smooth(method = "lm", color = "red", fill = "deeppink4") + theme(axis.title.x = element_text(size = 20), axis.title.y = element_text(size = 20)  , axis.text.x = element_text(size = 20), axis.text.y = element_text(size = 20))

  ggplot2::ggsave("anova_plot.png", anova_plot)

  return (anova_plot)
}
