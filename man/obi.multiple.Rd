% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/obi.multiple.R
\docType{package}
\name{obi.multiple}
\alias{obi.multiple}
\alias{obi.multiple-package}
\title{Measuring Japanese readability (Multiple ver.)}
\usage{
obi.multiple(file.df)
}
\arguments{
\item{file.df}{information of text file. The data frame must have three columns. The First column is id, the second is description, the third is filename(include path)}

\item{result.only}{Show only results without likihood(default is FALSE)}
}
\value{
data.frame
}
\description{
Measuring Japanese readability with multiple texts
}
\examples{
setwd("/Users/Username/Documents/")
sample.df <- data.frame(id = c(1:3), text  = c("Abe Shinzo", "Kan Naoto", "Ozawa Ichiro"), file_path = c("AS.txt", "KN.txt", "OI.txt"))
obi.multiple(sample.df)
}
\author{
Jaehyun SONG
}

