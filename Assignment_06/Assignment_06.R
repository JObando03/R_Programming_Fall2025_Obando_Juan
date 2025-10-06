#Create both A and B matrices
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)
#Add matrix B to A
A+B
     [,1] [,2]
[1,]    7    5
[2,]    2    2
#Subtract matrix B from A
A-B
     [,1] [,2]
[1,]   -3   -3
[2,]   -2    4
#Create Matrix D with diagonal fill
D <- diag(c(4, 1, 2, 3))
     [,1] [,2] [,3] [,4]
[1,]    4    0    0    0
[2,]    0    1    0    0
[3,]    0    0    2    0
[4,]    0    0    0    3
#Create matrix C to look as requested in the assignment. 
#First, create the first column with all its values, then create a matrix with a diagonal fill of 3s.
#Use the cbind command to put them together and create Matrix C
C<-cbind(c(3,2,2,2,2),
         rbind(1, diag(3,4)))
     [,1] [,2] [,3] [,4] [,5]
[1,]    3    1    1    1    1
[2,]    2    3    0    0    0
[3,]    2    0    3    0    0
[4,]    2    0    0    3    0
[5,]    2    0    0    0    3
