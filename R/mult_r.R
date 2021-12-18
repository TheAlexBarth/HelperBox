#' mult_r - a function to source multiple files at once
#'
#' @param path the folder which contains all your files
#' @param files which files to enter from the folder
#' @param entry the enter function - either load or source
#'
#' @export
mult_r <- function(path,files,entry){
  invisible(sapply(paste(path,files,sep = ""),entry))
}
