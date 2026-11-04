# 1. Define parameters and x-axis range
mu <- 100
sd_val <- 15
x <- seq(50, 150, length.out = 300) # Creates 300 smooth points from 50 to 150

# 2. Calculate the probability density values using dnorm()
y <- dnorm(x, mean = mu, sd = sd_val)

# 3. Plot the density curve
plot(x, y, type = "l", lwd = 3, col = "blue",
     main = "Normal Distribution Density Curve (Mean = 100, SD = 15)",
     xlab = "x", ylab = "Density f(x)")

# Fill under the curve with transparent color for visual appeal
polygon(c(50, x, 150), c(0, y, 0), col = rgb(0, 0, 1, 0.15), border = NA)

# 4. Mark the mean using a vertical dashed line (abline)
abline(v = mu, col = "red", lwd = 2, lty = 2)

# Add a legend explaining the red line
legend("topright", legend = paste("Mean =", mu),
       col = "red", lty = 2, lwd = 2, bty = "n")