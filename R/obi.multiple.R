#' @name obi.multiple
#' @title Measuring Japanese readability (Multiple ver.)
#' @author Jaehyun SONG
#' @description Measuring Japanese readability with multiple texts
#' @docType package
#'
#' @usage obi.multiple(file.df)
#'
#' @param file.df information of text file. The data frame must have three columns. The First column is id, the second is description, the third is filename(include path)
#' @param result.only Show only results without likihood(default is FALSE)
#' @return data.frame
#'
#' @examples
#' setwd("/Users/Username/Documents/")
#' sample.df <- data.frame(id = c(1:3), text  = c("Abe Shinzo", "Kan Naoto", "Ozawa Ichiro"), file_path = c("AS.txt", "KN.txt", "OI.txt"))
#' obi.multiple(sample.df)
NULL


obi.multiple <- function(file.df, result.only = FALSE){
  empty.vector <- rep(NA, nrow(file.df))
  if(result.only == FALSE){
    result.df <- data.frame(id = empty.vector,
                            text  = empty.vector,
                            max_ns = empty.vector,
                            max_ns_lik = empty.vector,
                            max_s2 = empty.vector,
                            max_s2_lik = empty.vector,
                            max_s3 = empty.vector,
                            max_s3_lik = empty.vector,
                            result = empty.vector)

    for(i in 1:nrow(file.df)){
      temp.result <- obi(as.character(file.df[i, 3]))

      result.df[i, ] <- c(file.df[i, 1],
                          as.character(file.df[i, 2]),
                          temp.result[[3]][1],
                          round(temp.result[[2]][temp.result[[3]][1], 2], 3),
                          temp.result[[3]][2],
                          round(temp.result[[2]][temp.result[[3]][2], 3], 3),
                          temp.result[[3]][3],
                          round(temp.result[[2]][temp.result[[3]][2], 4], 3),
                          temp.result[[4]])
    }
  }else{
    result.df <- data.frame(id = empty.vector,
                            text  = empty.vector,
                            result = empty.vector)

    for(i in 1:nrow(file.df)){
      temp.result <- obi(as.character(file.df[i, 3]))

      result.df[i, ] <- c(file.df[i, 1],
                          as.character(file.df[i, 2]),
                          temp.result[[4]])
    }
  }

  return(result.df)
}
