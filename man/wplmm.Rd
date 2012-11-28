\name{wplmm}
\alias{wplmm}
\title{Weighted Partially Linear Mixed Effects Model
}
\description{Estimate the regression error variance function nonparametrically from a partially linear mixed effects model fitted using the model fitting function \code{plmm}, and refit the model applying the weighted least squares procedure. \code{wplmm} returns an object of the \sQuote{wplmm} class.
}
\usage{
wplmm(object, heteroX, data, nonpar.bws = "h.select", poly.index = 1, 
var.fun.bws = "ROT", var.fun.poly.index = 0, scale.h = 1, trim = 0.01, 
lim.binning = 100, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{a model fitted with \code{plmm}.}
  \item{heteroX}{at most two variables conditioning the heteroskedasticity of the regression error variance. If there are two variables, they can be passed either as a 2-element list or a 2-column matrix.}
  \item{data}{an optional data frame containing the variables in the model. If relevant variables are not found in data, they are taken from the environment from which \code{wplmm} was called.}
  \item{nonpar.bws}{the bandwidth selection method for the kernel regression of the nonparametric component. The default method \dQuote{h.select} (cross validation (CV) using binning technique), \dQuote{hcv} (ordinary CV), \dQuote{GCV} (generalized CV) and \dQuote{GCV.c} (generalized CV for correlated data) are available.}
  \item{poly.index}{the degrees of polynomial for the kernel regression of the nonparametric component: either 0 for local constant or 1 (default) for local linear.}
  \item{var.fun.bws}{the bandwidth selection method for kernel regression of the variance function. A rule-of-thumb type method \dQuote{ROT} (default), \dQuote{h.select} (cross validation using binning technique) and \dQuote{hcv} (ordinary cross validation) are available.}
  \item{var.fun.poly.index}{the degree of polynomial of the kernel regression to estimate the nonparametric variance function: either 0 (default) for local constant or 1 for local linear.}
  \item{scale.h}{a scalar or 2-dimensional vector to scale the bandwidths selected for kernel regression of the nonparametric component. The default is 1. When a scalar is given for a nonparametric component of two covariates, it scales the bandwidths in both directions by the same factor.}
  \item{trim}{if estimated variance function values are below the value of \code{trim}, they are set to this value. The default is 0.01.}
  \item{lim.binning}{the smallest sample size below which binning techniques are not used to calculate the degrees of freedom of the estimated nonparametric component. Then, the ordinary cross-validation is used instead. This option doesn't apply if \dQuote{GCV.c} is used for \code{nonpar.bws}.}
  \item{\dots}{optional arguments relevant to \code{h.select} or \code{hcv}, which include \code{nbins}, \code{hstart} and \code{hend}. See \code{\link{sm.options}} and \code{\link{hcv}}. }
}

\details{
There are three methods to select bandwidths for kernel regression of the nonparametric variance function: \dQuote{h.select} and \dQuote{hcv} call \code{h.select} and \code{hcv}, respectively, which are functions of the \pkg{sm} package; \dQuote{ROT} selects the bandwidths for heteroskedasticity conditioning variable \eqn{w} by \eqn{sd(w)N^{-1/(4+q)}} where \eqn{q} is the number of the conditioning variables (1 or 2) and \eqn{N} is the sample size.  
}

\value{
  \item{coefficients}{estimated regression coefficients.}
  \item{fitted.values}{conditional predictions of the response, defined as the sum of the estimated fixed components and the predicted random intercepts.}
  \item{residuals}{residuals of the fitted model, defined as the response values minus the conditional predictions of the response.}
  \item{var.comp}{variance component estimates.}
  \item{nonpar.values}{estimated function values of the nonparametric component at the data points.}
  \item{h.nonpar}{the bandwidths used to estimate the nonparametric component.}
  \item{var.fun.values}{estimated variance function values. Original computations less than the value of \code{trim} have been set to the value of \code{trim}.}
  \item{h.var.fun}{the bandwidths used to estimate the nonparametric variance function.}
  \item{rank}{the degrees of freedom of the parametric component, which doesn't include the intercept term.}
  \item{df.residual}{the residual degrees of freedom defined as \eqn{N-p-tr(2S-S^T)} where \eqn{N} is the sample size, \eqn{p} is the rank of the parametric component, and \eqn{S} is the smoother matrix for the nonparametric component. If \dQuote{GCV.c} is used for \code{nonpar.bws}, alternative definition \eqn{N-p-tr(2SR-SRS^T)} is applied with \eqn{R} being the estimated correlation matrix of the data.}
  \item{nbins}{the number of bins (which would have been) used for binning for CV and the calculation of the degrees of freedom.}
  \item{formula}{formula passed to \code{wplmm}.}
  \item{call}{the matched call to \code{wplmm}.}
  \item{h0.call}{the matched call to \code{select.h0} underlying the \code{plmm} that yielded the \code{object}.}
  \item{plmm.call}{the matched call to the \code{plmm} that yielded the \code{object}.}
  \item{xlevels}{if there are factors among the covariates in the parametric component, the levels of those factors.}
  \item{heteroX}{the names of the heteroskedasticity conditioning variables.}
}

\seealso{\code{\link{plmm}}, \code{\link{h.select}}, \code{\link{hcv}}, \code{\link{sm.options}}.
}
\examples{
data(plmm.data)
model <- plmm(y1~x1+x2+x3|t1, random=cluster, data=plmm.data)
model2 <- wplmm(model, heteroX=x3, data=plmm.data)
summary(model2)
}
\keyword{regression}
\keyword{nonparametric}
