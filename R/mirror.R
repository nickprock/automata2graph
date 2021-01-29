mirror <-
function(M, axe){
  M1<-M
  if (axe=="y"){
    j<-seq(length(M[,1]),1)
    for (i in 1:length(M[,1])){
      ind<-j[i]
      M1[i,]<-M[ind,]
    }
  } else{
      if (axe=="x"){
       j<-seq(length(M[1,]),1)
        for (i in 1:length(M[1,])){
          ind<-j[i]
         M1[,i]<-M[,ind]
        }
     }
    }
  return (M1)
}
