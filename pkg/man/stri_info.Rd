\name{stri_info}
\alias{stri_info}
\title{Query Default Settings for \pkg{stringi}}
\usage{
stri_info(short = FALSE)
}
\arguments{
  \item{short}{logical; whether or not the results should
  be given in a concise form; defaults to \code{TRUE}}
}
\value{
If \code{short==TRUE}, then a single string containing
information on default character encoding, locale, and
Unicode as well as \pkg{ICU} version is returned.

Otherwise, you a list with the following components is
returned: \itemize{ \item \code{Unicode.version} -- version
of Unicode supported by the \pkg{ICU} library; \item
\code{ICU.version} -- \pkg{ICU} library version used; \item
\code{Locale} -- contains information on default locale, as
returned by \code{\link{stri_locale_info}}; \item
\code{Charset.internal} -- always \code{c("UTF-8",
"UTF-16")}; \item \code{Charset.native} -- information on
default encoding, as returned by
\code{\link{stri_enc_info}}. }
}
\description{
Presents current default settings used by the \pkg{ICU}
library.
}

