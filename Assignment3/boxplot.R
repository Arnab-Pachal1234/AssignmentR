library(readxl)
df <- read_excel("C:/Users/Arnab/Documents/DS_LAB/Assignment3/Student_Performance.xlsx")
# 1. Box plot to analyze the overall distribution of student Marks
bp_marks <- boxplot(df$Marks,
                    main = "Box Plot of Student Marks",
                    ylab = "Marks Obtained",
                    col = "lightcyan",
                    border = "darkblue")

# 2. Box plot comparing Marks among different Departments
bp_dept_marks <- boxplot(Marks ~ Department, data = df,
                         main = "Comparison of Marks Across Departments",
                         xlab = "Department",
                         ylab = "Marks Obtained",
                         col = c("skyblue", "orange", "lightgreen"))

# 3. Box plot comparing Attendance across Departments
bp_dept_att <- boxplot(Attendance ~ Department, data = df,
                       main = "Comparison of Attendance Across Departments",
                       xlab = "Department",
                       ylab = "Attendance (%)",
                       col = c("coral", "khaki", "plum"))

# 4. Programmatically Identify Highest/Lowest Median Attendance, Variation & Outliers
med_att <- tapply(df$Attendance, df$Department, median)
iqr_att <- tapply(df$Attendance, df$Department, IQR)
sd_att  <- tapply(df$Attendance, df$Department, sd)
rng_att <- tapply(df$Attendance, df$Department, function(x) max(x) - min(x))

cat("\n--- Department-wise Attendance Summary ---\n")
print(data.frame(Median = med_att, IQR = iqr_att, SD = round(sd_att, 2), Range = rng_att))

cat("\n1. Highest Median Attendance:", names(which.max(med_att)), "with", max(med_att), "%\n")
cat("2. Lowest Median Attendance: ", names(which.min(med_att)), "with", min(med_att), "%\n")
cat("3. Largest Variation (IQR/SD):", names(which.max(iqr_att)),
    "(IQR =", max(iqr_att), "| SD =", round(max(sd_att), 2), "| Range =", max(rng_att), ")\n")