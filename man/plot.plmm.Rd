\name{plot}
\alias{plot.plmm}
\alias{plot.wplmm}
\title{Nonparametric Function Plot
}
\description{Create a two or three dimensional plot of the estimated nonparametric function.
}
\usage{
\method{plot}{plmm}(x, data, ...)
\method{plot}{wplmm}(x, data, ...)
}
\arguments{
  \item{x}{a model fitted using a model fitting function \code{plmm} or \code{wplmm}.}
  \item{data}{an optional data frame containing the variables in the model. If relevant variables are not found in data, the variables are taken from the environment \code{plmm} was called from.}
  \item{\dots}{optional arguments relevant to creating a plot using \code{sm.regression}.}
}

\details{Along the vertical axis is the value obtained by subtracting the estimated fixed parametric component from the response. A two or three dimensional plot is created using \code{sm.regression}. Some of the relevant optional arguments include \code{display}, \code{nbins} and \code{ngrid}. See \code{\link{sm.options}}.
}

\seealso{\code{\link{sm.regression}}, \code{\link{sm.options}} 

}
\examples{
data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
plot(model, data=plmm.data, ann="F")
title(ylab=expression(paste("y-X",hat(beta))))

\dontrun{
model <- plmm(y2~x1+x2+x3|t1+t2, random=cluster, data=plmm.data)
plot(model, data=plmm.data, display="rgl") }
}
