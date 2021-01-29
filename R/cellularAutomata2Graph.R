cellularAutomata2Graph <-
function(cell, step, choice, imax, nGraph, rule){
graph.vector.all <- vector(mode = "list", length = length(rule))
for (i in 1:length(rule)){
  # node
  graph.vector.rule <- vector(mode = "list")
  for (j in 1:nGraph){
    if (rule[i]<300){
      el <- wolframECA(rule[i], cell, step, choice, imax)
      g <- graph.empty(n=cell, directed = FALSE)
      if (el$nedges>1){
        for (k in 1:length(el$archi[,1])){
          g <- add.edges(g, el$archi[k,])
        }
      }
      # insert in vector
      graph.vector.rule[[j]] <- g
      
    } else{
      if (rule[i]>=300 && rule[i]<304){
        choice <- 0
        el <- wolframECA(rule[i], cell, step, choice, imax)
        g <- graph.empty(n=cell, directed = FALSE)
        if (el$nedges>1){
          for (k in 1:length(el$archi[,1])){
            g <- add.edges(g, el$archi[k,])
          }
        }
        # insert in vector
        graph.vector.rule[[j]] <- g
      } else { 
        if (rule[i]==304 | rule[i]==305){
          choice <- 0 
          imax <- 3
          el <- wolframECA(rule[i], cell, step, choice, imax)
          g <- graph.empty(n=cell, directed = FALSE)
          if (el$nedges>1){
            for (k in 1:length(el$archi[,1])){
              g <- add.edges(g, el$archi[k,])
            }
          }
          # insert in vector
          graph.vector.rule[[j]] <- g
        } else { 
        if (rule[i]==306 | rule[i]==307){
          choice <- 0 
          imax <- 2
          el <- wolframECA(rule[i], cell, step, choice, imax)
          g <- graph.empty(n=cell, directed = FALSE)
          if (el$nedges>1){
            for (k in 1:length(el$archi[,1])){
              g <- add.edges(g, el$archi[k,])
            }
          }
          # insert in vector
          graph.vector.rule[[j]] <- g
        } 
      }
    } 
  }}
  graph.vector.all[[rule[i]]] <- graph.vector.rule
}
par(mar=c(1,1,1,1))
par(mfrow = c(1,1))
p=1
for (i in rule[1]:rule[length(rule)]){
  title1 <- "Graph: "
  title2 <- i
  title <- paste(title1, title2)
 
  for (j in 1:nGraph){
    if (!is.null(graph.vector.all[[i]][[j]])){
      plot.igraph(graph.vector.all[[i]][[j]], main=title, vertex.color="lightblue", edge.width=5)
    }
  }
  p=p+1
}
return(graph.vector.all[rule])
}
