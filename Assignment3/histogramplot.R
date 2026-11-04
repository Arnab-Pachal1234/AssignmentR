library(readxl)
df <- read_excel("C:/Users/Arnab/Documents/DS_LAB/Assignment3/Student_Performance.xlsx")
print(max(df$Marks))
print(min(df$Marks))

h_marks <- hist(df$Marks,
breaks = seq(50,100,by=10),
xlab = "Marks Obtained",ylab="Number of Students",
col="Skyblue",
main="Histogram According to Marks",
labels=TRUE,
ylim=c(0,7))


hist(df$Study_Hours,
breaks= seq(0,10,by=2),
xlab = "Study Hours",
ylab= "Number of Students",
main="Historgram No of Students vs Study Per Hours"
,col="skyblue",
labels=TRUE,
)
