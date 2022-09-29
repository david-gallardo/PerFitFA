#' Lico Critical Value
#'
#' @description `lcv` computes the critical value for computing cut-off values.
#' This is based on Smith et al. (1998) that suggested refined cuttoff values
#' tthat take into account weighted discrepancy. It is given by:
#'
#' \eqn{critical.value = 1 + \frac{2}{\sqrt{n}}}

#' @param n sample size (integer)
#'
#' @return critical value
#' @export
#'
#' @examples lcv(200)
lcv <- function(n) {
  lcv <- 1+(2/sqrt(n)) # Lico critical value

  return(lcv)
}
