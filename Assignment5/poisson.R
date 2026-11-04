# Parameters
lambda <- 5

# 1. P(X = 3) -> Exact probability
p_eq_3 <- dpois(3, lambda = lambda)

# 2. P(X <= 3) -> Cumulative probability (At most 3)
p_le_3 <- ppois(3, lambda = lambda)

# 3. P(X > 7) -> More than 7 (Complement of P(X <= 7))
p_gt_7 <- 1 - ppois(7, lambda = lambda)

# 4. P(4 <= X <= 8) -> Between 4 and 8 inclusive
# Calculated as P(X <= 8) minus P(X <= 3)
p_between_4_8 <- ppois(8, lambda = lambda) - ppois(3, lambda = lambda)

# Display results formatted neatly
cat("=== Poisson Distribution (lambda = 5) Probabilities ===\n")
cat("P(X = 3)     :", round(p_eq_3, 4), "\n")
cat("P(X <= 3)    :", round(p_le_3, 4), "\n")
cat("P(X > 7)     :", round(p_gt_7, 4), "\n")
cat("P(4 <= X <= 8):", round(p_between_4_8, 4), "\n")

