data(iris) 
x <- iris$Sepal.Length

mean_val <- mean(x) 
cat("1. Mean:", mean_val, "\n")

median_val <- median(x) 
cat("2. Median:",median_val,"\n")

get_mode <- function(v) {
	uniqv <- unique(v)
	uniqv[which.max(tabulate(match(v,uniqv)))]
}
mode_val <- get_mode(x)
cat("3.Mode :", mode_val, "\n")

min_val <- min(x)

cat("Min value" , min_val, "\n")

max_val <- max(x) 

cat("Max value" , max_val , "\n")

iqr_val <- IQR(x)
cat("7. Interquartile Range (IQR):", iqr_val, "\n")

# 8. Mean Absolute Deviation (Formula: mean(|x - mean(x)|))
mad_val <- mean(abs(x - mean(x)))
cat("8. Mean Absolute Deviation:", mad_val, "\n")

# 9. Variance (Sample variance s^2)
var_val <- var(x)
cat("9. Variance:", var_val, "\n")

# 10. Standard Deviation (Sample SD s, equivalent to sqrt(var(x)))
sd_val <- sd(x)
cat("10. Standard error ", sd_val,"\n")