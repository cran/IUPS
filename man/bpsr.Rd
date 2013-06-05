\name{bpsr}
\alias{bpsr}
\title{Bayesian Propensity Score Regression}
\description{
A function uses Bayesian methods to incorporate uncertainties in estimated propensity scores and provide adjusted standard errors for propensity score regressions.
}
\usage{bpsr(Y, t, X, K = 10000, S = 1000)}
\arguments{
  \item{Y}{ A vector containing the outcome variable.}
  \item{t}{ A vector containing the treatment indicator.}
  \item{X}{ A matrix containing the covariates.}
  \item{K}{ Numbers of iterations.}
  \item{S}{ Number of posterior samples.}  
}
\details{
Estimated propensity scores are used as an additional covariate in the main outcome model to control for selection or to provide better control for the nonlinear effects of covariates. The function \code{\link{bpsr}} takes into account the uncertainties in estimating the propensity scores and adjusts the standard errors accordingly.
}
\value{
\item{estimates}{ The estimated treatment effects and their adjusted standard errors. Phat shows the results with unadjusted standard errors. BPSR shows the results with adjusted standard errors using the Bayesian method.}
\item{time}{ The time elapsed for the computation.}
\item{sims}{ The number of iterations requested for the Bayesian computation, K}
\item{posterior}{ The posterior sample distribution of the treatment effects. The function \code{\link{bpsr}} uses the posterior standard deviation to approximate the standard error.}
}
\references{
  An, Weihua. 2010. "Bayesian Propensity Score Estimators: Incorporating Uncertainties In 
  Propensity Scores Into Causal Inference." \emph{Sociological Methodology} 40: 151-189. \url{http://mypage.iu.edu/~weihuaan/Documents/2010_BPSE.pdf}.
  }

\author{
Weihua An, Huizi Xu, and Zhida Zheng, Indiana University Bloomington.
}
\note{
To use \code{\link{bpsr}}, first install JAGS to the local computer. JAGS is available at \url{http://mcmc-jags.sourceforge.net/}.}
\seealso{
\code{\link{bpsm}, \link{modelpsm}, \link{modelpsr}, \link{Match}, \link{sortps}}
}
\examples{
\dontrun{
library(boot)

a = 2; b = c(1, -2, 5); N = 500
x1 <- runif(N, 0, 1)
x2 <- runif(N, 0, 1)
X <- cbind(rep(1, N), x1, x2)
p <- inv.logit( X \%*\% b )
t <- rbinom(N, 1, p)
e <- rnorm(N, 0, 1)
Y <- 5 * t + a * ( x1 + x2 ) + e
bpsr(Y, t, X )
}
}