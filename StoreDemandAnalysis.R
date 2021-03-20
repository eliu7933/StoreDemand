##### Store Item Demand Lectures #####

# libraries
library(forecast)
library(tidyverse)
library(lubridate)

test <- vroom::vroom("../input/demand-forecasting-kernels-only/test.csv")
train <- vroom::vroom("../input/demand-forecasting-kernels-only/train.csv")
store <- bind_rows(train, test)

# there are 10 stores
# there are 50 stores


### Feature Engineering ###
# create different explanatory variables

weekdays <- wday(store$date)
store$month <- month(store$date)
year <- year(store$date)
quarter <- quarter(store$date, with_year = TRUE) # quarterly


### Plot Sales ###

# For loop through stores and products to get model
y <- train %>% filter(item == 1, store == 1) %>%
  pull(sales) %>% ts(dat = ., start = 1, frequency = 365)

# train$month <- month(train$date)

# y <- train %>% filter(item == 1, store == 1) %>% 
# group_by(month) %>% 
# summarise(sales = sum(month)) %>%
# pull(sales)

# run arima model which feeds explanatory variables in the model
arima_model <- auto.arima(y = y, max.p = 5, max.q = 5)

preds <- forecast(arima_model, h = 45000)
plot(preds)

submission <- data.frame("id" = test$id, "sales" = preds$mean)

write.csv(x = submission, file = "submission.csv", row.names = FALSE)