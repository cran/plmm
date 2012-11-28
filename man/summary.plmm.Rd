\name{summary}
\alias{summary.plmm}
\alias{summary.wplmm}
\title{Summary of a Fitted Partially Linear Mixed Effects Model.
}
\description{Summarize a partially linear mixed effects model fitted using a model fitting function \code{plmm} or \code{wplmm}. 
}
\usage{
\method{summary}{plmm}(object,...)
\method{summary}{wplmm}(object,...)
}
\arguments{
  \item{object}{a model fitted with \code{plmm} or \code{wplmm}.}
  \item{\dots}{other arguments.}
}

\value{
  \item{coefficients}{estimated regression coefficients.}
  \item{var.comp}{estimated variance components.}
  \item{h.nonpar}{the bandwidths used to estimate the nonparametric component in the final iteration.}
  \item{var.fun.h}{(only if \code{object} is of the \sQuote{wplmm} class) the bandwidths used to estimate the variance function.}
  \item{iter}{(only if object is of the \sQuote{plmm} class) the number of iterations.}
  \item{formula}{formula passed to \code{plmm}.}
  \item{call}{the matched call to \code{plmm} or \code{wplmm} that returned the \code{object}.}
  \item{plmm.call}{(only if \code{object} is of the \sQuote{wplmm} class) the matched call to \code{plmm} that returned the \code{object}.
}
  \item{heteroX}{(only if \code{object} is of the \sQuote{wplmm} class) the names of the heteroskedasticity conditioning variables.}
}

\seealso{\code{\link{plmm}}, \code{\link{wplmm}}
}
\examples{
data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
summary(model)
}
