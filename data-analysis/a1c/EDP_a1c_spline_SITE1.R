#library(haven)
library(Rcpp)
library(data.table)
library(dplyr)
#library(dtplyr)
library(Hmisc)
library(geepack)
library(MCMCpack)
library(mvnfast)
library(splines)

setwd("~/dissertation/paper2/a1c/final")

source("../../Rpackage/Rutil.R")  
source("../../Rpackage/edp_long.R")  
sourceCpp("../../Rpackage/pred.cpp")
sourceCpp("../../Rpackage/samp_reg.cpp")
sourceCpp("../../Rpackage/samp_ri.cpp")
sourceCpp("../../Rpackage/cluster.cpp")
sourceCpp("../../Rpackage/update_covs.cpp")


source("../data/processData.r")

startY <- 2
startX <- 2

## restrict to SITE1
a1c.all     <- dplyr::filter(a1c.all, newsite1 == 1)
a1c.missing <- dplyr::filter(a1c.missing, newsite1 == 1)

fixed.names <- fixed.names[- grep("site",fixed.names)]

a1c.all     <- as.data.table(a1c.all)
a1c.missing <- as.data.table(a1c.missing)

# create numeric ID variables
setDT(a1c.all)[,id:=.GRP, by = list(studyid)]
setDT(a1c.missing)[,id:=.GRP, by = list(studyid)]

## average over duplicate values
keys    <- colnames(a1c.all)[!grepl("a1c", colnames(a1c.all))]
a1c.all2 <- a1c.all[,list(a1c = mean(a1c)), c("id", "rellab")]

X.only     <- a1c.all[c(TRUE, a1c.all$studyid[-1] != a1c.all$studyid[-length(a1c.all$studyid)]), ]
pred.time1 <- X.only[["surv5"]]
X.only     <- X.only[ , fixed.names, with = FALSE]
X.only2    <- a1c.missing[c(TRUE, a1c.missing$studyid[-1] != a1c.missing$studyid[-length(a1c.missing$studyid)]), ]
pred.time2 <- X.only2[["surv5"]]
X.only2    <- X.only2[ , fixed.names, with = FALSE]

mat.all    <- as.data.frame(a1c.all)[ ,c(fixed.names)]
all.ids    <- a1c.all2$id
y          <- log(a1c.all2$a1c)
maxtime    <- max(a1c.all2$rellab)


timepoints <- a1c.all2$rellab/maxtime
pred.time1 <- pred.time1 / maxtime
pred.time2 <- pred.time2 / maxtime

## set up splines 
spline <- list(bspline = FALSE,
               knots  = seq(from = quantile(timepoints, probs = 0.05), to = quantile(timepoints, probs = 0.95), length.out = 20),
							 degree = 3)

## set up mcmc
mcmc <- list(burnin        = 40000,
						 ngibbs        = 200000,
						 m             = 2,
						 npred         = 800,
						 pred.time     = pred.time1,
						 pred.time.new = pred.time2,
						 nsave         = 800,
						 startY        = 2,
						 startX        = 3)

## priors
source("priors_a1c.R")

prior <- list(beta0   = beta0,
              prec0   = prec0,
							beta.a0 = beta.a0,
							beta.b0 = beta.b0,
							a0      = a0,
							b0      = b0,
							mu0     = mu0,
							nu0     = nu0,
							tau0    = tau0,
							c0      = c0,
							alpa0   = alpa0,
							alpb0   = alpb0,
							a0.u    = a0.u,
							b0.u    = b0.u,
							a0.b    = a0.b,
							b0.b    = b0.b,
							prop.a  = prop.a,
							prop.b  = prop.b)


a1c.res <- edp.long( y          = y,
					           trt        = X.only[['drug']],
										 newtrt     = X.only2[['drug']],
										 x          = as.matrix(X.only[ , -1]),
										 newx       = as.matrix(X.only2[ , -1]),
										 id         = all.ids,
										 timepoints = timepoints, 
										 prior      = prior,
										 mcmc       = mcmc,
										 spline     = spline,
										 verbose    = TRUE,
										 printevery = 5)

save(a1c.res, file = "./output/a1c_results_EDPsp_SITE1_final.Rdata")
