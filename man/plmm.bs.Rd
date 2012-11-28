\name{plmm.bs}
\alias{plmm.bs}
\title{Bootstrap Inference
}
\description{The fixed regression coefficients and the random effects variance are repeatedly estimated using the wild bootstrap to estimate the sampling distribution of the estimators. 
}
\usage{
plmm.bs(object, B, data, h0, ...)
}
\arguments{
  \item{object}{a model estimated using a model fitting function \code{plmm} or \code{wplmm}.}
  \item{B}{the number of bootstrap replications.}
  \item{data}{an optional data frame containing the variables in the model. If relevant variables are not found in \code{data}, the variables are taken from the environment from which \code{plmm.bs} was called.
}
  \item{h0}{a set of bandwidths for nonparametric kernel regression to reduce the model. \code{h0} is optional; if omitted, \code{select.h0} is called automatically to compute bandwidths according to the \code{h0.call} value of the \code{object}. 
}
  \item{\dots}{other arguments.}
}

\details{\code{plmm.bs} computes bootstrap estimates of the fixed regression coefficients and the random effects variance using the wild bootstrap resampling technique. The user can modify bandwidths in a list object created by \code{select.h0} and pass the object to \code{plmm.bs}. In the wild bootstrap procedure, only the bandwidth for the kernel estimation of the response is recalculated while those for the fixed parametric component remain the same as given in \code{h0}. \code{plmm.bs} returns an object of \code{bs.plmm} class for which the \code{summary} method is available. 
}

\value{A list of a matrix of \code{B} rows. Its columns contain \code{B} bootstrap estimates of  the fixed regression coefficients and random effects variance.
}
\seealso{\code{\link{summary.bs.plmm}}, \code{\link{select.h0}}.
}
\examples{
data(plmm.data)
h0 <- select.h0(y1~x1+x2+x3|t1, data=plmm.data)
model <- plmm(y1~x1+x2+x3|t1, h0=h0, random=cluster, data=plmm.data)
model2 <- wplmm(model, heteroX=x3, data=plmm.data)

\dontrun{
bs <- plmm.bs(model, B=500, data=plmm.data, h0=h0)
bs2 <- plmm.bs(model2, B=500, data=plmm.data, h0=h0) }
}
