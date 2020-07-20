setwd("X:/dissertation/paper2/")
library(haven)
library(dplyr)
library(stringr)

outcome <- read_sas("outcome.sas7bdat")

## O1 - outcomes and time on study
out1 <- aggregate(outcome$Diag1, by = list(outcome$site1), FUN = sum)
time1 <- aggregate(list(time = outcome$surv1), by = list(outcome$site1), FUN = sum)
o1 <- inner_join(time1,out1,by = "Group.1")
o1$time <- o1$time/365
o1$incidence <- o1$x/o1$time


## O2 - outcomes and time on study
out2 <- aggregate(outcome$Diag5, by = list(outcome$site1), FUN = sum)
time2 <- aggregate(list(time = outcome$surv5), by = list(outcome$site1), FUN = sum)
o2 <- inner_join(time2,out2,by = "Group.1")
o2$time <- o2$time/365
o2$incidence <- o2$x/o2$time



outcome$lnsurv1 <- log(outcome$surv1/365)
outcome$lnsurv5 <- log(outcome$surv5/365)


## some subjects have survtime = 0

sum(outcome$Diag1[which(outcome$surv1==0)])
sum(outcome$Diag5[which(outcome$surv5==0)])

glm.res <- function(out1, surv,SITE,lab) {
  
  dum.glm <- glm(eval(as.name(out1)) ~ 1, data = outcome, 
                            subset = eval(as.name(surv)) > 0 & site1 == SITE & anypostlab %in% lab, 
                            offset = eval(as.name(stringr::str_c("ln", surv))), 
                            family = poisson(link = log))
  res <- c(exp(dum.glm$coefficients), exp(BSagri::CIGLM(dum.glm)))
  names(res) <- c("Incidence", "Lower 95%", "Upper 95%")
  return(res)
  
}


res1a <- glm.res("Diag1", "surv1", "SITE1", c(0, 1))
res2a <- glm.res("Diag1", "surv1", "SITE1", c(1))
res3a <- glm.res("Diag1", "surv1", "SITE1", c(0))

res4a <- glm.res("Diag1", "surv1", "SITE2", c(0, 1))
res5a <- glm.res("Diag1", "surv1", "SITE2", c(1))
res6a <- glm.res("Diag1", "surv1", "SITE2", c(0))

res7a <- glm.res("Diag1", "surv1", "SITE3", c(0, 1))
res8a <- glm.res("Diag1", "surv1", "SITE3", c(1))
res9a <- glm.res("Diag1", "surv1", "SITE3", c(0))


## O2
res1b <- glm.res("Diag5", "surv5", "SITE1", c(0, 1))
res2b <- glm.res("Diag5", "surv5", "SITE1", c(1))
res3b <- glm.res("Diag5", "surv5", "SITE1", c(0))

res4b <- glm.res("Diag5", "surv5", "SITE2", c(0, 1))
res5b <- glm.res("Diag5", "surv5", "SITE2", c(1))
res6b <- glm.res("Diag5", "surv5", "SITE2", c(0))

res7b <- glm.res("Diag5", "surv5", "SITE3", c(0, 1))
res8b <- glm.res("Diag5", "surv5", "SITE3", c(1))
res9b <- glm.res("Diag5", "surv5", "SITE3", c(0))

all.res <- matrix(NA_character_, nrow = 9, ncol = 4)

for(i in 1:9){
  all.res[i,1] <- sprintf("%.3f", eval(as.name(str_c("res",i,"a"))))[1]
  all.res[i,2] <- str_c("(", 
                         sprintf("%.3f", eval(as.name(str_c("res",i,"a"))))[2],
                        "-",
                        sprintf("%.3f", eval(as.name(str_c("res",i,"a"))))[3],
                        ")")
  
  all.res[i,3] <- sprintf("%.3f", eval(as.name(str_c("res",i,"b"))))[1]
  all.res[i,4] <- str_c("(", 
                        sprintf("%.3f", eval(as.name(str_c("res",i,"b"))))[2],
                        "-",
                        sprintf("%.3f", eval(as.name(str_c("res",i,"b"))))[3],
                        ")")
}


print(o1)
print(o2)
print(all.res)  ## coresponds to Table 2 of paper

###############################################################
###############################################################
######### ADD IN PREDICTIONS ##################################
###############################################################
###############################################################


## thresholds for diabetes
a1c.thres  <- 6.5
glu.thres  <- 126
rand.thres <- 200



## fasting glucose predictions
setwd("X:/dissertation/paper2/glucose/final/output")
load("final_pred_10000.Rdata")

