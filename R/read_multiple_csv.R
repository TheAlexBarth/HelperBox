#' read_multiple_csv - read multiple csv files
#'
#' This function will take multiple csv files
#' It will read them and return all as one dataframe
#' It is it will read files in the order of provided index
#'
#' @param path the folder you want to pull from
#' @param index the index of all csv files in the working directory
#' @param header to talk to read.csv, default true
#' @param as.is to talk to read.csv, default true
#'
#' @importFrom utils read.csv
#'
#' @export
read_multiple_csv <- function(index, header = TRUE, as.is = TRUE){

  #initialize holder list
  list_file <- vector(mode = "list", length = length(index))

  for(i in 1:length(index)){
    list_file[[i]] <- read.csv(dir(path)[index[i]], header = header, as.is = as.is)
  }
  output_df <- do.call(rbind,list_file)

}
