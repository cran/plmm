\name{residuals}
\alias{residuals.plmm}
\alias{residuals.wplmm}
\alias{resid.plmm}
\alias{resid.wplmm}
\title{Extract Model Residuals
}
\description{Extract residuals from a model fitted using a model fitting function \code{plmm} or \code{wplmm}. \code{resid} is an alias. 
}
\usage{
\method{residuals}{plmm}(object,...)
\method{residuals}{wplmm}(object,...)
\method{resid}{plmm}(object,...)
\method{resid}{wplmm}(object,...)
}
\arguments{
  \item{object}{a model fitted with \code{plmm} or \code{wplmm}.}
  \item{\dots}{other arguments.}
}

\details{The residual is defined as the value obtained by subtracting from the response value the estimated fixed components and the predicted random intercept of the cluster the observational unit of the response belongs to.   
}

\seealso{\code{\link{plmm}}, \code{\link{wplmm}}
}

\examples{
data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
residuals(model)
}

