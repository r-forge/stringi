\name{stri_flatten}
\alias{stri_flatten}
\title{Flatten a String}
\usage{
stri_flatten(str, collapse = "")
}
\arguments{
  \item{str}{vector of strings to be coerced to character}

  \item{collapse}{single string denoting the separator}
}
\value{
Returns a single string, i.e. a character vector of length
1.
}
\description{
Joins the elements of a character vector into one string.
}
\details{
\code{stri_flatten(str, collapse='XXX')} works like
\code{\link{paste}(str, collapse='XXX', sep="")}.

If you wish to use some more fancy \code{collapse}
separators between flattened strings, call
\code{\link{stri_join}(str, separators, collapse='')}.

If \code{str} is not empty, then a single string is
returned. If \code{collapse} has length > 1, then only
first string will be used.
}
\examples{
stri_flatten(LETTERS)
stri_flatten(LETTERS, collapse=",")
stri_flatten(c('abc','123','\\u0105\\u0104'))
stri_flatten(stri_dup(letters[1:6],1:3))
}
\seealso{
Other join: \code{\link{stri_c}}, \code{\link{stri_join}},
\code{\link{stri_paste}}; \code{\link{stri_dup}}
}

