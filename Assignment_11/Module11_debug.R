# We create our initial function to flag rows of a numeric matrix following the Tukey rule 
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}
#We test our function using a test matrix to see what error is produced.
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
tukey_multiple(test_mat)
#Our message shows us an error regarding the && operator. This is used when there are only two logical values in the dataset (TRUE/FALSE). However, our matrix has 10 values that can be returned, which exceeds the bounds of the && operator, giving us an error message.
Error in outliers[, j] && tukey.outlier(x[, j]) : 
  'length = 10' in coercion to 'logical(1)'
#The corrected line of code is shown below. This changes the && operator to just the &, allowing the function to go row by row and compare its result to the Tukey rule, avoiding the error altogether.
outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
#Now we put it all together to have our corrected function.
corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

corrected_tukey(test_mat)

#We get an output of false all around since no rows are filled with outliers. To be marked true, all the values in a row must be outliers. While some rows have one or two outliers, it doesn't trigger the TRUE output.

FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