glu.w.data <- pred.w.data
glu.wo.data <- pred.wo.data

rm(pred.w.data, pred.wo.data)


## a1c predictions
setwd("X:/dissertation/paper2/a1c/final/output")
load("all_pred_10000.Rdata")

a1c.w.data <- pred.w.data
a1c.wo.data <- pred.wo.data

rm(pred.w.data, pred.wo.data)



### get ids for the predictions 
setwd("X:/dissertation/paper2")
fast <- read_sas("./glucose/data/glu_more.sas7bdat")
#rand <- read_sas("./random/data/glu_ran_more.sas7bdat")
a1c <- read_sas("./a1c/data/a1c_more.sas7bdat")



a1c.nodata.ids <- unique(a1c$studyid[which(is.na(a1c$rellab))])
length(a1c.nodata.ids)

a1c.data.ids <- unique(a1c$studyid[which(!is.na(a1c$rellab))])
length(a1c.data.ids)



glu.nodata.ids <- unique(fast$studyid[which(is.na(fast$rellab))])
length(glu.nodata.ids)

glu.data.ids <- unique(fast$studyid[which(!is.na(fast$rellab))])
length(glu.data.ids)



# rand.nodata.ids <- unique(rand$studyid[which(is.na(rand$rellab))])
# length(rand.nodata.ids)
# 
# rand.data.ids <- unique(rand$studyid[which(!is.na(rand$rellab))])
# length(rand.data.ids)


glm.res2 <- function(out1, surv,SITE,lab) {
  
  dum.glm <- glm(eval(as.name(out1)) ~ 1, data = outcome.sup, 
                 subset = eval(as.name(surv)) > 0 & site1 == SITE & anypostlab %in% lab, 
                 offset = eval(as.name(stringr::str_c("ln", surv))), 
                 family = poisson(link = log))
  res <- c(exp(dum.glm$coefficients), exp(BSagri::CIGLM(dum.glm)))
  names(res) <- c("Incidence", "Lower 95%", "Upper 95%")
  return(res)
  
}



total.preds <- dim(a1c.w.data)[1]
total.preds <- 800

for(i in 1:total.preds) {
#for(i in 100:100) {
  
  a1c.p1 <- a1c.w.data[i,]
  a1c.p2 <- a1c.wo.data[i,]
  
  a1c.pred <- data.frame(studyid = c(a1c.data.ids, a1c.nodata.ids), a1c.pred = c(a1c.p1, a1c.p2), stringsAsFactors = FALSE)
  #a1c.pred$studyid <- as.character(a1c.pred$studyid)
  
  glu.p1 <- glu.w.data[i,]
  glu.p2 <- glu.wo.data[i,]
  
  glu.pred <- data.frame(studyid = c(glu.data.ids, glu.nodata.ids), glu.pred = c(glu.p1, glu.p2), stringsAsFactors = FALSE)
  
  outcome.sup <- dplyr::inner_join(outcome, a1c.pred, by = "studyid")
  outcome.sup <- dplyr::inner_join(outcome.sup, glu.pred, by = "studyid")
  
  outcome.sup$a1c.high <- as.numeric(outcome.sup$a1c.pred >= a1c.thres)
  outcome.sup$glu.high <- as.numeric(outcome.sup$glu.pred >= glu.thres)
  
  outcome.sup$new.o <- as.numeric(outcome.sup$a1c.high == 1 | outcome.sup$glu.high == 1 | outcome.sup$Diag1 == 1)
  
  
  res1 <- glm.res2("new.o", "surv5", "SITE1", c(0, 1))
  res2 <- glm.res2("new.o", "surv5", "SITE1", c(1))
  res3 <- glm.res2("new.o", "surv5", "SITE1", c(0))
  
  res4 <- glm.res2("new.o", "surv5", "SITE2", c(0, 1))
  res5 <- glm.res2("new.o", "surv5", "SITE2", c(1))
  res6 <- glm.res2("new.o", "surv5", "SITE2", c(0))
  
  res7 <- glm.res2("new.o", "surv5", "SITE3", c(0, 1))
  res8 <- glm.res2("new.o", "surv5", "SITE3", c(1))
  res9 <- glm.res2("new.o", "surv5", "SITE3", c(0))
  
}





case.glu1 <- (glu.w.data >= 126)
summary(colMeans(case.glu1))

case.glu2 <- (glu.wo.data >= 126)
summary(colMeans(case.glu2))


case.a1c1 <- (a1c.w.data >= 6.5)
summary(colMeans(case.a1c1))

case.a1c2 <- (a1c.wo.data >= 6.5)
summary(colMeans(case.a1c2))
