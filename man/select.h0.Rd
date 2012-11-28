\name{select.h0}
\alias{select.h0}
\title{Bandwidths Selection for Model Reduction
}
\description{Select the bandwidths for kernel regression to reduce the partially linear mixed effects model to a mixed effects model. 
}

\usage{
select.h0(formula, data, nonpar.bws = "h.select", poly.index = 1, ...)
}

\arguments{
  \item{formula}{a symbolic description of the model to fit with the model fitting function \code{plmm}. \code{formula} consists of three parts: the response (the left hand side of \sQuote{~}), the fixed parametric component (between \sQuote{~} and \sQuote{|}), and the fixed nonparametric component (the right hand side of \sQuote{|}).}
  \item{data}{an optional data frame containing the variables in the \code{formula}. If relevant variables are not found in \code{data}, they are taken from the environment from which \code{select_h0} was called.}
  \item{nonpar.bws}{the cross validation method for bandwidth selection. The method is either the default \dQuote{h.select} (cross validation using binning technique) or \dQuote{hcv} (ordinary cross validation).}
  \item{poly.index}{the degree of polynomial of the kernel regression: either 0 for local constant or 1 (default) for local linear.}
  \item{\dots}{optional arguments relevant to \code{h.select} or \code{hcv}, which include \code{nbins}, \code{hstart} and \code{hend}. See \code{\link{sm.options}} and \code{\link{hcv}}.}
}

\details{\code{select.h0} yields a list object that can be used for the argument \code{h0} in the model fitting function \code{plmm}. Bandwidths are selected for kernel regression of the response and the covariates in the fixed parametric component. \dQuote{h.select} uses binning techniques for cross validation. The number of bins for binning is set to the default integer, the rounded value of \code{8*log(N)/d)}, where \code{N} is the sample size and \code{d} is the number of covariates in the nonparametric component. When the sample size is small (\code{N < 100}), binning techniques are not used and the bandwidths selected will coincide with those obtained with \dQuote{hcv}. 
}
\value{
  \item{h0}{a vector (if the nonparametric component is a function of one variable) or a matrix (if it is a function of two variables) of bandwidths selected.}
  \item{nbins}{the number of bins (which would be) used for binning.}
  \item{h0.call}{the matched call to \code{select.h0}.}
}

\seealso{\code{\link{plmm}}, \code{\link{h.select}}, \code{\link{hcv}}.
}
\examples{
data(plmm.data)
select.h0(y0~x1+x2+x3|t1, data=plmm.data)

# nonparametric component of two covariates, t1 and t2
\dontrun{
select.h0(y2~x1+x2+x3|t1+t2, data=plmm.data) }
}
