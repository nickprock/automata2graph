wolframECA <-
function(wolfrule, n, nrows, choice, imax){
  # n : number of cells
  # nrow : number of time steps
  # choice=1 wolfram, choice=0 gilman
  # imax number of states
  # wolfrule is the rule number of the rule we want to evolve: 1-256 wolfram rules, 
  nedges<-1 # count the number of edges of the derived graph
  if (choice==1){
    CA<-wolframRand(wolfrule, n, nrows)
  } else {
    CA<-gilmanRand(wolfrule, n, nrows, imax)
  }
  last<-1
  archi<-data.frame(edge1=numeric(1), edge2=numeric(1))
  for (i in 1:n){
    pertubatedState<-CA$initialstate
    if (choice==1){
      if(pertubatedState[i]==1){pertubatedState[i]<-0} else{
        if(pertubatedState[i]==0){pertubatedState[i]<-1}
      }
      AP<-wolfram1(wolfrule, pertubatedState, nrows)
    } else {
      if (imax==2){
        if(pertubatedState[i]==1){pertubatedState[i]<-0} else{
          if(pertubatedState[i]==0){pertubatedState[i]<-1}
        }
        AP<-gilman(wolfrule, pertubatedState, nrows,imax)
      } else {
        switch(
          paste0("c",CA$initialstate[i]),
          c0 = {pertubatedState[i]<-1;AP<-gilman(wolfrule, pertubatedState, nrows,imax);
                pertubatedState[i]<-2;AP1<-gilman(wolfrule, pertubatedState, nrows,imax)
            },
          c1 = {pertubatedState[i]<-0;AP<-gilman(wolfrule, pertubatedState, nrows,imax);
                pertubatedState[i]<-2;AP1<-gilman(wolfrule, pertubatedState, nrows,imax)
            },
          c2 = {pertubatedState[i]<-0;AP<-gilman(wolfrule, pertubatedState, nrows,imax);
                pertubatedState[i]<-1;AP1<-gilman(wolfrule, pertubatedState, nrows,imax)
            }
        )
      }
    }
    last<-nrows
    if ((choice==1) | (imax==2)){
      SB<-binarySum(CA$A,AP)
    } else {
      SB<-compDiff(CA$A, AP, AP1)
    }
    nzero<-sum(SB[last,])
    while ((nzero==0) & (last>1)){
      last<-last-1
      nzero<-sum(SB[last,])
    }
      for (j in 1:n){
        if (SB[last,j]==1 & i!=j){
          archi[nedges,1]<-i;
          archi[nedges,2]<-j;
          nedges<-nedges+1 
        }
        
      }

  }
  output<-list(archi=archi, nedges=nedges)
  return(output)
}
