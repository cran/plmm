\name{fitted}
\alias{fitted.plmm}
\alias{fitted.wplmm}
\alias{fitted.values.plmm}
\alias{fitted.values.wplmm}
\title{Extract Model Fitted Values
}
\description{Extract the predicted response values of a model fitted using a model fitting function \code{plmm} or \code{wplmm}. \code{fitted.values} is an alias.

}
\usage{
\method{fitted}{plmm}(object,...)
\method{fitted}{wplmm}(object,...)
\method{fitted.values}{plmm}(object,...)
\method{fitted.values}{wplmm}(object,...)
}
\arguments{
  \item{object}{a model fitted with \code{plmm} or \code{wplmm}.}
  \item{\dots}{other arguments.}
}

\details{The fitted value is defined as the conditional prediction, i.e. the sum of the estimated fixed components (parametric and nonparametric) and the predicted random intercept. Unconditional predictions (not conditioned on the cluster which the predicted response belongs to) can be obtained using \code{predict}. 
}

\value{
The predicted conditional response values.
}

\seealso{\code{\link{plmm}}, \code{\link{wplmm}}, \code{\link{predict}}
}
\examples{
data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
fitted(model)
}
