A <- matrix(c(4,2,1,3),nrow=2,ncol=2,byrow=TRUE)
B <- matrix(c(1,5,2,3) ,nrow = 2,ncol=2, byrow=TRUE) 
cat("Matrix A:\n") 
print(A)
cat("\nMatrix B:\n")
print(B) 

add_res <- A+B
sub_res <- A-B
mul_res <- A %*% B 
trans_A <- t(A) 
inv_A <- solve(A) 
det_A <- det(A) 
rank_A <- qr(A)$rank
eig_A <- eigen(A) 

cat("Eigen_value ")
eigvalue_A <- eig_A$values
print(eigvalue_A)
eigvector_A <- eig_A$vector
cat(eigvector_A)
