#' consecutive_add - add consecutive events
#'
#' This function will count repeat observations and add them together
#' it creates a new data frame for duration of each event
#'
#' @param data the a data frame or vector to count
#' @param use_index boolean, should it index a value for start and end?
#' @param index_value if use_index true, provide a value for labels
#' @param threshold what value should the distinguishing be?
#'
consecutive_add <- function(data, threshold, use_index = F,
                       index_value = NULL){

  #set_up run length
  run_length <-  length(data)

  #choose labels
  if(use_index){
    labs <- index_value
  } else {
    labs <- 1:run_length
  }

  #initialize storage vectors
  start_point <- labs[1]
  end_point <- NULL
  value <- NULL

  if(data[1] > threshold){
    run_count <- data[1]
  } else {
    run_count <- 0
  }

  line_count = 1
  #start at second point
  for(i in 2:run_length){
    if(data[i] > threshold){
      run_count <- c(run_count,data[i])
      next
    } else {
      #end last line
      value[line_count] <- sum(run_count)
      end_point[line_count] <- labs[i-1]
      #set up new line
      line_count <- line_count + 1
      start_point[line_count] <- labs[i]
      #end the line
      end_point[line_count] <- labs[i]
      value[line_count] <- 0
      #prep for next line
      run_count <- 0
      if(i < run_length){
        start_point[line_count+1] <- labs[i+1]
      }
    }
  }

  output <- data.frame(start_point, end_point,value)

}
