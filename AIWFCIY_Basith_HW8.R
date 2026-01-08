#importing Libraries and Datasets
library(astsa)
library(dplyr)
library(tseries)
library(forecast)


trends <- read.csv("AIWFCIY All Time Trends.csv")
winter <- read.csv("Winter.csv")

#convert <1 to 0.5
clean_counts <- ifelse(trends$counts == "<1", 0.5, trends$counts)
clean_counts <- as.numeric(clean_counts)

#convert column to numeric
clean_counts_w <- ifelse(winter$counts == "<1", 0.5, winter$counts)
clean_counts_w <- as.numeric(clean_counts_w)


first_date <- as.Date(paste0(trends$Month[1], "-01"))
last_date <- as.Date(paste0(trends$Month[nrow(trends)], "-01"))

ts_data_1 <- ts(
  data = clean_counts,
  start = c(format(first_date, "%Y"), format(first_date, "%m")),
  end = c(format(last_date, "%Y"), format(last_date, "%m")),
  frequency = 12
)

ts_data_2 <- ts(
  data = clean_counts_w,
  start = c(format(first_date, "%Y"), format(first_date, "%m")),
  end = c(format(last_date, "%Y"), format(last_date, "%m")),
  frequency = 12
)

plot(ts_data_1, 
     type = "o", 
     col = "darkorchid",
     main = "All I Want for Christmas is you - Mariah Carey (Google Trends)",
     ylab = "Counts",
     xlab = "Year")

plot(ts_data_2, 
     type = "o", 
     col = "blue",
     main = "Winter Search Term (Google Trends)",
     ylab = "Counts",
     xlab = "Year")

model1 <- lm(ts_data_1 ~ time(ts_data_1))
summary(model1) 
rmse <- sqrt(mean(residuals(model1)^2))

print("RMSE")
print(rmse)
print("AIC")
print(AIC(model1))

plot(ts_data_1, 
     type = "o", 
     col = "darkorchid",
     main = "All I Want for Christmas is you - Mariah Carey (Google Trends)",
     ylab = "Counts",
     xlab = "Year")
abline(model1)

model2 <- lm(ts_data_1 ~ time(ts_data_1) + ts_data_2)
summary(model2) 

model1

acf(ts_data_1, 48, main="Trends ACF (original)") 

plot(resid(model1), type="o", main="Detrended model")

acf2(resid(model1), 48, main="ACF (Detrended)") 

best_model <- auto.arima(ts_data_1, d = 0, max.p = 5, max.q = 5, stepwise = FALSE, approximation = FALSE)
summary(best_model)




