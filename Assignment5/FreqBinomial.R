# Given data
successes <- 0:5
observed_freq <- c(4, 15, 30, 28, 17, 6)
n <- 5  # Maximum number of successes (length of 0 to 5)
N <- sum(observed_freq)  # Total number of observations

# 1. Estimate the parameter 'p' (probability of success) using the sample mean
# Mean = sum(x * f) / N
mean_x <- sum(successes * observed_freq) / N
p_est <- mean_x / n

cat("Estimated probability (p):", p_est, "\n")

# 2. Calculate expected probabilities using dbinom()
expected_probs <- dbinom(successes, size = n, prob = p_est)

# 3. Calculate expected frequencies (Expected = N * Probability)
expected_freq <- N * expected_probs

# 4. Combine into a comparison table
comparison_table <- data.frame(
  Successes = successes,
  Observed = observed_freq,
  Expected = round(expected_freq, 2)
)

cat("\n--- Observed vs Expected Frequencies ---\n")
print(comparison_table)

# 5. Plot Observed vs Expected frequencies for visual comparison
barplot(rbind(observed_freq, expected_freq), beside = TRUE,
        col = c("blue", "orange"),
        names.arg = successes,
        main = "Observed vs Fitted Binomial Distribution",
        xlab = "Number of Successes",
        ylab = "Frequency",
        legend.text = c("Observed", "Expected"),
        args.legend = list(x = "topright"))