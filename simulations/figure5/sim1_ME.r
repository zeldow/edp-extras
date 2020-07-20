library(lme4)

source("make_mixed.r")

l1.me <- numeric(100)
l2.me <- numeric(100)


for (i in 1:100) {

  set.seed(49 + 2*i)
  dat <- set.data(1000, 5, 1, prob.y.clust, 1, sqrt(0.15))


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
  mpp <- dat$mpp
  truth <- dat$ty
  n  <- length(unique(id))
  knots <- seq(from = 0.05, to = 0.95, length.out = 20)

  #z  <- splines::bs(tp, knots = c(1/3, 2/3), degree = 3)
  #nz <- predict(z, pt)
  #colnames(z) <- c("z1", "z2", "z3", "z4", "z5")

  Omega <- (abs(outer(knots, knots, "-")))^3
  svd.Omega_all <- svd(Omega)
  sqrt.Omega_all <- t(svd.Omega_all$v %*% (t(svd.Omega_all$u) * sqrt(svd.Omega_all$d)))
  Z_k <- (abs(outer(tp, knots, "-")))^3
  z   <- t(solve(sqrt.Omega_all, t(Z_k)))
	colnames(z) <- c("z1", "z2", "z3", "z4", "z5",
                   "z6", "z7", "z8", "z9", "z10",
                   "z11", "z12", "z13", "z14", "z15",
                   "z16", "z17", "z18", "z19", "z20")

  Z_k2 <- (abs(outer(pt, knots, "-")))^3
  nz <- t(solve(sqrt.Omega_all, t(Z_k2))) 
  
  long.rows <- rep( 1:n, times = mpp )
	mydat     <- xonly[ long.rows , ]
  mydat     <- cbind(mydat, as.matrix(z))

  #me <- lmer(y ~ x1 + x2 + x3 + x4 + x5 + x6 +
  #             x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14 + x15 +
  #             x16 + x17 + x18 + x19 + x20 + z1 + z2 + z3 + z4 + z5 + (1 | id), data=mydat)

  me <- lmer(y ~ x1 + x2 + x3 + x4 + x5 + x6 +
               x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14 + x15 +
               x16 + x17 + x18 + x19 + x20 + z1 + z2 + z3 + z4 + z5 + z6 +
               z7 + z8 + z9 + z10 + z11 + z12 + z13 + z14 + z15 + z16 +
               z17 + z18 + z19 + z20 + tp + (1 | id), data=mydat)

  newdat <- data.frame(x1 = dat$x1,
                       x2 = dat$x2,
                       x3 = dat$x3,
                       x4 = dat$x4,
                       x5 = dat$x5,
                       x6 = dat$x6,
                       x7 = dat$x7,
                       x8 = dat$x8,
                       x9 = dat$x9,
                       x10 = dat$x10,
                       x11 = dat$x11,
                       x12 = dat$x12,
                       x13 = dat$x13,
                       x14 = dat$x14,
                       x15 = dat$x15,
                       x16 = dat$x16,
                       x17 = dat$x17,
                       x18 = dat$x18,
                       x19 = dat$x19,
                       x20 = dat$x20,
                       z1 = rep(nz[1,1], 1000),
                       z2 = rep(nz[1,2], 1000),
                       z3 = rep(nz[1,3], 1000),
                       z4 = rep(nz[1,4], 1000),
                       z5 = rep(nz[1,5], 1000),
                       id = 1:1000)
  
  newdat <- data.frame(x1 = dat$x1,
                       x2 = dat$x2,
                       x3 = dat$x3,
                       x4 = dat$x4,
                       x5 = dat$x5,
                       x6 = dat$x6,
                       x7 = dat$x7,
                       x8 = dat$x8,
                       x9 = dat$x9,
                       x10 = dat$x10,
                       x11 = dat$x11,
                       x12 = dat$x12,
                       x13 = dat$x13,
                       x14 = dat$x14,
                       x15 = dat$x15,
                       x16 = dat$x16,
                       x17 = dat$x17,
                       x18 = dat$x18,
                       x19 = dat$x19,
                       x20 = dat$x20,
                       z1 = rep(nz[1,1], 1000),
                       z2 = rep(nz[1,2], 1000),
                       z3 = rep(nz[1,3], 1000),
                       z4 = rep(nz[1,4], 1000),
                       z5 = rep(nz[1,5], 1000),
                       z6 = rep(nz[1,6], 1000),
                       z7 = rep(nz[1,7], 1000),
                       z8 = rep(nz[1,8], 1000),
                       z9 = rep(nz[1,9], 1000),
                       z10 = rep(nz[1,10], 1000),
                       z11 = rep(nz[1,11], 1000),
                       z12 = rep(nz[1,12], 1000),
                       z13 = rep(nz[1,13], 1000),
                       z14 = rep(nz[1,14], 1000),
                       z15 = rep(nz[1,15], 1000),
                       z16 = rep(nz[1,16], 1000),
                       z17 = rep(nz[1,17], 1000),
                       z18 = rep(nz[1,18], 1000),
                       z19 = rep(nz[1,19], 1000),
                       z20 = rep(nz[1,20], 1000),
                       tp  = rep(pt, 1000),
                       id = 1:1000)

  me.pred <- predict(me, newdat, re.form = NULL)

  l1.me[i] <- mean(abs(me.pred - truth))
  l2.me[i] <- mean((me.pred - truth)^2)

  rm(truth)
  cat("Iteration: ", i, "\n")

}

print(mean(l1.me))
print(mean(l2.me))

save(l1.me, l2.me, file = "./output/thin/sim1.me.Rdata")
