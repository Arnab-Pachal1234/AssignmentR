library(readxl)
df <- read_excel("C:/Users/Arnab/Documents/DS_LAB/Assignment3/Student_Performance.xlsx")
# Convert Gender and Department to factors for symbol (pch) and color (col) mapping
gender_factor <- as.factor(df$Gender)       # 1 = Female, 2 = Male
dept_factor   <- as.factor(df$Department)   # 1 = CSE, 2 = ECE, 3 = IT

# 1. Scatter Plot: Study Hours vs Marks (Different symbols for Gender & colors for Department)
plot(df$Study_Hours, df$Marks,
     main = "Scatter Plot: Study Hours vs Marks",
     xlab = "Study Hours per Day",
     ylab = "Marks Obtained",
     pch = c(16, 17)[gender_factor],                  # 16 = Circle (Female), 17 = Triangle (Male)
     col = c("red", "blue", "darkgreen")[dept_factor],# Colors by Department
     cex = 1.5)                                       # Point size (1.5x normal)

# # Add Linear Regression Line to the Study_Hours vs Marks plot
model_study <- lm(Marks ~ Study_Hours, data = df)
abline(model_study, col = "black")  # lwd = line width, lty = 2 (dashed)

# Add Legend explaining symbols and colors
legend("bottomright",
       legend = c("Female (Circle)", "Male (Triangle)", "CSE (Red)", "ECE (Blue)", "IT (Green)"),
       pch = c(16, 17, 15, 15, 15),
       col = c("black", "black", "red", "blue", "darkgreen"),
       cex = 0.8)

# # 2. Scatter Plot: Attendance vs Marks (with Regression Line, Gender Symbols & Dept Colors)
plot(df$Attendance, df$Marks,
     main = "Scatter Plot: Attendance vs Marks",
     xlab = "Attendance (%)",
     ylab = "Marks Obtained",
     pch = c(16, 17)[gender_factor],
     col = c("red", "blue", "darkgreen")[dept_factor],
     cex = 1.5)

# # Add Linear Regression Line to the Attendance vs Marks plot
model_att <- lm(Marks ~ Attendance ,data=df)
abline(model_att, col = "black") 
legend("bottomright",
       legend = c("Female (Circle)", "Male (Triangle)", "CSE (Red)", "ECE (Blue)", "IT (Green)"),
       pch = c(16, 17, 15, 15, 15),
       col = c("black", "black", "red", "blue", "darkgreen"),
       cex = 0.8)

# # 3. Calculate Correlations
cor_study_marks <- cor(df$Study_Hours, df$Marks)
cor_att_marks   <- cor(df$Attendance, df$Marks)

cat("\n--- Correlation Analysis ---\n")
cat("Correlation between Study_Hours and Marks:", round(cor_study_marks, 4), "\n")
cat("Correlation between Attendance and Marks: ", round(cor_att_marks, 4), "\n")