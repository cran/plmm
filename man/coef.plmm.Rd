\name{coef}
\alias{coef.plmm}
\alias{coef.wplmm}
\alias{coefficients.plmm}
\alias{coefficients.wplmm}
\title{Extract Fixed Regression Coefficients
}
\description{Extract the fixed regression coefficient estimates of a model fitted using a model fitting function \code{plmm} or \code{wplmm}. \code{coefficients} is an alias.
}

\usage{
\method{coef}{plmm}(object,...)
\method{coef}{wplmm}(object,...)
\method{coefficients}{plmm}(object,...)
\method{coefficients}{wplmm}(object,...)
}

\arguments{
  \item{object}{a model fitted with \code{plmm} or \code{wplmm}.}
  \item{\dots}{other arguments.}
}

\details{When the \code{object} is of the \sQuote{plmm} class, the estimates from the final iteration are returned unless the model was fitted without iteration. The returned value \code{coef.iter} of a \sQuote{plmm} class object contains all the estimates computed in the iterations.  
}

\value{
Fixed regression coefficients estimates.
}

\seealso{\code{\link{plmm}}, \code{\link{wplmm}}
}

\examples{
data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
coef(model)
model$coef.iter
}
