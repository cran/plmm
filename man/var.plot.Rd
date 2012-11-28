\name{var.plot}
\alias{var.plot}
\title{Nonparametric Variance Function Estimation and Plotting
}
\description{Plot the estimated nonparametric variance function and provide the estimated function values. 
}
\usage{
var.plot(object, heteroX, data, var.fun.bws = "ROT", var.fun.poly.index = 0, ...)
}
\arguments{
  \item{object}{a model fitted using the model fitting function \code{plmm}.}
  \item{heteroX}{at most two variables conditioning the heteroskedasticity of the regression error variance. If there are two variables, they can be passed either as a 2-element list or a 2-column matrix.}
  \item{data}{an optional data frame containing the variables in the model. If relevant variables are not found in \code{data}, the variables are taken from the environment from which \code{var.plot} was called.}
  \item{var.fun.bws}{the bandwidth selection method for the kernel regression estimation of the variance function. A rule-of-thumb type method \dQuote{ROT} (default), \dQuote{h.select} (cross validation using binning technique) or \dQuote{hcv} (ordinary cross validation are available.}
  \item{var.fun.poly.index}{the degree of polynomial of the kernel regression to estimate the nonparametric variance function: either 1 for local linear or 0 (default) for local constant.}
  \item{\dots}{optional arguments relevant to estimation and plotting with \code{sm.regression}.}
}
\details{
The variance function plotted is an unconditional estimate, i.e. the sum of the estimated variances of the random effects and the regression error. As opposed to \code{wplmm}, \code{var.plot} does not trim negative estimates of the variance function values. \code{var.fun.values} returned from \code{var.plot} are also untrimmed estimates.  
\dQuote{ROT} selects the bandwidths for heteroskedasticity conditioning variable \eqn{w} by \eqn{sd(w)N^{-1/(4+q)}} where \eqn{q} is th the number of the conditioning variables (1 or 2) and \eqn{N} is the sample size. Some of the relevant optional arguments include \code{display}, \code{nbins} and \code{ngrid}. See \code{\link{sm.options}. }
}

\value{
The following values are returned invisibly (they are not printed, but can be assigned). 
  \item{var.fun.values}{the estimated untrimmed conditional variance function values at the data points.}
  \item{var.comp}{the estimated variance of the random effects.}
  \item{h.var.fun}{the bandwidths used to estimate the nonparametric variance function.}
}

\seealso{\code{\link{wplmm}}, \code{\link{sm.regression}}, \code{\link{sm.options}}
}

\examples{
data(plmm.data)
model <- plmm(y1~x1+x2+x3|t1, random=cluster, data=plmm.data)
var.plot(model, heteroX=x3, data=plmm.data)
result <- var.plot(model, heteroX=x3, data=plmm.data, display="none")
result$var.fun.values
}
