## This file is part of the 'stringi' package for R.
##
## Copyright (C) 2013-2014 Marek Gagolewski, Bartek Tartanus
##
##
## Permission is hereby granted, free of charge, to any person obtaining
## a copy of this software and associated documentation files (the "Software"),
## to deal in the Software without restriction, including without limitation
## the rights to use, copy, modify, merge, publish, distribute, sublicense,
## and/or sell copies of the Software, and to permit persons to whom
## the Software is furnished to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included
## in all copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
## EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
## OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
## IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
## DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
## TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
## THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#' @title
#' Locales and \pkg{stringi}
#'
#' @description
#' In this section we explain how we deal with locales in \pkg{stringi}.
#' Locale is a fundamental concept in ICU.
#' It identifies a specific user community, i.e. a group of users
#' who have similar culture and language expectations
#' for human-computer interaction.
#'
#'
#' @details
#' Because a locale is just an identifier for a region,
#' no validity check is performed when you specify a Locale.
#' \pkg{ICU} is implemented as a set of services.
#' If you want to see whether particular resources are available
#' for the locale you asked for, you must query those resources.
#' Note: When you ask for a resource for a particular locale, you get
#' back the best available match, not necessarily precisely what you requested.
#'
#' @section Locale Identifiers:
#'
#' \pkg{ICU} services are parametrized by locale,
#' to deliver culturally correct results.
#' Locales are identified by character strings
#' of the form \code{Language} code,
#' \code{Language_Country} code, or \code{Language_Country_Variant}
#' code, e.g. "en_US".
#'
#' The two-letter \code{Language} code uses the ISO-639-1 standard,
#' e.g. "en" stands for English, "pl" -- Polish, "fr" -- French,
#' and "de" for German.
#'
#' \code{Country} is a two-letter code following the ISO-3166 standard.
#' This is to reflect different language conventions within the same language,
#' for example in US-English ("en_US") and Australian-English ("en_AU").
#'
#' Differences may also appear in language conventions used within
#' the same country. For example, the Euro currency may be used in several European
#' countries while the individual country's currency is still in circulation.
#' In such case, ICU \code{Variant} "_EURO" could be used for selecting locales
#' that support the Euro currency.
#'
#' For a list of locales that are recognized by \pkg{ICU},
#' call \code{\link{stri_locale_list}}.
#'
#' @section A Note on Default Locales:
#'
#' Each locale-sensitive function in \pkg{stringi}
#' selects the current default locale if an empty string or \code{NULL} is given as
#' as its \code{locale} argument. Default locales are available to all the functions:
#' they are initially set to be the system locale on that platform,
#' and may be changed with \code{\link{stri_locale_set}},
#' for example if automatic  detection fails to recognize
#' your locale properly.
#'
#' Sometimes it is suggested that your program should avoid changing the default locale:
#' it is not a good way to request an international object, especially
#' only for a single function call..
#' All locale-sensitive functions may request
#' any desired locale per-call (by specifying the \code{locale} argument),
#' i.e. without referencing to the default locale.
#' During many tests, however, we did not observe any improper
#' behavior of \pkg{stringi} while using a modified default locale.
#'
#' @section Locale-Sensitive Functions in \pkg{stringi}:
#'
#' One of many examples of locale-dependent services
#' is the Collator, which performs
#' a locale-aware string comparison.
#' It is used for string comparing, ordering,
#' sorting, and searching.
#' See \code{\link{stri_opts_collator}} for the description
#' on how to tune its settings, and its \code{locale}
#' argument in particular.
#'
#' Other locale-sensitive functions
#' include e.g. \code{\link{stri_trans_tolower}} (that does character case mapping).
#'
#' @references
#' \emph{Locale} -- ICU User Guide, \url{http://userguide.icu-project.org/locale}
#'
#' \emph{ISO 639: Language Codes},
#' \url{http://www.iso.org/iso/home/standards/language_codes.htm}
#'
#' \emph{ISO 3166: Country Codes}, \url{http://www.iso.org/iso/country_codes}
#' @name stringi-locale
#' @rdname stringi-locale
#' @family locale_management
#' @family locale_sensitive
#' @family stringi_general_topics
invisible(NULL)
