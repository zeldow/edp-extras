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

setwd("~/dissertation/paper2/glucose/final")

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
glucose.all     <- dplyr::filter(glucose.all, newsite1 == 1)
glucose.missing <- dplyr::filter(glucose.missing, newsite1 == 1)

fixed.names <- fixed.names[- grep("site",fixed.names)]

glucose.all     <- as.data.table(glucose.all)
glucose.missing <- as.data.table(glucose.missing)

# create numeric ID variables
setDT(glucose.all)[,id:=.GRP, by = list(studyid)]
setDT(glucose.missing)[,id:=.GRP, by = list(studyid)]

## average over duplicate values
keys    <- colnames(glucose.all)[!grepl("glu_res", colnames(glucose.all))]
glucose.all2 <- glucose.all[,list(glu_res = mean(glu_res)), c("id", "rellab")]

X.only     <- glucose.all[c(TRUE, glucose.all$studyid[-1] != glucose.all$studyid[-length(glucose.all$studyid)]), ]
pred.time1 <- X.only[["surv5"]]
X.only     <- X.only[ , fixed.names, with = FALSE]
X.only2    <- glucose.missing[c(TRUE, glucose.missing$studyid[-1] != glucose.missing$studyid[-length(glucose.missing$studyid)]), ]
pred.time2 <- X.only2[["surv5"]]
X.only2    <- X.only2[ , fixed.names, with = FALSE]

mat.all    <- as.data.frame(glucose.all)[ ,c(fixed.names)]
all.ids    <- glucose.all2$id
y          <- glucose.all2$glu_res
maxtime    <- max(glucose.all2$rellab)

timepoints <- glucose.all2$rellab / maxtime
pred.time1 <- pred.time1 / maxtime
pred.time2 <- pred.time2 / maxtime

## set up splines 
spline <- list(bspline = FALSE,
               knots  = seq(from = quantile(timepoints, probs = 0.05), to = quantile(timepoints, probs = 0.95), length.out = 20),
							 degree = 3)
#spline <- list(nknots = 5,
#               knots  = seq(from = quantile(timepoints, probs = 0.1), to = quantile(timepoints, probs = 0.9), length.out = 5),
#							 degree = 3)

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
source("priors_glu.R")

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


glu.res <- edp.long( y          = y,
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

save(glu.res, file = "./output/fasting_results_EDPsp_SITE1_final.Rdata")
