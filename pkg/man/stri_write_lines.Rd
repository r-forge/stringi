\name{stri_write_lines}
\alias{stri_write_lines}
\title{[DRAFT API] Write Text Lines to a Text File}
\usage{
stri_write_lines(str, fname, encoding = "UTF-8",
  sep = ifelse(.Platform$OS.type == "windows", "\\r\\n", "\\n"))
}
\arguments{
  \item{str}{character vector}

  \item{fname}{file name}

  \item{encoding}{output encoding, \code{NULL} or \code{""}
  for the current default one}

  \item{sep}{newline separator}
}
\value{
This function does not return anything interesting
}
\description{
Writes a text file such that each element of a given
character vector becomes a separate text line.

\bold{[THIS IS AN EXPERIMENTAL FUNCTION]}
}
\details{
It is a substitute for the \R \code{\link{writeLines}}
function, with the ability to re-encode output without any
strange function calls.

Note that we suggest using the UTF-8 encoding for all text
files: thus, it is the default one for the output.
}
\seealso{
Other files: \code{\link{stri_read_lines}};
\code{\link{stri_read_raw}}
}

