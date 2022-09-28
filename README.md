# Person Fit for Linear Factor Analysis (PerFitFA) 
## Introduction
This is the first version of the Person Fit for Linear Factor Analysis R package. I developed it because I was looking for a method
that evaluates how well a given individual fits with a model after
a factor analysis.

There is a packaged named PerFit that does this job within the context of IRT. However, no package, to the best of my knowledge exists that can do this. Hopefully, Ferrando, Vigil-Colet & Lorenzo-Seva, from the Rovira-i-Virgili University, published two MAtlab macros that can compute the Lico and the rpg indices (see publication for details).

This package is simply an R translation of the original Matlab macros. All credit is theirs.

## Instalation
```{r}
library(devtools)
install_github("david-gallardo/PerFitFA")
```

## Use cases
