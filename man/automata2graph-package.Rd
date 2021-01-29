\name{automata2graph-package}
\alias{automata2graph-package}
\alias{automata2graph}
\docType{package}
\title{
\packageTitle{automata2graph}
}
\description{
\packageDescription{automata2graph}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{automata2graph}
\packageIndices{automata2graph}
This package contains only one function cellularAutomata2Graph.
}
\author{
\packageAuthor{automata2graph}
Maintainer: \packageMaintainer{automata2graph}
}
\references{
I don't remember when, where and why I wrote that functions, for more informations about cellular automata: [https://en.wikipedia.org/wiki/Cellular_automaton]
}
\examples{
myGraphs <- cellularAutomata2Graph(cell = 20, step = 50, choice = 1, imax = 1, nGraph = 1, rule = c(30, 126))
}
