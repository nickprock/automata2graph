\name{cellularAutomata2Graph}
\alias{cellularAutomata2Graph}
\title{
Convert a cellular automata to graph
}
\description{
A cellular automaton (pl. cellular automata, abbrev. CA) is a discrete model of computation studied in automata theory. A cellular automaton consists of a regular grid of cells, each in one of a finite number of states, such as on and off. The grid can be in any finite number of dimensions. This grid is trasformed in an adjiacency matrix and from this matrix the function create a graph. Different rules generates different social network. In the literature there are many articles concerning the classification and clustering of social network structures starting from cellular automata.
}
\usage{
cellularAutomata2Graph(cell, step, choice, imax, nGraph, rule)
}
\arguments{
  \item{cell}{
  integer: number of automata's cells
}
  \item{step}{
  integer: number of evolution steps
}
  \item{choice}{
  integer:
    1: Wolfram's rules
    0: Gilman's rules
}
  \item{imax}{
  integer: maximum cellular automata's item.
    1: Wolfram
    2: Gilman
}
  \item{nGraph}{
  integer: number of graphs calculated from cellular automata
}
  \item{rule}{
  integer: rule numbers (support also multiple rules like for example c(110:150, 300:307))
}
}
\value{
a list of graphs
}
\references{
https://en.wikipedia.org/wiki/Cellular_automaton
}
\author{
Nicola Procopio
}
\note{
I find this code but I don't remember where, when and why I wrote it. Sorry!
}

\examples{
mygraphs <- cellularAutomata2Graph(cell = 10, step = 10, choice = 1, imax = 1, nGraph = 1, rule = c(30, 126))
}

