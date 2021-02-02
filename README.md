# automata2graph

Automata to Graph.

>I don't remember when, where and why I developed this code. Sorry!
>In 2021 I find it, in R script format, and I'm developing this package.
>**Enjoy!**

## What's a Cellular Automata

"*A cellular automaton is a collection of "colored" cells on a grid of specified shape that evolves through a number of discrete time steps according to a set of rules based on the states of neighboring cells. The rules are then applied iteratively for as many time steps as desired. von Neumann was one of the first people to consider such a model, and incorporated a cellular model into his "universal constructor." Cellular automata were studied in the early 1950s as a possible model for biological systems (Wolfram 2002, p. 48). Comprehensive studies of cellular automata have been performed by S. Wolfram starting in the 1980s, and Wolfram's fundamental research in the field culminated in the publication of his book A New Kind of Science (Wolfram 2002) in which Wolfram presents a gigantic collection of results concerning automata, among which are a number of groundbreaking new discoveries.*" 
[Credits](https://mathworld.wolfram.com/CellularAutomaton.html)

<br>

![CA](https://i.ibb.co/M27q46W/automatons.jpg)

<br>

[Image Credits](https://javascript.christmas/2019/22)

## What automata2graph do?

**automata2graph** is an R package that computes cellular automata according to [Wolfram](https://en.wikipedia.org/wiki/Stephen_Wolfram) and [Gilman](https://scholar.google.com/citations?user=Y3JQXbAAAAAJ&hl=en)'s rules and transforms them into a social network. The cells of the automaton are the nodes of the graph.

#### Rule: 30
> Wolfram rule with 10 cells

![](https://i.imgur.com/er7guNp.png)

> Wolfram rule with 10 cells

![](https://i.imgur.com/ItxFjYN.png)

#### Rule: 307

> C.A. and graph with the same cells/nodes

![](https://i.imgur.com/hsnm8cy.png)

![](https://i.imgur.com/3C9GoOo.png)


## Exemple

```
library(devtools)
install_github("nickprock/automata2graph")

mygraphs <- cellularAutomata2Graph(cell = 10, step = 10, choice = 1, imax = 1, nGraph = 1, rule = c(30, 126))
```

## Citation

If you use this code cite this project, please

```
@misc{automata2graph,
  author =       {Nicola Procopio},
  title =        {Automata to Graph},
  howpublished = {\url{https://github.com/nickprock/automata2graph/}},
  year =         {2021}
}
```

License
---

The code present in this project is licensed under the MIT LICENSE.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
