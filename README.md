# AnalyzeSurveys
## A package containing functions to import, clean, manipulate, model, and plot the surveys dataset.
### Author: Joshua Martin

## Why use this package?

The AnalyzeSurveys package was created to automate commonly used dataframe manipulations within the original surveys dataset. Creating pre-existing functions used when working with this dataset are useful in saving working time when standard design templates can be utilized across multiple dataframe column types.

## Installation Instructions

```
devtools::install_github("joshuamartin-3/Project_three")
library(AnalyzeSurveys)
```

## What can I do with AnalyzeSurveys?

The survey_cleaner function should be the first function ran after installation.

```
AnalyzeSurveys::survey_cleaner("/cloud/project/data/surveys.csv")
```

Running this segment of code in the console will ensure that the surveys.csv dataset is within the specified data directory within the Posit cloud. If the dataset does not exist it will download it to the specified directory. Lastly, the function will remove common NA values from the dataset: NA, "", and "Not Recorded" and return a cleaned surveys dataset.

After this step is completed any other function within the package can be used to manipulate, analyze, or plot the cleaned dataset.

For example we can use survey_dotplot to create a scatterplot comparing two column types.

```
AnalyzeSurveys::survey_dotplot("/cloud/project/data/surveys.csv", "weight", "hindfoot_length", "Weight", "Hindfoot Length")
```

The input parameters are the filepath of surveys.csv, the x-variable, y-variable, x-axis title, and y-axis title.
Once this segment of code is ran a pre-existing template within the function will be utilized as the basis of creating a scatterplot to compare the two variable columns. Lastly, the function will return the scatterplot created.

## Functions within the package

+ survey_cleaner ensures the surveys.csv dataset is in the proper directory("cloud/project/data/surveys.csv") and cleans it of common NA values.

+ survey_dotplot cleans and creates a scatterplot comparing two user-specified variables

+ squared_surveys omits NA values and squares the value of the user-specified column

+ survey_lm creates a linear model of comparing a user-specified predictor and response variable and saves a graphical representation of the model for use in error-checking

+ survey_anova creates a linear model, fits an ANOVA model, and saves a graphical representation of the model for error checking purposes.
