\name{stri_read_raw}
\alias{stri_read_raw}
\title{[DRAFT API] Read Whole Text File as Raw}
\usage{
stri_read_raw(fname)
}
\arguments{
  \item{fname}{file name}
}
\value{
Returns a raw vector.
}
\description{
Reads a text file as-is, with no conversion or text line
spliting.

\bold{[THIS IS AN EXPERIMENTAL FUNCTION]}
}
\details{
After reading a text file into memory (vast majority of
them will fit into RAM without any problems), you may
perform e.g. encoding detection (cf.
\code{\link{stri_enc_detect2}}), conversion (cf.
\code{\link{stri_encode}}), and e.g. split it into text
lines with \code{\link{stri_split_lines1}}.
}
\seealso{
Other files: \code{\link{stri_read_lines}};
\code{\link{stri_write_lines}}
}

