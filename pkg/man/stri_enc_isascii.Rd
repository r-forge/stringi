\name{stri_enc_isascii}
\alias{stri_enc_isascii}
\title{Check If a Data Stream Is Possibly in ASCII}
\usage{
stri_enc_isascii(str)
}
\arguments{
  \item{str}{character vector, a raw vector, or a list of
  \code{raw} vectors}
}
\value{
Returns a logical vector. Its i-th element indicates
whether the i-th string corresponds to a valid ASCII byte
sequence.
}
\description{
The function checks whether all bytes in a string are in
the set {1,2,...,127}.
}
\details{
This function is independent of the way \R marks encodings
in character strings (see \link{Encoding} and
\link{stringi-encoding}).
}
\examples{
stri_enc_isascii(letters[1:3])
stri_enc_isascii("\\u0105\\u0104")
}
\seealso{
Other encoding_detection: \code{\link{stri_enc_detect2}};
\code{\link{stri_enc_detect}};
\code{\link{stri_enc_isutf16be}},
\code{\link{stri_enc_isutf16le}},
\code{\link{stri_enc_isutf32be}},
\code{\link{stri_enc_isutf32le}};
\code{\link{stri_enc_isutf8}};
\code{\link{stringi-encoding}}
}

