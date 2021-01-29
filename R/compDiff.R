compDiff <-
function(A, B, C){
  R<-matrix(0, length(A[,1]), length(A[1,]))
  for (i in 1:length(A[,1])){
    for (j in 1:length(A[1,])){
      if ((A[i,j]!=B[i,j]) | (A[i,j]!=C[i,j])) {R[i,j]<-1}
    }
  }
  return(R)
}
