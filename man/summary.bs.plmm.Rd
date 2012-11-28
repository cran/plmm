\name{summary.bs.plmm}
\alias{summary.bs.plmm}
\title{Summary of the bootstrap estimates of the sampling distribution.
}
\description{Provide summary statistics of the estimated sampling distributions of the fixed regression coefficient estimators and the random effects variance estimator. 
}
\usage{
\method{summary}{bs.plmm}(object, probs = c(0.005, 0.025, 0.05, 0.95, 0.975, 0.995), ...)
}
\arguments{
  \item{object}{an object returned from \code{plmm.bs}}.
  \item{probs}{a vector of quantiles.}
  \item{\dots}{other arguments.}
}

\details{For an object of the \code{bs.plmm} class, \code{summary} provides the mean, the standard deviation and quantiles of the estimated marginal sampling distributions of the coefficient estimators and the random effects variance estimator.
}

\value{ 
  \item{mean}{a vector of the means.}
  \item{sd}{a vector of the standard deviations.}
  \item{quantiles}{vectors of the quantiles specified for \code{probs}.}
}

\examples{
data(plmm.data)
h0 <- select.h0(y0~x1+x2+x3|t1, data=plmm.data)
model <- plmm(y0~x1+x2+x3|t1, h0=h0, random=cluster, data=plmm.data)
\dontrun{
bs <- plmm.bs(model, B=500, data=plmm.data, h0=h0)
summary(bs, probs=c(0.025, 0.975)) }
}
