library(readxl)
df <- read_excel("C:/Users/Arnab/Documents/DS_LAB/Assignment3/Student_Performance.xlsx")

x_pos <- 1:nrow(df)

# 1. Initial Line Plot: Marks by Student ID (Connected using lines only: type = "l")
plot(x_pos, df$Marks,
     type = "l",                                  # "l" = Lines only
     main = "Line Plot of Marks by Student ID (Lines Only)",
     xlab = "Student ID",
     ylab = "Marks Obtained",
     col = "blue",
     lwd = 2,                                     # Line width
     xaxt = "n")                                  # Suppress default numeric X-axis
# Add Student_ID labels (S01 to S20) on the X-axis (side = 1 is bottom axis, las = 2 rotates vertically)
axis(1, at = x_pos, labels = df$Student_ID, las = 2, cex.axis = 0.8)

# 2. Modified Line Plot: Marks by Student ID (Display BOTH points and connecting lines: type = "b")
plot(x_pos, df$Marks,
     type = "b",                                  # "b" = Both points and connecting lines
     main = "Marks Obtained by Student ID (Points & Lines)",
     xlab = "Student ID",
     ylab = "Marks Obtained",
     col = "royalblue",
     pch = 19,                                    # Point symbol: 19 = Solid circle
     lty = 1,                                     # Line type: 1 = Solid line
     lwd = 2,
     xaxt = "n")
axis(1, at = x_pos, labels = df$Student_ID, las = 2, cex.axis = 0.8)
grid()                                            # Optional background grid for readability

# 3. Line Plot: Attendance according to Student ID (Changed line type & point symbol)
plot(x_pos, df$Attendance,
     type = "b",
     main = "Attendance by Student ID",
     xlab = "Student ID",
     ylab = "Attendance (%)",
     col = "forestgreen",
     pch = 17,                                    # Changed symbol: 17 = Solid triangle
     lty = 2,                                     # Changed line type: 2 = Dashed line
     lwd = 2,
     xaxt = "n")
axis(1, at = x_pos, labels = df$Student_ID, las = 2, cex.axis = 0.8)
grid()

# 4. Line Plot: Study_Hours according to Student ID (Changed line type & point symbol)
plot(x_pos, df$Study_Hours,
     type = "b",
     main = "Study Hours by Student ID",
     xlab = "Student ID",
     ylab = "Study Hours per Day",
     col = "firebrick",
     pch = 15,                                    # Changed symbol: 15 = Solid square
     lty = 4,                                     # Changed line type: 4 = Dot-dash line
     lwd = 2,
     xaxt = "n")
axis(1, at = x_pos, labels = df$Student_ID, las = 2, cex.axis = 0.8)
grid()