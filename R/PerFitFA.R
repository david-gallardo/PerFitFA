
#' @title  Person fit index: Personal Correlation
#'
#' @author David Gallardo-Pujol
#'
#' @description
#' `rpg`returns the personal correlation as proposed by Fowler (1954) and
#' Donlon & Fisher (1968). It is computed as the correlation between the
#' respondent’s response vector and the vector of item sample means.
#'
#' It is implemented as it appears in Ferrando PJ, Vigil-Colet A and
#' Lorenzo-Seva U (2016) Practical Person-Fit Assessment with the Linear FA
#' Model: New Developments and a Comparative Study. Front. Psychol. 7:1973.
#' doi: 10.3389/fpsyg.2016.01973
#'
#' @param X Matrix with responses related to n participants to m items (n x m)
#'
#' @return Vector with personal correlation for each participant      (n x 1)
#'
#' @examples
#' n <- 3 # persons (3)
#' m <- 5 # items (5)
#' mu <- 0 # mean
#' sigma <- 1 # sd
#'
#' df <- matrix(data = NA, nrow = n, ncol = m) # raw data
#' for (i in 1:nrow(df)) {
#'   df[i,] <- rnorm(n = m, mean = mu, sd = sigma) #m because I organize it by rows
#' }
#'
#' rpg(df)
rpg <- function(X) {

  n <- dim(X)[1]
  m <- dim(X)[2]
  mu <- colMeans(X)
  out <- matrix(data = 0, nrow = n, ncol = 1)
  r <- matrix(data = NA, nrow = 1, ncol = m)

  for (i in 1:n) {
    r <- cor(X[i,],mu)
    out[i] <- r
  }
  return(out)
}

#' @title  Person fit index: Lico
#'
#' @author David Gallardo-Pujol
#'
#' @description
#' `Lico`is a weighted mean-squared statistic which has unit expectation under
#'  the null hypothesis of inconsistency as proposed by Ferrando, Vigil-Colet &
#'  Lorenzo-Seva (2016). Large values suggest inconsistency: values of
#'  about 1.5 are generally used for judging potential inconsistency.
#'
#' It is implemented as it appears in Ferrando PJ, Vigil-Colet A and
#' Lorenzo-Seva U (2016) Practical Person-Fit Assessment with the Linear FA
#' Model: New Developments and a Comparative Study. Front. Psychol. 7:1973.
#' doi: 10.3389/fpsyg.2016.01973
#'
#' @param X Matrix with responses related to n participants to m items (n x m)
#' @param ls Latent scores estimates for n individuals in a single factor (n x 1)
#' @param lam Loading coeficients of m items related to a single factor    (m x 1)
#'
#' @return Vector with Lico index for each participant (n x 1)
#'
#' @examples
#' n <- 3 # persons (3)
#' m <- 5 # items (5)
#' mu <- 0 # mean
#' sigma <- 1 # sd
#'
#' df <- matrix(data = NA, nrow = n, ncol = m) # raw data
#' for (i in 1:nrow(df)) {
#'   df[i,] <- rnorm(n = m, mean = mu, sd = sigma) #m because I organize it by rows
#' }
#'
#'ls <- rnorm(n = n, mean = mu, sd = sigma/2) # latent score estimates for n individuals in a single factor
#'lam <- rnorm(n = m, mean = mu, sd = sigma/2) # lambdas
#'
#' Lico(X, ls, lam)
Lico <- function(X, ls, lam) {

  n <- dim(X)[1]
  m <- dim(X)[2]
  mu <- colMeans(X)
  S <- cov(X)

  out <- matrix(data = 0, nrow = n, ncol = 1)

  vare <- diag(S-(lam%*%t(lam)))
  deno <- sum(vare)

  for (i in 1:n) {
    Lin <- 0
    for (j in 1:m) {
      p2 <-  (X[i,j]-mu[j]-(lam[j]*ls[i]))
      Lin <-  Lin + (p2*p2)
    }
    in_ <- Lin/deno
    in_ <- (m/(m-1))*in_
    out[i] <- in_
  }

  return(out)
}
