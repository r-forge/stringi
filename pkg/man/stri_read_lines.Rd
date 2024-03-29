\name{stri_read_lines}
\alias{stri_read_lines}
\title{[DRAFT API] Read Text Lines from a Text File}
\usage{
stri_read_lines(fname, encoding = "auto", locale = NA,
  fallback_encoding = stri_enc_get())
}
\arguments{
  \item{fname}{single string with file name}

  \item{encoding}{single string; input encoding,
  \code{"auto"} for automatic detection with
  \code{\link{stri_enc_detect2}}, and \code{NULL} or
  \code{""} for the current default encoding.}

  \item{locale}{single string passed to
  \code{\link{stri_enc_detect2}}; \code{NULL} or \code{""}
  for default locale, \code{NA} for checking just UTF-*
  family}

  \item{fallback_encoding}{single string; encoding to be
  used if encoding detection fails; defaults to the current
  default encoding, see \code{\link{stri_enc_get}}}
}
\value{
Returns a character vector, with each line of text being a
single string. The output is always in UTF-8.
}
\description{
Reads a text file, re-encodes it, and splits it into text
lines.

\bold{[THIS IS AN EXPERIMENTAL FUNCTION]}
}
\details{
It is a substitute for the system's \code{\link{readLines}}
function, with the ability to auto-detect input encodings
(or specify one manually), re-encode input without any
strange function calls or sys options change, and split the
text into lines with \code{\link{stri_split_lines1}} (which
conforms with the Unicode guidelines for newline markers).

If \code{locale} is \code{NA} and auto-detect of
UTF-32/16/8 fails, then \code{fallback_encoding} is used.
}
\seealso{
Other files: \code{\link{stri_read_raw}};
\code{\link{stri_write_lines}}
}

