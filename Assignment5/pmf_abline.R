# Parameters
n <- 20
p <- 0.6
x <- 0:n

# 1. Calculate PMF
pmf <- dbinom(x, size = n, prob = p)

# 2. Plot the PMF
plot(x, pmf, type = "h", lwd = 3, col = "darkblue",
     main = "Binomial PMF (n=20, p=0.6) with Mean",
     xlab = "Number of Successes (x)", 
     ylab = "Probability P(X = x)")
points(x, pmf, pch = 16, col = "darkblue")

# 3. Calculate mean (np)
mean_val <- n * p
cat("Theoretical Mean (np):", mean_val, "\n")

# 4. Mark the mean using abline(v = ...)
abline(v = mean_val, col = "red", lwd = 2, lty = 2)

# Add a legend to explain the red dashed line
legend("topleft", legend = paste("Mean =", mean_val), 
       col = "red", lty = 2, lwd = 2, bty = "n")