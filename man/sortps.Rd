\name{sortps}
\alias{sortps}
\title{Sorting Propensity Scores}
\description{
An internal function called by BPSM to sort propensity scores and match units with close propensity scores in the same treatment condition.
}
\usage{sortps(D, N, N1, p2, L, Data)}
\arguments{
  \item{D}{ Number of covariates including the intercept.}
  \item{N}{ Number of units.}
  \item{N1}{ Number of treated units.}
  \item{p2}{ Estimated propensity scores.}
  \item{L}{ Number of within-group matches requested for the AI method.}
  \item{Data}{ A matrix containing Y, t, and X.}
}
\details{The function generates the above arguments from the inputed data and returns IDs of the matched units with close propensity scores in the same treatment condition.}
\author{
Weihua An, Huizi Xu, and Zhida Zheng, Indiana University Bloomington.
}

\seealso{
\code{\link{bpsm}, \link{bpsr}, \link{modelpsm}, \link{modelpsr}, \link{Match}}
}
