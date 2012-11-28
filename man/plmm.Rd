\name{plmm}
\alias{plmm}
\title{Partially Linear Mixed Effects Model
}
\description{Fit a partially linear mixed effects model under homoskedastic regression error assumption. \code{plmm} returns an object of the \sQuote{plmm} class.
}
\usage{
plmm(formula, random, h0, data, vc.method = "FC", nonpar.bws = "h.select", 
poly.index = 1, iter = 20, scale.h = 1, epsilon = 0.003, lim.binning = 100, 
hetero.prop = NULL, ...)
}
\arguments{
  \item{formula}{a symbolic description of the model to be fitted under homoskedastic regression error assumption. \code{formula} consists of three parts: the response (the left hand side of \sQuote{~}), the fixed parametric component (between \sQuote{~} and \sQuote{|}), and the fixed nonparametric component (the right hand side of \sQuote{|}).
}
  \item{random}{the name of the clustering factor variable. The levels of the factor can be either numeric or character.  
}
  \item{h0}{a set of bandwidths for nonparametric kernel regression to reduce the model. \code{h0} can be obtained using \code{select.h0}. \code{h0} is optional; if omitted, \code{select.h0} is called automatically to compute a set of bandwidths. The user can modify bandwidths in a list object created by \code{select.h0} and pass the object to \code{plmm}.   
}
  \item{data}{an optional data frame containing the variables in the model. If relevant variables are not found in \code{data}, the variables are taken from the environment \code{plmm} was called from.
}
  \item{vc.method}{the method for variance components estimation: either the default \dQuote{FC} (fitting of constant) or \dQuote{SA} (Swamy-Arora). If heteroskedasticity proportionalities are known, \dQuote{FChetero} (heteroskedastic fitting of constant) and \dQuote{SAhetero} (heteroskedastic Swamy-Arora) can be used with \code{hetero.prop} specified.
}
  \item{nonpar.bws}{the bandwidth selection method for the kernel regression of the nonparametric component. \dQuote{h.select} (default), \dQuote{hcv}, \dQuote{GCV} and \dQuote{GCV.c} are available. 
}
  \item{poly.index}{the degree of polynomial for the kernel regression of the nonparametric component: either 0 for local constant or 1 (default) for local linear. 
}
  \item{iter}{the maximum number of iterations to be performed. The default is 20. 
}
  \item{scale.h}{a scalar or 2-dimensional vector to scale the bandwidths selected for kernel regression of the nonparametric component. The default is 1. When a scalar is given for a nonparametric component of two covariates, it scales the bandwidths in both directions by the same factor.
}
  \item{epsilon}{The criterion to determine the convergence of model fitting. The default value is 0.003. 
}
  \item{lim.binning}{the smallest sample size below which binning techniques are not used to calculate the degrees of freedom of the estimated nonparametric component (the ordinary cross-validation is used instead). This option doesn't apply if \dQuote{GCV.c} is used for \code{nonpar.bws}.
}
  \item{hetero.prop}{a vector of heteroskedasticity proportionalities. The length of the vector should be the same as either the sample size (within-cluster heteroskedasticity) or the number of the clusters (between-cluster heteroskedasticity). 
}
  \item{\dots}{optional arguments relevant to \code{h.select} or \code{hcv}, which include \code{nbins}, \code{hstart} and \code{hend}. See \code{\link{sm.options}} and \code{\link{hcv}}.
}
}

\details{
The number of covariates of the nonparametric component is at most two. Kernel regression is estimated using \code{sm.regression}. There are four methods for bandwidth selection: \dQuote{h.select} calls \code{h.select} to execute cross validation (CV) using binning techniques; \dQuote{hcv} calls \code{hcv} which implements the ordinary CV; \dQuote{GCV} uses the generalized CV; and \dQuote{GCV.c} performs generalized CV for correlated data. \code{sm.regression}, \code{h.select} and \code{hcv} are functions of the \pkg{sm} package.
When the nonparametric component is a function of two variables, optimization procedure selects one bandwidth that, multiplied by the standard deviations of those variables, minimizes the cross validation statistic. The user can further scale the bandwidths using \code{scale.h}. 
\code{epsilon} is the value to determine the convergence of iterative estimation. For the \eqn{r}th iteration round, the absolute value of \eqn{(\sigma^{2}_{(r)}-\sigma^{2}_{(r-1)})/\sigma^{2}_{(r-1)}} is calculated for each variance component. The iteration procedure ends when this absolute value of both variance components becomes smaller than \code{epsilon}. 
}

\value{
  \item{coefficients}{estimated regression coefficients.}
  \item{fitted.values}{conditional predictions of the response, defined as the sum of the estimated fixed components and the predicted random intercepts.}
  \item{residuals}{residuals of the fitted model, defined as the response values minus the conditional predictions of the response.}
  \item{var.comp}{variance component estimates.}
  \item{nonpar.values}{estimated function values of the nonparametric component at the data points.}
  \item{h.nonpar}{the bandwidths used to estimate the nonparametric component in the final iteration.}
  \item{rank}{the degrees of freedom of the parametric component, which doesn't include the intercept term.}
  \item{df.residual}{the residual degrees of freedom defined as \eqn{N-p-tr(2S-S^T)} where \eqn{N} is the sample size, \eqn{p} is the rank of the parametric component, and \eqn{S} is the smoother matrix for the nonparametric component. If \dQuote{GCV.c} is used for \code{nonpar.bws}, an alternative definition \eqn{N-p-tr(2SR-SRS^T)} is applied with \eqn{R} being the estimated correlation matrix of the data.} 
  \item{nbins}{the number of bins (which would have been) used for binning for cross validation and the calculation of the degrees of freedom.}
  \item{iter}{the number of iterations performed.}
  \item{coef.iter}{regression coefficient estimates computed in the iteration process.}
  \item{vc.iter}{variance component estimates computed in the iteration process.}
  \item{formula}{formula passed to \code{plmm}.}
  \item{call}{the matched call to \code{plmm}.}
  \item{h0.call}{the matched call to \code{select.h0}.}
  \item{xlevels}{if there are factors among the covariates in the parametric component, the levels of those factors.}
}

\seealso{ \code{\link{select.h0}}, \code{\link{h.select}}, \code{\link{hcv}}, \code{\link{sm.options}}. }

\examples{
data(plmm.data)
plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)

# heteroskedasticity proportionality x3
plmm(y1~x1+x2+x3|t1, random=cluster, data=plmm.data, vc.method="FChetero", hetero.prop=x3)

# nonparametric component of two covariates, t1 and t2
\dontrun{
plmm(y2~x1+x2+x3|t1+t2, random=cluster, data=plmm.data) }
}
\keyword{regression}
\keyword{nonparametric}
