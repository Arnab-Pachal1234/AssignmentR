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

print(h_marks)

plot(h_marks$mids, h_marks$counts,
     type = "b",                                       # Points + connecting lines
     main = "Frequency Polygon of Student Marks",
     xlab = "Marks Class Intervals",
     ylab = "Frequency (Number of Students)",
     col = "royalblue",
    ylim = c(0, max(h_marks$counts) + 1))