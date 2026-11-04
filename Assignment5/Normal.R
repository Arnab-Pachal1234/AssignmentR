
mu <- 50
sd_val <- 8


p_less_45 <- pnorm(45, mean = mu, sd = sd_val)

p_greater_60 <- 1 - pnorm(60, mean = mu, sd = sd_val)

p_between <- pnorm(55, mean = mu, sd = sd_val) - pnorm(40, mean = mu, sd = sd_val)

percentile_90 <- qnorm(0.90, mean = mu, sd = sd_val)


cat("=== Normal Distribution Probabilities & Percentiles ===\n")
cat("(a) P(X < 45)     :", round(p_less_45, 4), "\n")
cat("(b) P(X > 60)     :", round(p_greater_60, 4), "\n")
cat("(c) P(40 < X < 55):", round(p_between, 4), "\n")
cat("(d) 90th Percentile :", round(percentile_90, 4), "\n")