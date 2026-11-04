library(readxl)

df <- read_excel("Student_Performance.xlsx",sheet="Sheet 1")
print(head(df))

# This is for calculate department wise 
dept_avg_marks <- tapply(df$Marks , df$Department , mean)
cat("Department wise Average Marks:\n",round(dept_avg_marks,2),"\n")

#Bar Plot : Number of students in each department  
dept_counts <- table(df$Department)
bp1 <- barplot(dept_counts,main="Number of students in each department",
xlab = "Department" , ylab= "Number of Students" 
,col= c("skyblue","orange","lightgreen"),
ylim = c(0,max(dept_counts)+2))

text(x = bp1, y = dept_counts, label = dept_counts, pos = 3, font = 2)


gender_counts <- table(df$Gender)
bp2 <- barplot(gender_counts, main="Number of students in each gender",
xlab="Gender",ylab="Number of students",
col = c("blue","green"),
ylim = c(0,max(gender_counts)+2))
text(x=bp2,y=gender_counts,label=gender_counts, pos = 3,font=2)

bp4 <- barplot(dept_counts,
               main = "Number of Students per Department (Horizontal)",
               xlab = "Number of Students",
               ylab = "Department",
               col = "steelblue",
               horiz = TRUE,
               xlim = c(0, max(dept_counts) + 2))
text(x = dept_counts, y = bp4, label = dept_counts, pos = 4, font = 2)