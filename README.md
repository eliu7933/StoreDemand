# StoreDemand
This analysis is regarding 5 years of store-item data and through time series prediction modelling try to predict 3 months of sales for 50 different products and 10 different stores.

The README.md file contains the information about the Store Demand proejct. The gitignore file tells Git which files to ignore. The test.csv and the train.csv files are both files used in the analysis as the original store-item datasets with the test.csv file containing a column for sales. The StoreDemandAnalysis.R file is the file that contains the time series analysis where predictions for sales are created. The submission.csv file is the final file including the prediction created by the model.


The methods that are used in this analysis is creating a time series model in which would create a new time series column that would be used in the prediction modelling.

Methods used to create the predictions are the use of the arima model with the time series variable used as an argument for the model. The forecast function was also used to create the predictions.
