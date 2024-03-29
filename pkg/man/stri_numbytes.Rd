\name{stri_numbytes}
\alias{stri_numbytes}
\title{Count the Number of Bytes}
\usage{
stri_numbytes(str)
}
\arguments{
  \item{str}{character vector}
}
\value{
Returns an integer vector of the same length as \code{str}.
}
\description{
Counts the number of bytes needed to store all the
characters of each string in computer's memory.
}
\details{
This is often not the function you would normally use in
your string processing activities. See rather
\code{\link{stri_length}}.

For 8-bit encoded strings, this is the same as
\code{\link{stri_length}}. For UTF-8 strings, the returned
values may be greater than the number of code points, as
UTF-8 is not a fixed-byte encoding: one code point may be
represented with 1-4 bytes (according to the current
Unicode standard).

Missing values are handled properly, as opposed to the
built-in \code{\link{nchar}(str, "bytes")} function call.

The strings do not need to be re-encoded to perform this
operation.

The returned values does not of course include the trailing
NUL bytes, which are used internally to mark the end of
string data (in C).
}
\examples{
stri_numbytes(letters)
stri_numbytes(c('abc','123','\\u0105\\u0104'))
\dontrun{
# this may fail on Windows, as there is no native support for 4-bytes
# Unicode characters; see, however, stri_escape_unicode():
stri_numbytes('\\U7fffffff') # compare stri_length('\\U7fffffff')
}
}
\seealso{
Other length: \code{\link{stri_isempty}};
\code{\link{stri_length}}
}

