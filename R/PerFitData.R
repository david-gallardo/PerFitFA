#' 18-item Spanish version of Ray's balanced dogmatism scale
#'
#' Data from the supplementary material of Ferrando, Vigil-Colet & Lorenzo-Seva.
#' This scale was administered to a group of 346 undergraduate students. The items
#' of this scale used a 6-point Likert format ranging from “completely disagree”
#' (1) to completely agree (6). The BDS Scale is composed by 18 items.
#'
#'
#' @docType data
#'
#' @usage data(PerFitData)
#'
#' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
#'
#' @keywords datasets
#'
#' @references Ferrando PJ, Vigil-Colet A and Lorenzo-Seva U (2016) Practical Person-Fit Assessment with the Linear FA Model: New Developments and a Comparative Study. Front. Psychol. 7:1973. doi: 10.3389/fpsyg.2016.01973
#' (\href{https://www.frontiersin.org/articles/10.3389/fpsyg.2016.01973/full}{Frontiers in Psychology})
#'
#' @source \href{https://www.frontiersin.org/articles/file/downloadfile/241345_supplementary-materials_datasheets_1_doc/octet-stream/Data%20Sheet%201.DOC/1/241345}{Supplementary Material}
#'
#' @examples
#' data(PerFitData)
#' cor.bds <- cor(PerFitData)
#' 1stItem <- PerFitData$i1
"perfitdata"
