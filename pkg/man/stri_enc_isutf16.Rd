\name{stri_enc_isutf16be}
\alias{stri_enc_isutf16be}
\alias{stri_enc_isutf16le}
\alias{stri_enc_isutf32be}
\alias{stri_enc_isutf32le}
\title{Check If a Data Stream Is Possibly in UTF16 or UTF32}
\usage{
stri_enc_isutf16be(str)

stri_enc_isutf16le(str)

stri_enc_isutf32be(str)

stri_enc_isutf32le(str)
}
\arguments{
  \item{str}{character vector, a raw vector, or a list of
  \code{raw} vectors}
}
\value{
Returns a logical vector.
}
\description{
These functions detect whether a given byte stream is valid
UTF-16LE, UTF-16BE, UTF-32LE, or UTF-32BE.
}
\details{
These functions are independent of the way \R marks
encodings in character strings (see \link{Encoding} and
\link{stringi-encoding}). Anyway, most often, you will
provide input data as raw vectors here.

Negative answer means that a string is surely not in valid
UTF-16 or UTF-32. Positive result does not mean that we
should be absolutely sure.

Also, note that sometimes a data stream may be classified
as both valid UTF-16LE and UTF-16BE.
}
\seealso{
Other encoding_detection: \code{\link{stri_enc_detect2}};
\code{\link{stri_enc_detect}};
\code{\link{stri_enc_isascii}};
\code{\link{stri_enc_isutf8}};
\code{\link{stringi-encoding}}
}

