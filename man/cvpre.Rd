% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pre.R
\name{cvpre}
\alias{cvpre}
\title{Full k-fold cross validation of a pre}
\usage{
cvpre(object, k = 10, verbose = FALSE, pclass = 0.5,
  penalty.par.val = "lambda.1se", parallel = FALSE)
}
\arguments{
\item{object}{An object of class \code{\link{pre}}.}

\item{k}{integer. The number of cross validation folds to be used.}

\item{verbose}{logical. Should progress of the cross validation be printed 
to the command line?}

\item{pclass}{numeric. Only used for classification. Cut-off value between 
0 and 1 to be used for classifying to second class.}

\item{penalty.par.val}{character. Calculate cross-validated error for ensembles 
with penalty parameter criterion giving minimum cv error (\code{"lambda.min"}) 
or giving cv error that is within 1 standard error of minimum cv error 
("\code{lambda.1se}")?}

\item{parallel}{logical. Should parallel foreach be used? Must register parallel 
beforehand, such as doMC or others.}
}
\value{
A list with three elements: \code{$cvpreds} (a vector with cross-validated
predicted y values), \code{$ss} (a vector indicating the cross-validation subsample 
each training observation was assigned to) and \code{$accuracy}. For continuous 
outputs, accuracy is a list with elements \code{$MSE} (mean squared error on test 
observations), \code{$MAE} (mean absolute error on test observations). For 
classification, accuracy is a list with elements 
\code{$SEL} (mean squared error on predicted probabilities), \code{$AEL} (mean absolute 
error on predicted probabilities), \code{$MCR} (average misclassification error rate) 
and \code{$table} (table with proportions of (in)correctly classified observations 
per class).
}
\description{
\code{cvpre} performs k-fold cross validation on the dataset used to create 
the ensemble, providing an estimate of predictive accuracy on future observations.
}
\examples{
\donttest{
set.seed(42)
airq.ens <- pre(Ozone ~ ., data = airquality[complete.cases(airquality),])
airq.cv <- cvpre(airq.ens)}
}

