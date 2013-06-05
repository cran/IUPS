\name{bpsm}
\alias{bpsm}
\title{Bayesian Propensity Score Matching}
\description{
A function includes both Bayesian and non-Bayesian methods to incorporate uncertainties in estimated propensity scores and to provide adjusted standard errors for propensity score matching estimators.}
\usage{
bpsm(Y, t, X, estimand = "ATE", method = "AI", M = 1, L = 1, K = 10000, S = 1000)
}
\arguments{
  \item{Y}{A vector containing the outcome variable.}
  \item{t}{A vector containing the treatment indicator.}
  \item{X}{A matrix containing the covariates.}
  \item{estimand}{A character string for the estimand. The default is "ATE", average treatment effects. The other option is "ATT", average treatment effects on the treated.}
  \item{method}{A character string for the method to adjust standard errors. The default is "AI", which uses the methods proposed by Abadie and Imbens (2011). "BPSM" invokes the Bayesian methods developed by An (2010). "Both" use both methods.}
  \item{M}{Number of matches requested.}
  \item{L}{Number of within-group matches requested for the AI method.}
  \item{K}{Numbers of iterations. Only needed for BPSM.}
  \item{S}{Number of posterior samples. Only needed for BPSM.}
}
\details{Estimated propensity scores are used to match treated units with untreated units. The function includes two methods to take into account the uncertainties in the estimated propensity scores and to provide adjusted standard errors. The AI method is computationally more efficient but may produce negative standard errors in some cases. In contrast, the BPSM method always provides positive standard errors but requires longer computational time to converge, especially when the sample size is large.}
\value{
\item{estimates}{ The estimated treatment effects and their adjusted standard errors. Phat shows the results with unadjusted standard errors. AI shows the results with adjusted standard errors based on the AI method. BP* shows the results with adjusted standard errors based on the Bayesian method.}
\item{estimand}{ A character string indicting the estimand requested.}
\item{time}{ The time elapsed for the computation.}
\item{sims}{ The number of iterations requested for the Bayesian computation, K}
\item{posterior}{ The posterior sample distribution of the treatment effects. BPSM uses the posterior standard deviation to approximate the standard error.}
}
\references{
 An, Weihua. 2010. "Bayesian Propensity Score Estimators: Incorporating Uncertainties In 
  Propensity Scores Into Causal Inference." \emph{Sociological Methodology} 40: 151-189. \url{http://mypage.iu.edu/~weihuaan/Documents/2010_BPSE.pdf}.
  
Abadie, Alberto and Guido W. Imbens. 2011. ``Matching On the Estimated Propensity Score." \emph{Working Paper}. \url{http://mypage.iu.edu/~weihuaan/Documents/pscore_2011.pdf}. 
}

\author{
Weihua An, Huizi Xu, and Zhida Zheng, Indiana University Bloomington.
}
\note{
The latest verison of the Abadie and Imbens paper may be found at \url{http://www.hks.harvard.edu/fs/aabadie/pscore.pdf}. To use BPSM, first install JAGS to the local computer. JAGS is available at \url{http://mcmc-jags.sourceforge.net/}. Some parts of the code is still preliminary. So use at your own risk.
}
\seealso{
\code{\link{bpsr}, \link{modelpsm}, \link{modelpsr}, \link{Match}, \link{sortps}}
}
\examples{
library(boot)

a = 2; b = c(1, -2, 5); N = 500
x1 <- runif(N, 0, 1)
x2 <- runif(N, 0, 1)
X <- as.matrix(cbind(rep(1, N), x1, x2))
p <- inv.logit( X \%*\% b )
t <- rbinom(N, 1, p)
e <- rnorm(N, 0, 1)
Y <- 5 * t + a * ( x1 + x2 ) + e
bpsm( Y, t, X, method = "AI", estimand = "ATE" )
}
