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
#' Passing Arguments to Functions in \pkg{stringi}
#'
#' @description
#' Below we explain how \pkg{stringi} deals (in almost all cases)
#' with its functions' arguments.
#'
#' @section Coercion of Arguments:
#'
#' When a character vector argument is expected, factors and other vectors
#' coercible to characters vectors
#' are silently converted with \code{\link{as.character}},
#' otherwise an error is generated.
#'
#' When a logical, numeric or integer vector argument is expected,
#' factors are converted with \code{as.*(\link{as.character}(...))},
#' and other coercible vectors
#' are converted with \code{as.*},
#' otherwise an error is generated.
#'
#'
#'
#' See the links below for the description of internal methods used
#' in all functions from the \pkg{stringi} package (just to get more insight,
#' in case you are interested in technical details).
#' Anyway, we hope that everything works as you intuitively expect.
#'
#' @section Vectorization:
#'
#' Almost all functions are vectorized with respect to all their arguments;
#' This may sometimes lead to strange results - we assume you know what
#' you are doing. However, thanks to this property you may
#' e.g. search for one pattern in each given string,
#' or search for each pattern in one given string.
#'
#' We of course took great care of performance issues: e.g. in regular expression
#' searching, regex matchers are reused
#' from iteration to iteration, as long it is possible.
#'
#' Functions with some non-vectorized arguments are rare:
#' e.g. regular expression matcher's settings are established
#' once per each call.
#'
#' Some functions
#' assume that a vector with one element is given
#' as an argument (like \code{collapse} in \code{\link{stri_join}}).
#' In such cases, if an empty vector is given you will get an error
#' and for vectors with more than 1 elements - a warning will be
#' generator (only the first element will be used).
#'
#' You may find details on vectorization behavior in the man pages
#' on each particular function of your interest.
#'
#' @section Handling Missing Values (\code{NA}s):
#'
#' \pkg{stringi} handles missing values consistently.
#' For any vectorized operation, if at least one vector element is missing,
#' then the corresponding resulting value is also set to \code{NA}.
#'
#' @section Preserving Input Objects' Attributes:
#'
#' Generally, all our functions drop input objects' attributes
#' (e.g. \code{\link{names}}, \code{\link{dim}}, etc.).
#' This is generally because
#' of advanced vectorization and for efficiency reasons.
#' Currently, there is only one exception to this rule:
#' the \code{\link{stri_sort}} function.
#' Thus, if this is needed, please remember to copy important attributes manually
#' or use e.g. the subsetting operation like \code{x[] <- stri_...(x, ...)}.
#'
#' @name stringi-arguments
#' @family stringi_general_topics
#' @family prepare_arg
invisible(NULL)


#' @title
#' Prepare a String Vector Argument [internal]
#'
#' @description
#' This is an internal function. However, the interested user may play with it
#' in order to get more insight on how \pkg{stringi} deals with its
#' functions' arguments. See `Value' section for details.
#'
#' @param x argument to be checked
#'
#' @return
#' If \code{x} is a string, it is returned with no change.
#' If it is a factor, then \code{\link{as.character}} is called.
#' If an atomic vector or a matrix is given, it is coerced to a character vector.
#' If it is a \code{name} object, a character vector of length 1 is generated.
#' Otherwise the function throws an error.
#'
#' @family prepare_arg
stri_prepare_arg_string <- function(x) {
   .Call("stri_prepare_arg_string", x, NULL, PACKAGE="stringi")
}


#' @title
#' Prepare a Numeric Vector Argument [internal]
#'
#' @description
#' This is an internal function. However, the interested user may play with it
#' in order to get more insight on how \pkg{stringi} deals with its
#' functions' arguments. See `Value' section for details.
#'
#' @param x argument to be checked
#'
#' @return
#' If \code{x} is a factor, \code{\link{as.character}} is called, and the
#' resulting character vector is coerced to numeric.
#' If it is a numeric vector, then it is returned with no change.
#' If atomic vector or a matrix is given, it is coerced to a numeric vector.
#' Otherwise the function throws an error.
#'
#' @family prepare_arg
stri_prepare_arg_double <- function(x) {
   .Call("stri_prepare_arg_double", x, NULL, PACKAGE="stringi")
}


#' @title
#' Prepare an Integer Vector Argument [internal]
#'
#' @description
#' This is an internal function. However, the interested user may play with it
#' in order to get more insight on how \pkg{stringi} deals with its
#' functions' arguments. See `Value' section for details.
#'
#' @param x argument to be checked
#'
#' @return
#' If \code{x} is a factor, \code{\link{as.character}} is called, and the
#' resulting character vector is coerced to integer.
#' If it is an integer vector, then it is returned with no change.
#' If an atomic vector or a matrix is given, it is coerced to an integer vector.
#' Otherwise the function throws an error.
#'
#' @family prepare_arg
stri_prepare_arg_integer <- function(x) {
   .Call("stri_prepare_arg_integer", x, NULL, PACKAGE="stringi")
}



