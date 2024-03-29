\name{stri_locale_list}
\alias{stri_locale_list}
\title{List Available Locales}
\usage{
stri_locale_list()
}
\value{
Returns a character vector with locale identifiers that are
known to \pkg{ICU}.
}
\description{
Creates a character vector with all known locale
identifies.
}
\details{
Note that not all services may be available for all
locales. Queries for locale-specific services are always
performed during the resource request.

See \link{stringi-locale} for more information.
}
\seealso{
Other locale_management: \code{\link{stri_locale_get}},
\code{\link{stri_locale_set}};
\code{\link{stri_locale_info}};
\code{\link{stringi-locale}}
}

