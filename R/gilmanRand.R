gilmanRand <-
function(grule, N, nrows, imax){
  # grule is a string like "case300"
  # N is the number of columns/cell 
  # nrows is the number of rows/steps
  # imax is a number of elements/states, imax=2 is [0,1], imax=3 is [0,1,2],...
  initialstate<-rbinom(N,imax-1, prob = 0.5)
  ncols<-length(initialstate)
  A<-matrix(0, nrows, ncols); A[1,]<-initialstate;
  for (i in 2:nrows){
    for (j in 1:ncols){
      m<-A[i-1,j];
      if (grule < 306) {
      
      if (j==ncols){
        
        r<-A[i-1,1]
      } else {
        r<-A[i-1,j+1]
      }
      if (j==1){
        
        l<-A[i-1,ncols]
      } else {
        l<-A[i-1,j-1]
      }}
      else {if (grule == 306 | grule ==307)
        if (j==ncols){
         
          r<-A[i-1,2]
        }else{ if (j==ncols-1){
          r<-A[i-1,1]}
          else {
            r<-A[i-1,j+2]
          }}
        if (j==1){
          
          l<-A[i-1,ncols-1]
        } else {
          if (j==2){
            l<-A[i-1,ncols]}
          else{
            l<-A[i-1,j-1]
          }}
      } 
      switch(paste0("case",grule),
             
             case300 = if(isTRUE(l & m & r)) A[i,j]<-1,
             
             case301 = if(isTRUE(l & m & r)) A[i,j]<-0 else A[i,j]<-1,
             
             case302 = A[i,j]<-l,
             
             case303 = A[i,j]<-r,
             
             case304 = if((m==0 | m==1) & r==1) A[i,j]<-r
                       else 
                          if(m==2 & (r==0 | r==2)) A[i,j]<-m
                       else
                          if ((m==0 & r==0) | 
                              (m==0 & r==2) |
                              (m==1 & r==0) |
                              (m==1 & r==2) |
                              (m==2 & r==1)
                          ) A[i,j]<-0,
             
             case305 = if((m==0 | m==1) & l==1) A[i,j]<-1
                       else
                         if(m==2 & (l==0 | l==2)) A[i,j]<-m
                       else
                         if ((m==0 & l==0) | 
                             (m==0 & l==2) |
                             (m==1 & l==0) |
                             (m==1 & l==2) |
                             (m==2 & l==1)
                         ) A[i,j]<-0,
             
               case306 = A[i,j]<-l,
             
             case307 = A[i,j]<-r,
               
            stop("WRONG RULE NUMBER")
      )
    }
  }
  title1<-"Gilman Rule: "
  title2<-grule
  image(t(imax-mirror(A, axe = "y")), col = rainbow(imax), 
        main=paste(title1,title2), 
        ylab=paste("steps:", nrows), xlab=paste("cells:", ncols), axes=FALSE)
  output<-list(A=A, initialstate=initialstate)
  return(output)
}
