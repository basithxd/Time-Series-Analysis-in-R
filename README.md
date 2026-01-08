# Time Series Analysis of All I Want for Christmas Is You

This project performs a time series analysis of the popularity of Mariah Carey’s *All I Want for Christmas Is You* using Google Trends data from 2004 to the present. The objective is to examine long-term trends, seasonal behavior, and model performance using classical regression and autoregressive techniques in R.

The analysis was completed as part of an academic forecasting assignment and demonstrates applied time series modeling.

---

## Project Overview

- Song: All I Want for Christmas Is You (Mariah Carey, 1994)
- Data Source: Google Trends
- Time Period: 2004 – Present
- Frequency: Monthly
- Additional Variable: Google Trends search interest for the term “Winter”

The project focuses on:
- Identifying long-term trends in search popularity
- Capturing strong seasonal patterns
- Evaluating the effect of related seasonal search terms
- Comparing model performance using AIC and RMSE

---

## Tech Stack

- Language: R
- Libraries:
  - astsa
  - dplyr
  - tseries
  - forecast

---

## Repository Structure

├── AIWFCIY.nb.html
├── AIWFCIY.Rmd
├── AIWFCIY All Time Trends.csv
├── Winter.csv
├── pdf.pdf
└── README.md


---

## Methodology

### Data Preparation
- Google Trends values of `<1` were converted to `0.5`
- All count variables were converted to numeric
- Monthly time series objects were created using `ts()`

### Visualization
- Time series plots of song popularity
- Time series plots of “Winter” search trends

### Modeling

#### Classical Regression
- Model 1: Popularity regressed on time
- Model 2: Popularity regressed on time and winter search interest

#### Autoregressive Modeling
- Detrending using linear regression
- ACF and PACF diagnostics on residuals
- ARMA model selection using `auto.arima()`

---

## Model Performance Summary

| Model | AIC | RMSE |
|------|-----|------|
| Classical Regression (Time) | 2053.57 | 12.99 |
| ARMA / Auto ARIMA | 1396.34 | 3.84 |

Autoregressive models significantly outperform simple regression, indicating strong seasonality and temporal dependence in the data.

---

## Key Findings

- The song shows extreme seasonal behavior with consistent December peaks
- Overall popularity has increased over time
- Including a seasonal proxy variable improves regression fit
- ARMA models best capture the underlying structure of the time series

---

## How to Run

1. Clone the repository
2. Ensure all CSV files are in the working directory
3. Install required packages:
   ```r
   install.packages(c("astsa", "dplyr", "tseries", "forecast"))
