## priors for a1c outcome analysis

# prior regression parameters ~ MVN(beta0, prec0^-1)
#my.gee  <- geeglm(y ~ as.matrix(mat.all), id=all.ids)
#beta0   <- my.gee$coefficients
#div     <- 250
#prec0   <- solve(my.gee$geese$vbeta)[1:length(beta0),1:length(beta0)] / div

beta0 <- rep(0, ncol(mat.all) + 2)
beta0[1] <- 100
#beta0[1] <- mean(y, na.rm = TRUE)
div <- 1
prec0 <- diag(ncol(mat.all) + 2) / div


# prior on regression variance and betas ~ invgamma(beta.a0, beta.b0)
beta.a0 <- 3
beta.b0 <- 1


# prior on binary covariates ~ beta(a0, b0)
a0      <- 1     
b0      <- 1


# prior on continuous covariates ~ Normal - inverse chi square
mu0     <- 0
nu0     <- 10
tau0    <- 1
c0      <- 0.5

# prior on alpha (mass parameters) ~ gamma(alpa0, alpb0)
alpa0   <- 1
alpb0   <- 1

# prior on random intercept variance ~ invgamma(a0.u, b0.u)
a0.u    <- 3 
b0.u    <- 3

# prior on spline coefficient variances ~ invgamma(a0.b, b0.b)
a0.b    <- 1
b0.b    <- 1

## proposal distribution on alpha parameters
prop.a  <- 3
prop.b  <- 1
