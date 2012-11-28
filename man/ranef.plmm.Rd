\name{ranef}
\alias{ranef.plmm}
\alias{ranef.wplmm}
\title{
Random Effects Prediction
}
\description{Predict the random effects (intercepts) of a model fitted using a model fitting function \code{plmm} or \code{wplmm}.
}
\usage{
\method{ranef}{plmm}(object, data, ...)
\method{ranef}{wplmm}(object, data, ...)
}
\arguments{
  \item{object}{a model fitted with \code{plmm} or \code{wplmm}.}
  \item{data}{an optional data frame containing the variables in the model. If relevant variables are not found in data, the variables are taken from the environment \code{plmm} was called from.}
  \item{\dots}{other arguments.}
}

\details{The predictor is linear in the response. A random effect is predicted for each element of the clustering variable specified for \code{random} in the function call to \code{plmm}. 
}
\value{
A named vector of predicted random effects.
}
\examples{
data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
ranef(model, data=plmm.data)
}
