% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/three_dots.R
\name{three_dots}
\alias{three_dots}
\title{Read the "..." arguments inside a function.}
\usage{
three_dots(...)
}
\arguments{
\item{...}{It should have the value \code{list(...)}}
}
\value{
Nothing, it only exports the values to the environment.
}
\description{
Use this function only at the beginning of the function.

\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}
}
\details{
Three dots

Auxiliary function for the automated definition of the common omitted parameters.
}
\section{Warning}{

The exportation of the values to the environment is done throgh the definition of \strong{global variables}.
}

\examples{
\dontrun{
f = function(...) {
  arguments = list(...)
  ArchiData::three_dots(arguments)
}
}

}
