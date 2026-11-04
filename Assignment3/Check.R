source("https://raw.githubusercontent.com/R-Offficial/R-Data/main/Prepare.R")
library(readxl)

df <- read_excel('c:/Users/Arnab/Documents/DS_LAB/Assignment3/Student_Performance.xlsx')
# 1. Histogram
generate_plot(df, type = "hist", x = "Marks", breaks = seq(50, 100, by = 10))


generate_plot(df, type = "box", x = "Marks")
generate_plot(df, type = "box", x = "Department", y = "Marks")
