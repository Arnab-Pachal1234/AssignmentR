# 1. Set the plotting layout to 1 row and 3 columns
par(mfrow = c(1, 3))

# Define a common x-axis range for the distributions
x <- seq(-6, 6, length.out = 300)

# 2. Plot 1: N(0, 1) -> Mean = 0, SD = 1
y1 <- dnorm(x, mean = 0, sd = 1)
plot(x, y1, type = "l", lwd = 2, col = "blue",
     main = "N(0, 1)", xlab = "x", ylab = "Density")

# 3. Plot 2: N(0, 2^2) -> Mean = 0, SD = 2 (variance = 4)
y2 <- dnorm(x, mean = 0, sd = 2)
plot(x, y2, type = "l", lwd = 2, col = "green",
     main = "N(0, 2^2)", xlab = "x", ylab = "Density")

# 4. Plot 3: N(2, 1) -> Mean = 2, SD = 1
y3 <- dnorm(x, mean = 2, sd = 1)
plot(x, y3, type = "l", lwd = 2, col = "red",
     main = "N(2, 1)", xlab = "x", ylab = "Density")

# 5. Reset the plotting layout back to normal (1x1)
par(mfrow = c(1, 1))