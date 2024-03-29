\name{stri_enc_detect}
\alias{stri_enc_detect}
\title{[DRAFT API] Detect Character Set and Language}
\usage{
stri_enc_detect(str, filter_angle_brackets = FALSE)
}
\arguments{
  \item{str}{character vector, a raw vector, or a list of
  \code{raw} vectors}

  \item{filter_angle_brackets}{logical; If filtering is
  enabled, text within angle brackets ("<" and ">") will be
  removed before detection, which will remove most HTML or
  XML markup.}
}
\value{
Returns a list of length equal to the length of \code{str}.
Each list element is a list with the following three named
vectors representing all guesses: \itemize{ \item
\code{Encoding} -- string; guessed encodings; \code{NA} on
failure, \item \code{Language} -- string; guessed
languages; \code{NA} if the language could not be
determined (e.g. in case of UTF-8), \item \code{Confidence}
-- numeric in [0,1]; the higher the value, the more
confidence there is in the match; \code{NA} on failure. }
The guesses are ordered w.r.t. nonincreasing confidence.
}
\description{
This function uses the \pkg{ICU} engine to determine the
character set, or encoding, of character data in an unknown
format.
}
\details{
Vectorized over \code{str} and
\code{filter_angle_brackets}.

This is, at best, an imprecise operation using statistics
and heuristics. Because of this, detection works best if
you supply at least a few hundred bytes of character data
that's mostly in a single language. However, Because the
detection only looks at a limited amount of the input byte
data, some of the returned charsets may fail to handle the
all of input data. Note that in some cases, the language
can be determined along with the encoding.

Several different techniques are used for character set
detection. For multi-byte encodings, the sequence of bytes
is checked for legal patterns. The detected characters are
also check against a list of frequently used characters in
that encoding. For single byte encodings, the data is
checked against a list of the most commonly occurring three
letter groups for each language that can be written using
that encoding.

The detection process can be configured to optionally
ignore HTML or XML style markup (using ICU's internal
facilities), which can interfere with the detection process
by changing the statistics.

This function should most often be used for byte-marked
input strings, especially after loading them from text
files and before the main conversion with
\code{\link{stri_encode}}. The input encoding is of course
not taken into account here, even if marked.

The following table shows all the encodings that can be
detected:

\tabular{ll}{ \strong{Character_Set} \tab
\strong{Languages}\cr UTF-8 \tab -- \cr UTF-16BE \tab --
\cr UTF-16LE \tab -- \cr UTF-32BE \tab -- \cr UTF-32LE \tab
-- \cr Shift_JIS \tab Japanese \cr ISO-2022-JP \tab
Japanese \cr ISO-2022-CN \tab Simplified Chinese \cr
ISO-2022-KR \tab Korean \cr GB18030 \tab Chinese \cr Big5
\tab Traditional Chinese \cr EUC-JP \tab Japanese \cr
EUC-KR \tab Korean \cr ISO-8859-1 \tab Danish, Dutch,
English, French, German, Italian, Norwegian, Portuguese,
Swedish \cr ISO-8859-2 \tab Czech, Hungarian, Polish,
Romanian \cr ISO-8859-5 \tab Russian \cr ISO-8859-6 \tab
Arabic \cr ISO-8859-7 \tab Greek \cr ISO-8859-8 \tab Hebrew
\cr ISO-8859-9 \tab Turkish \cr windows-1250 \tab Czech,
Hungarian, Polish, Romanian \cr windows-1251 \tab Russian
\cr windows-1252 \tab Danish, Dutch, English, French,
German, Italian, Norwegian, Portuguese, Swedish \cr
windows-1253 \tab Greek \cr windows-1254 \tab Turkish \cr
windows-1255 \tab Hebrew \cr windows-1256 \tab Arabic \cr
KOI8-R \tab Russian \cr IBM420 \tab Arabic \cr IBM424 \tab
Hebrew \cr }

If you have some initial guess on language and encoding,
try with \code{\link{stri_enc_detect2}}.
}
\examples{
\dontrun{
f <- rawToChar(readBin("test.txt", "raw", 1024))
stri_enc_detect(f)
}
}
\references{
\emph{Character Set Detection} -- ICU User Guide,
\url{http://userguide.icu-project.org/conversion/detection}
}
\seealso{
Other encoding_detection: \code{\link{stri_enc_detect2}};
\code{\link{stri_enc_isascii}};
\code{\link{stri_enc_isutf16be}},
\code{\link{stri_enc_isutf16le}},
\code{\link{stri_enc_isutf32be}},
\code{\link{stri_enc_isutf32le}};
\code{\link{stri_enc_isutf8}};
\code{\link{stringi-encoding}}
}

