**Time Series Analysis of All I Want for Christmas Is You**

This project performs a time series analysis of the popularity of Mariah Carey’s All I Want for Christmas Is You using Google Trends data (2004–present). The goal is to explore seasonal patterns, trends, and predictive performance using classical regression and autoregressive models.

The analysis was completed as part of an academic forecasting assignment and demonstrates practical applications of time series modeling in R.

**Project Overview**

Song: All I Want for Christmas Is You (Mariah Carey, 1994)

Data Source: Google Trends

Time Period: 2004 – Present (monthly frequency)

Secondary Variable: Google Trends search interest for the term “Winter”

The project investigates:

Long-term trends in song popularity

Seasonal effects

The impact of related search terms

Model comparison using AIC and RMSE

** Tech Stack**

Language: R

Libraries Used:

astsa

dplyr

tseries

forecast

📁 Project Structure
├── AIWFCIY.nb.html          # Rendered analysis notebook
├── AIWFCIY.knit / .Rmd     # R Markdown source (if included)
├── AIWFCIY All Time Trends.csv
├── Winter.csv
├── pdf.pdf                 # Assignment submission / report
└── README.md
**
 Methodology
**
1. Data Cleaning

Converted Google Trends values of <1 to 0.5

Converted all counts to numeric

Constructed monthly time series objects (ts)

2. Visualization

Time series plots for:

Song popularity

“Winter” search trends

3. Modeling Approaches
a) Classical Regression

Model 1: Popularity ~ Time

Model 2: Popularity ~ Time + Winter search index

b) Autoregressive Modeling

Detrended residual analysis

ACF and PACF diagnostics

ARMA model selection using auto.arima()

**Model Performance**

Model Type	AIC	RMSE
Classical Regression (Time)	2053.57	12.99
ARMA / Auto ARIMA	1396.34	3.84

Autoregressive models significantly outperform simple regression, highlighting strong seasonality and temporal dependence.

**Key Insights**

The song exhibits extreme seasonality, peaking every December

Long-term popularity has increased over time

Including a related seasonal variable (Winter) greatly improves regression performance

ARMA models best capture the structure of the data

** How to Run the Analysis**

Clone the repository

Ensure the CSV files are in the working directory

Install required packages:

install.packages(c("astsa", "dplyr", "tseries", "forecast"))


Run the R Markdown file or view the rendered .html notebook

**Academic Context**

This project was completed as part of a time series forecasting coursework assignment and is intended for educational and demonstrative purposes.

**License**

This project is provided for educational use only. Data belongs to Google Trends and Mariah Carey.
