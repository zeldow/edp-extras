library(MCMCpack)
library(Rcpp)
library(splines)
library(mvnfast)
library(dplyr)
library(data.table)

source("make_sim_data.r")

source("../../DPlong/Rutil.R")
source("../../DPlong/dp_long.R")
sourceCpp("../../DPlong/pred.cpp")
sourceCpp("../../DPlong/samp_reg.cpp")
sourceCpp("../../DPlong/samp_ri.cpp")
sourceCpp("../../DPlong/cluster.cpp")
sourceCpp("../../DPlong/update_covs.cpp")



spline <- list(bspline = FALSE,
               knots  = seq(from = 0.05, to = 0.95, length.out = 20),
               degree = 3)



l1.dp <- numeric(100)
l2.dp <- numeric(100)


for (i in 1:100) {

  set.seed(49 + 2*i)
  dat <- set.data(1000, 5, 1, prob.y.clust, 2, sqrt(0.15))


  xonly <- data.frame(x1  = dat[["x1"]],
                      x2  = dat[["x2"]],
                      x3  = dat[["x3"]],
                      x4  = dat[["x4"]],
                      x5  = dat[["x5"]],
                      x6  = dat[["x6"]],
                      x7  = dat[["x7"]],
                      x8  = dat[["x8"]],
                      x9  = dat[["x9"]],
                      x10 = dat[["x10"]],
                      x11 = dat[["x11"]],
                      x12 = dat[["x12"]],
                      x13 = dat[["x13"]],
                      x14 = dat[["x14"]],
                      x15 = dat[["x15"]],
                      x16 = dat[["x16"]],
                      x17 = dat[["x17"]],
                      x18 = dat[["x18"]],
                      x19 = dat[["x19"]],
                      x20 = dat[["x20"]])

  y  <- dat$y
  tp <- dat$t
  id <- dat$id
  pt <- dat$pred.time


  ## mcmc
  mcmc <- list(burnin        = 5000,
               ngibbs        = 20000,
               m             = 5,
               npred         = 5000,
               pred.time     = pred.time,
               pred.time.new = NULL,
               nsave         = 200,
               startY        = 5,
               startX        = 4)

  ## priors
  beta0 <- rep(0, ncol(xonly) + 2) 
  beta0[1] <- mean(y)
  prec0 <- 3 * diag(length(beta0)) 
  beta.a0 <- 3
  beta.b0 <- 0.1
  a0      <- 1
  b0      <- 1
  mu0     <- 1
  nu0     <- 10
  tau0    <- 1
  c0      <- 0.5
  alpa0   <- 1
  alpb0   <- 1
  a0.u    <- 1
  b0.u    <- 1
  a0.b    <- 3
  b0.b    <- 1
  prop.a  <- 1
  prop.b  <- 3

  prior <- list(beta0 = beta0,
                prec0 = prec0,
                beta.a0 = beta.a0,
                beta.b0 = beta.b0,
                a0 = a0,
                b0 = b0,
                mu0 = mu0,
                nu0 = nu0,
                tau0 = tau0,
                c0 = c0,
                alpa0 = alpa0,
                alpb0 = alpb0,
                a0.u = a0.u,
                b0.u = b0.u,
                a0.b = a0.b,
                b0.b = b0.b,
                prop.a = prop.a,
                prop.b = prop.b)



  sim.res <- dp.long( y          = y,
                       trt        = NULL,
                       newtrt     = NULL,
                       x          = as.matrix(xonly),
                       newx       = NULL,
                       id         = id,
                       timepoints = tp,
                       prior      = prior,
                       mcmc       = mcmc,
                       spline     = spline,
                       verbose    = TRUE,
                       printevery = 100)

  # compute error
  truth <- dat$ty

  l2.dp[i] <- mean((colMeans(sim.res$pred.w.data) - truth)^2)
  l1.dp[i] <- mean(abs(colMeans(sim.res$pred.w.data) - truth))

  rm(truth)
}

save(l2.dp, l1.dp, file = "./output/thin/sim3.dp.Rdata")
