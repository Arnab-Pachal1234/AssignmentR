library(readxl)
df <- read_excel("C:/Users/Arnab/Documents/DS_LAB/Assignment3/Student_Performance.xlsx")
print(head(df))

dept_counts = table(df$Department)

pie(dept_counts,main="Department wise pie chart",col=c("pink","yellow","red"))
dept_pct <- (dept_counts/sum(dept_counts))*100

cat("The department percentage is ",dept_pct,"\n")

dept_pct_label <- paste0(round(dept_pct,1),"%")
pie(dept_counts,labels=dept_pct_label,main="Department wise pie chart",col=c("pink","yellow","red"))


dept_pct_category_label <- paste0(round(dept_pct,1),"%","category :",names(dept_pct))
pie(dept_counts,labels=dept_pct_category_label,main="Department wise pie chart",col=c("pink","yellow","red"))
