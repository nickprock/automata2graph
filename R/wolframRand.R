wolframRand <-
function(wolfrule, N, nrows){
  # wolfrule is the number of rule
  # N is the number of columns/cell 
  # nrows is the number of rows/steps
  initialstate<-rbinom(N,1, prob = 0.5)
  ncols<-length(initialstate)
  A<-matrix(0, nrows, ncols); A[1,]<-initialstate;

  ru<-number2binary(wolfrule, 8)
  for (i in 2:nrows){
    
    for (j in 1:ncols){
      m<-A[i-1,j]
      if (j==ncols){
        r<-A[i-1,1]
      } else {
        r<-A[i-1,j+1]
      }
      if (j==1){
        l<-A[i-1,ncols]
      } else {
        l<-A[i-1,j-1]
      }
      if (isTRUE(
          ( l & m & r & ru[1]) |
          ( l & m &!r & ru[2]) |
          ( l &!m & r & ru[3]) |
          ( l &!m &!r & ru[4]) |
          (!l & m & r & ru[5]) |
          (!l & m &!r & ru[6]) |
          (!l &!m & r & ru[7]) |
          (!l &!m &!r & ru[8]))) {A[i,j]=1 }
    }
  }
 
  title1<-"Wolfram Rule: "
  title2<-wolfrule
  image(t(2-mirror(A, axe = "y")), col = grey(seq(0, 1, length = 2)), 
        main=paste(title1,title2), 
        ylab=paste("steps:", nrows), xlab=paste("cells:", ncols), axes=FALSE)
  output<-list(A=A, initialstate=initialstate)
  return(output)
}
