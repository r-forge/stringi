\name{stri_sub}
\alias{stri_sub}
\alias{stri_sub<-}
\title{Extract a Substring From or Replace a Substring In a Character Vector}
\usage{
stri_sub(str, from = 1L, to = -1L, length = .Machine$integer.max)

stri_sub(str, from = 1L, to = -1L, length) <- value
}
\arguments{
  \item{str}{character vector}

  \item{from}{integer vector or two-column matrix}

  \item{to}{integer vector; mutually exclusive with
  \code{length} and \code{from} being a matrix}

  \item{length}{integer vector; mutually exclusive with
  \code{to} and \code{from} being a matrix}

  \item{value}{character vector to be substituted
  [replacement function]}
}
\value{
\code{stri_sub} returns a character vector.
\code{stri_sub<-} changes the \code{value} object.

The extract function \code{stri_sub} returns the indicated
substrings. The replacement function \code{stri_sub<-} is
invoked for its side effect: after a call, \code{str} is
modified.
}
\description{
The first function extracts substrings under code
point-based index ranges provided. The second one allows
you to substitute parts of a string with given strings.
}
\details{
Vectorized over \code{str}, [\code{value}], \code{from} and
(\code{to} or \code{length}). \code{to} and \code{length}
are mutually exclusive.

\code{to} has priority over \code{length}. If \code{from}
is a two-column matrix, then the first column is used as
\code{from} and the second one as \code{to}. In such case
arguments \code{to} and \code{length} are ignored.

Of course, the indices are code point-based, and not
byte-based. Note that for some Unicode strings, the
extracted substrings may not be well-formed, especially if
the input is not NFC-normalized, includes byte order marks,
Bidirectional text marks, and so on. Handle with care.

Indices are 1-based, i.e. an index equal to 1 denotes the
first character in a string, which gives a typical \R
look-and-feel. Argument \code{to} defines the last index of
the substring, inclusive.

For negative indices in \code{from} or \code{to}, counting
starts at the end of the string. E.g. index -1 denotes the
last code point in the string. Negative \code{length} means
counting backwards.

In \code{stri_sub}, out-of-bound indices are silently
corrected. If \code{from} > \code{to}, then an empty string
is returned.

In \code{stri_sub<-}, ``strange'' configurations of indices
work as string concatenation at the front, back, or middle.
}
\examples{
s <- "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
stri_sub(s, from=1:3*6, to=21)
stri_sub(s, from=c(1,7,13), length=5)
stri_sub(s, from=1, length=1:3)
stri_sub(s, -17, -7)
stri_sub(s, -5, length=4)
(stri_sub(s, 1, 5) <- "stringi")
(stri_sub(s, -6, length=5) <- ".")
(stri_sub(s, 1, 1:3) <- 1:2)
}
\seealso{
Other indexing: \code{\link{stri_locate_all_charclass}},
\code{\link{stri_locate_all_charclass}},
\code{\link{stri_locate_first_charclass}},
\code{\link{stri_locate_first_charclass}},
\code{\link{stri_locate_last_charclass}},
\code{\link{stri_locate_last_charclass}};
\code{\link{stri_locate_all_fixed}},
\code{\link{stri_locate_all_fixed,}},
\code{\link{stri_locate_first_fixed}},
\code{\link{stri_locate_first_fixed,}},
\code{\link{stri_locate_last_fixed}},
\code{\link{stri_locate_last_fixed}};
\code{\link{stri_locate_all_regex}},
\code{\link{stri_locate_all_regex}},
\code{\link{stri_locate_first_regex}},
\code{\link{stri_locate_first_regex}},
\code{\link{stri_locate_last_regex}},
\code{\link{stri_locate_last_regex}};
\code{\link{stri_locate_all}};
\code{\link{stri_locate_first}};
\code{\link{stri_locate_last}}; \code{\link{stri_locate}}
}

