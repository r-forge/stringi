\name{stri_locale_set}
\alias{stri_locale_get}
\alias{stri_locale_set}
\title{Set or Get Default Locale in \pkg{stringi}}
\usage{
stri_locale_set(locale)

stri_locale_get()
}
\arguments{
  \item{locale}{single string of the form \code{Language},
  \code{Language_Country}, or
  \code{Language_Country_Variant}, e.g. "en_US", see
  \code{\link{stri_locale_list}}}
}
\value{
\code{stri_locale_set} returns a string with previously
used locale, invisibly.

\code{stri_locale_get} returns a string of the form
\code{Language}, \code{Language_Country}, or
\code{Language_Country_Variant}, e.g. "en_US".
}
\description{
\code{stri_locale_set} changes default locale for all
functions in the \pkg{stringi} package, i.e. establishes
the meaning of the ``\code{NULL} locale'' argument of
locale-sensitive functions. On the other hand,
\code{stri_locale_get} gets current default locale.
}
\details{
See \link{stringi-locale} for more information on the
effect of changing default locale.

\code{stri_locale_get} is the same as
\code{\link{stri_locale_info}(NULL)$Name}.
}
\examples{
\dontrun{
oldloc <- stri_locale_set("pt_BR")
# ... some locale-dependent operations
# ... note that you may always modify a locale per-call
# ... changing default locale is convinient if you perform
# ... many operations
stri_locale_set(oldloc) # restore previous default locale
}
}
\seealso{
Other locale_management: \code{\link{stri_locale_info}};
\code{\link{stri_locale_list}};
\code{\link{stringi-locale}}
}

