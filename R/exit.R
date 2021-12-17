#' exit - a check to exit looping functions
#'
#' @param input a text character - should be from a while loop with user input
#'
#' @export
exit <- function(input){
  if(input %in% c("EXIT","exit","Exit","QUIT","Quit","quit",
                  "Q","q")){
    stop("Exit Command Given, This may not be an error but it broke the while
         loop either way")
  }
}

#' exitText - a function to print out exit warning
#'
#' @export
exitText <- function(){
  return("You can alway enter 'EXIT' or 'QUIT to get out")
}
