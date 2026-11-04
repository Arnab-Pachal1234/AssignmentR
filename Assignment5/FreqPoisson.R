# Given observed frequencies and corresponding success values (0 to 7)
successes <- 0:7
observed_freq <- c(4, 10, 21, 29, 20, 10, 4, 2)
N <- sum(observed_freq)  # Total number of observations

# 1. Estimate the parameter lambda (lambda is equal to the sample mean)
# Mean = sum(x * f) / N
lambda_est <- sum(successes * observed_freq) / N
cat("Estimated Poisson parameter (lambda):", round(lambda_est, 4), "\n\n")

# 2. Calculate expected probabilities using dpois() with the estimated lambda
expected_probs <- dpois(successes, lambda = lambda_est)

# 3. Calculate expected frequencies (Expected = N * Probability)
expected_freq <- N * expected_probs

# 4. Combine into a neat comparison table
comparison_table <- data.frame(
  Successes = successes,
  Observed = observed_freq,
  Expected = round(expected_freq, 2)
)

cat("--- Observed vs Expected Frequencies (Poisson Fit) ---\n")
print(comparison_table)

# 5. Optional: Plot Observed vs Expected frequencies
barplot(rbind(observed_freq, expected_freq), beside = TRUE,
        col = c("blue", "orange"),
        names.arg = successes,
        main = "Observed vs Fitted Poisson Distribution",
        xlab = "Number of Events (x)",
        ylab = "Frequency",
        legend.text = c("Observed", "Expected"),
        args.legend = list(x = "topright"))