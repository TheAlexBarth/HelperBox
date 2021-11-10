#' add_range - add a range to a value
#'
#' This builds a range around a value
#'
#' @param x data to enter. must be numeric
#' @param bound range of data to enter
#'
#' @export
add_range <- function(x, bound){
  if(all(is.numeric(x),is.numeric(bound))){
    low <- x - bound
    high <- x + bound
  } else {
    stop("Non-numeric value entered")
  }
  return(c(low,high))
}


#' in_range - check to see if value is in a range
#'
#' checks if values are in a range
#'
#' @param x data to check
#' @param bounds either a single value or two points
#'
#' @export
in_range <- function(x, bounds){
  if(all(is.numeric(x),is.numeric(bounds))){
    if(length(bounds) == 1){
      low <- min(add_range(x,bounds))
      high <- max(add_range(x,bounds))
    } else {
      low <- min(bounds)
      high <- max(bounds)
    }
    out <- c(x >= low & x <= high)
  } else {
    stop("non-numeric entry")
  }
  return(out)
}
