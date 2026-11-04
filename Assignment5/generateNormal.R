m <- 5
s <- 5
y <- rnorm(n=500,mean=m,sd=s)

actual_mean <- mean(y)
actual_sd <- sd(y)

cat("The Actual mean is ", actual_mean, "The Expected Mean is ",m,"\n")
cat("The Actual SD is ",actual_sd, "The Expected SD is ",s,"\n")