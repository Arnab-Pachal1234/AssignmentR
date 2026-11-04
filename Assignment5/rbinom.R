
points <- rbinom(n=1000,size=2,prob=0.3)
print(points)

px_eq_2 <-  dpois(2,4.5)
cat(" P(x=2) :",px_eq_2)

#Question number 10 
lambda <- 6
p_eq_4 <- dpois(4,lambda)
p_eq_5 <- ppois(5,lambda)
p_gt_8 <- 1 - ppois(7,lambda)

