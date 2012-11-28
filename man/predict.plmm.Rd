\name{predict}
\alias{predict.plmm}
\alias{predict.wplmm}
\title{Conditional or Unconditional Model Prediction
}
\description{Predict the response values for a set of covariates based on a model fitted using a model fitting function \code{plmm} or \code{wplmm}. 
}

\usage{
\method{predict}{plmm}(object, newdata, data, cond = TRUE, ...)
\method{predict}{wplmm}(object, newdata, data, cond = TRUE, ...)
}

\arguments{
  \item{object}{a model fitted with \code{plmm} or \code{wplmm}.}
  \item{newdata}{a data frame containing sets of values of the covariates. The clustering variable may be omitted, in which case only unconditional prediction is possible. If \code{newdata} is omitted, the response of the original data set is predicted conditionally or unconditionally according to \code{cond}.}
  \item{data}{an optional data frame containing the variables used to fit the model. If relevant variables are not found in \code{data}, the variables are taken from the environment from which \code{predict} was called.
}  
  \item{cond}{logical. If \code{TRUE}, the response is predicted conditional on the random effect prediction for the cluster the observational unit belongs to. If \code{FALSE}, an unconditional prediction of the response, i.e. the sum of only the fixed components is computed.}
  \item{\dots}{other arguments.}
}

\value{
  Predicted conditional or unconditional response values.
}

\examples{
data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
pred_data <- data.frame(x1=c("F","M"), x2=c(15,25), x3=c(3,2), t1=c(5, 4), cluster=c(1,5))
predict(model, newdata=pred_data, data=plmm.data)
predict(model, newdata=pred_data, data=plmm.data, cond=FALSE)
}
