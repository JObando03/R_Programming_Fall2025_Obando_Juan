#create matrix A
A <- matrix(1:100,  nrow = 10)
#create matrix B
B <- matrix(1:1000, nrow = 10)
#check the dimensions of A
dim(A)
[1] 10 10
#check the dimensions of B
dim(B)
[1]  10 100
#invert A
invA <- solve(A)
Error in solve.default(A) : 
  Lapack routine dgesv: system is exactly singular: U[6,6] = 0
#This error appears because the value [6,6] shows a singularity
#We determine if the matrix is invertible, but it returns 0, indicating it cannot be inverted.
detA <- det(A)
#The returned value shows that the matrix must be a square
invB <- tryCatch(solve(B), error = function(e) e)
#The value returned shows that it cannot be inverted because it must be a square matrix
detB <- tryCatch(det(B),   error = function(e) e)
