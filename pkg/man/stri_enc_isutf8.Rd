\name{stri_enc_isutf8}
\alias{stri_enc_isutf8}
\title{Check If a Data Stream Is Possibly in UTF-8}
\usage{
stri_enc_isutf8(str)
}
\arguments{
  \item{str}{character vector, a raw vector, or a list of
  \code{raw} vectors}
}
\value{
Returns a logical vector. Its i-th element indicates
whether the i-th string corresponds to a valid UTF-8 byte
sequence.
}
\description{
The function checks whether given sequences of bytes forms
a proper UTF-8 string.
}
\details{
Negative answer means that a string is surely not valid
UTF-8. Positive result does not mean that we should be
absolutely sure.  E.g. \code{(c4,85)} properly represents
("Polish a with ogonek") in UTF-8 as well as ("A umlaut",
"Ellipsis") in WINDOWS-1250. Also note that UTF-8, as well
as most 8-bit encodings, have ASCII as their subsets (note
that \code{\link{stri_enc_isascii}} =>
\code{\link{stri_enc_isutf8}}).

However, the longer the sequence, the bigger the
possibility that the result is indeed in UTF-8 -- this is
because not all sequences of bytes are valid UTF-8.

This function is independent of the way \R marks encodings
in character strings (see \link{Encoding} and
\link{stringi-encoding}).
}
\examples{
stri_enc_isutf8(letters[1:3])
stri_enc_isutf8("\\u0105\\u0104")
stri_enc_isutf8("\\u1234\\u0222")
}
\seealso{
Other encoding_detection: \code{\link{stri_enc_detect2}};
\code{\link{stri_enc_detect}};
\code{\link{stri_enc_isascii}};
\code{\link{stri_enc_isutf16be}},
\code{\link{stri_enc_isutf16le}},
\code{\link{stri_enc_isutf32be}},
\code{\link{stri_enc_isutf32le}};
\code{\link{stringi-encoding}}
}

