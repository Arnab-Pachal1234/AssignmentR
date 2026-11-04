# Parameters for the binomial distribution
n <- 12
p <- 0.25
x <- 0:n

pmf <- dbinom(x, size = n, prob = p)
cdf <- pbinom(x, size = n, prob = p)

par(mfrow=c(1,2))

plot(x,pmf,type="h",col="blue",main="Binomial PMF (12,0.25)",
xlab="Number of Successes(x)", ylab="Probability P(X==x)")

plot(x,cdf,type="s",col="darkgreen",main="Binomial CDF (12,0.25)",
xlab="Number of Successes (x)" ,ylab="Cumulative Probability")

p_eq_4 <- dbinom(4,size=n,prob=p)
p_le_4 <- pbinom(4,size=n,prob = p)
p_ge_5 <- 1-pbinom(4,size=n,prob=p)

cat("P(x=4):",p_eq_4,"\n")
cat("p(x<=4):",p_le_4,"\n")
cat("p(x>=5):",p_ge_5, "\n")