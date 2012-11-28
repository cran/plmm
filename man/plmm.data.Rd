\name{plmm.data}
\alias{plmm.data}
\docType{data}
\title{
Data Set for the Package Examples
}
\description{
\code{plmm.data} is a \code{data.frame} of simulated, hierarchically structured (2-level) data used in examples provided in the package documents.
}
\usage{data(plmm.data)}
\format{
  A data frame with 363 observations on the following 9 variables.
  \describe{
    \item{y0}{a numeric vector of the response simulated with one covariate for the nonparametric component under homoskedastic regression error assumption.}
    \item{y1}{a numeric vector of the response simulated with one covariate for the nonparametric component under heteroskedastic regression error assumption.}
    \item{y2}{a numeric vector the response simulated with two covariates for the nonparametric component under homoskedastic regression error assumption.}
    \item{x1}{a factor with levels \{\code{F}, \code{M}\}.}
    \item{x2}{a numeric vector of a covariate in the fixed parametric component.}
    \item{x3}{a numeric vector of a covariate in the fixed parametric component.}
    \item{t1}{a numeric vector of a covariate in the fixed nonparametric component.}
    \item{t2}{a numeric vector of a covariate in the fixed nonparametric component.}
    \item{cluster}{a clustering variable. There are 20 clusters. The cluster size is unbalanced; each cluster consists of from 5 to 30 observations.}
  }
}

\details{Data are generated from the following three models:
  \describe{
\item{}{\eqn{y0=\beta_0+\beta_1x1+\beta_2x2+\beta_3x3+\gamma_1(t1)+u+e_0}}
\item{}{\eqn{y1=\beta_0+\beta_1x1+\beta_2x2+\beta_3x3+\gamma_1(t1)+u+e_1}}
\item{}{\eqn{y2=\beta_0+\beta_1x1+\beta_2x2+\beta_3x3+\gamma_2(t1,t2)+u+e_1}}
\item{}{where}
\item{}{\eqn{(\beta_0, \beta_1, \beta_2, \beta_3)=(1, 1, 0.5, -1)}}
\item{}{\eqn{\gamma_1(t1)=2sin(t1)}}
\item{}{\eqn{\gamma_2(t1, t2)=2sin(t1)+0.3t2+0.75t2^2}}
\item{}{\eqn{u \sim N(0,3)}}
\item{}{\eqn{e_0 \sim N(0,1)}}
\item{}{\eqn{e_1=x3*e_0}}
\item{}{u is the cluster-specific random intercept. x2 and t1 are correlated with correlation coefficient about 0.67.} 
	}
}
\examples{
data(plmm.data)
str(plmm.data)
}
\keyword{datasets}