#' @title
#' Prepare a Logical Vector Argument [internal]
#'
#' @description
#' This is an internal function. However, the interested user may play with it
#' in order to get more insight on how \pkg{stringi} deals with its
#' functions' arguments. See `Value' section for details.
#'
#' @param x argument to be checked
#'
#' @return
#' If \code{x} is a logical vector, it is returned with no change.
#' If \code{x} is a factor, \code{\link{as.character}} is called, and the
#' resulting character vector is coerced to logical.
#' If atomic vector or a matrix is given, it is coerced to a logical vector.
#' Otherwise the function throws an error.
#'
#' @family prepare_arg
stri_prepare_arg_logical <- function(x) {
   .Call("stri_prepare_arg_logical", x, NULL, PACKAGE="stringi")
}


#' @title
#' Prepare a Raw Vector Argument [internal]
#'
#' @description
#' This is an internal function. However, the interested user may play with it
#' in order to get more insight on how \pkg{stringi} deals with its
#' functions' arguments. See `Value' section for details.
#'
#' @param x argument to be checked
#'
#' @return
#' If \code{x} is a raw vector, it is returned with no change.
#' If \code{x} is a factor, \code{\link{as.character}} is called, and the
#' resulting character vector is coerced to raw.
#' If atomic vector or a matrix is given, it is coerced to a raw vector.
#' Otherwise the function throws an error.
#'
#' @family prepare_arg
stri_prepare_arg_raw <- function(x) {
   .Call("stri_prepare_arg_raw", x, NULL, PACKAGE="stringi")
}



#' @title
#' Prepare a String Vector Argument [Single Value]  [internal]
#'
#' @description
#' This is an internal function. However, the interested user may play with it
#' in order to get more insight on how \pkg{stringi} deals with its
#' functions' arguments. See `Value' section for details.
#'
#' @param x argument to be checked
#' @return
#' In the first place, \code{\link{stri_prepare_arg_string}} is called.
#' On an empty vector, an error is generated.
#' If there are more than 1 elements, a warning is generated.
#' A vector with one element (the first in \code{x}) is returned.
#'
#' @family prepare_arg
stri_prepare_arg_string_1 <- function(x) {
   .Call("stri_prepare_arg_string_1", x, NULL, PACKAGE="stringi")
}


#' @title
#' Prepare a Numeric Vector Argument [Single Value]  [internal]
#'
#' @description
#' This is an internal function. However, the interested user may play with it
#' in order to get more insight on how \pkg{stringi} deals with its
#' functions' arguments. See `Value' section for details.
#'
#' @param x argument to be checked
#' @return
#' In the first place, \code{\link{stri_prepare_arg_double}} is called.
#' On an empty vector, an error is generated.
#' If there are more than 1 elements, a warning is generated.
#' A vector with one element (the first in \code{x}) is returned.
#'
#' @family prepare_arg
stri_prepare_arg_double_1 <- function(x) {
   .Call("stri_prepare_arg_double_1", x, NULL, PACKAGE="stringi")
}


#' @title
#' Prepare an Integer Vector Argument [Single Value]  [internal]
#'
#' @description
#' This is an internal function. However, the interested user may play with it
#' in order to get more insight on how \pkg{stringi} deals with its
#' functions' arguments. See `Value' section for details.
#'
#' @param x argument to be checked
#' @return
#' In the first place, \code{\link{stri_prepare_arg_integer}} is called.
#' On ab empty vector, an error is generated.
#' If there are more than 1 elements, a warning is generated.
#' A vector with one element (the first in \code{x}) is returned.
#'
#' @family prepare_arg
stri_prepare_arg_integer_1 <- function(x) {
   .Call("stri_prepare_arg_integer_1", x, NULL, PACKAGE="stringi")
}



#' @title
#' Prepare a Logical Vector Argument [Single Value]  [internal]
#'
#' @description
#' This is an internal function. However, the interested user may play with it
#' in order to get more insight on how \pkg{stringi} deals with its
#' functions' arguments. See `Value' section for details.
#'
#' @param x argument to be checked
#' @return
#' In the first place, \code{\link{stri_prepare_arg_logical}} is called.
#' On an empty vector, an error is generated.
#' If there are more than 1 elements, a warning is generated.
#' A vector with one element (the first in \code{x}) is returned.
#'
#' @family prepare_arg
stri_prepare_arg_logical_1 <- function(x) {
   .Call("stri_prepare_arg_logical_1", x, NULL, PACKAGE="stringi")
}
