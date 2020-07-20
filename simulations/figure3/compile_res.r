##setwd("X:/dissertation/paper2/sims/predictions/output")

## sim1

load("sim1.edp.Rdata")
load("sim1.dp.Rdata")
load("sim1.me.Rdata")

print(mean(l1.edp))
print(mean(l2.edp))

print(mean(l1.dp))
print(mean(l2.dp))

print(mean(l1.me))
print(mean(l2.me))


## sim2

load("sim2.edp.Rdata")
load("sim2.dp.Rdata")
load("sim2.me.Rdata")

print(mean(l1.edp))
print(mean(l2.edp))

print(mean(l1.dp))
print(mean(l2.dp))

print(mean(l1.me))
print(mean(l2.me))


## sim3

load("sim3.edp.Rdata")
load("sim3.dp.Rdata")
load("sim3.me.Rdata")

print(mean(l1.edp))
print(mean(l2.edp))

print(mean(l1.dp))
print(mean(l2.dp))

print(mean(l1.me))
print(mean(l2.me))


## sim4

load("sim4.edp.Rdata")
load("sim4.dp.Rdata")
load("sim4.me.Rdata")

print(mean(l1.edp))
print(mean(l2.edp))

print(mean(l1.dp))
print(mean(l2.dp))

print(mean(l1.me))
print(mean(l2.me))



## sim5
load("sim5.edp.part1.Rdata")
l1 <- l1.edp[1:10]
l2 <- l2.edp[1:10]

load("sim5.edp.part2.Rdata")
l1 <- c(l1, l1.edp[11:20])
l2 <- c(l2, l2.edp[11:20])

load("sim5.edp.part3.Rdata")
l1 <- c(l1, l1.edp[21:30])
l2 <- c(l2, l2.edp[21:30])

load("sim5.edp.part4.Rdata")
l1 <- c(l1, l1.edp[31:40])
l2 <- c(l2, l2.edp[31:40])

load("sim5.edp.part5.Rdata")
l1 <- c(l1, l1.edp[41:50])
l2 <- c(l2, l2.edp[41:50])

load("sim5.edp.part6.Rdata")
l1 <- c(l1, l1.edp[51:60])
l2 <- c(l2, l2.edp[51:60])

load("sim5.edp.part7.Rdata")
l1 <- c(l1, l1.edp[61:70])
l2 <- c(l2, l2.edp[61:70])

load("sim5.edp.part8.Rdata")
l1 <- c(l1, l1.edp[71:80])
l2 <- c(l2, l2.edp[71:80])

load("sim5.edp.part9.Rdata")
l1 <- c(l1, l1.edp[81:90])
l2 <- c(l2, l2.edp[81:90])

load("sim5.edp.part10.Rdata")
l1 <- c(l1, l1.edp[91:100])
l2 <- c(l2, l2.edp[91:100])

l1.edp <- l1
l2.edp <- l2


load("sim5.dp.part1.Rdata")
l1 <- l1.dp[1:10]
l2 <- l2.dp[1:10]

load("sim5.dp.part2.Rdata")
l1 <- c(l1, l1.dp[11:20])
l2 <- c(l2, l2.dp[11:20])

load("sim5.dp.part3.Rdata")
l1 <- c(l1, l1.dp[21:30])
l2 <- c(l2, l2.dp[21:30])

load("sim5.dp.part4.Rdata")
l1 <- c(l1, l1.dp[31:40])
l2 <- c(l2, l2.dp[31:40])

load("sim5.dp.part5.Rdata")
l1 <- c(l1, l1.dp[41:50])
l2 <- c(l2, l2.dp[41:50])

load("sim5.dp.part6.Rdata")
l1 <- c(l1, l1.dp[51:60])
l2 <- c(l2, l2.dp[51:60])

load("sim5.dp.part7.Rdata")
l1 <- c(l1, l1.dp[61:70])
l2 <- c(l2, l2.dp[61:70])

load("sim5.dp.part8.Rdata")
l1 <- c(l1, l1.dp[71:80])
l2 <- c(l2, l2.dp[71:80])

load("sim5.dp.part9.Rdata")
l1 <- c(l1, l1.dp[81:90])
l2 <- c(l2, l2.dp[81:90])

load("sim5.dp.part10.Rdata")
l1 <- c(l1, l1.dp[91:100])
l2 <- c(l2, l2.dp[91:100])

l1.dp <- l1
l2.dp <- l2


load("sim5.me.Rdata")

print(mean(l1.edp))
print(mean(l2.edp))

print(mean(l1.dp))
print(mean(l2.dp))

print(mean(l1.me))
print(mean(l2.me))





## sim6

load("sim6.edp.part1.Rdata")
l1 <- l1.edp[1:10]
l2 <- l2.edp[1:10]

load("sim6.edp.part2.Rdata")
l1 <- c(l1, l1.edp[11:20])
l2 <- c(l2, l2.edp[11:20])

load("sim6.edp.part3.Rdata")
l1 <- c(l1, l1.edp[21:30])
l2 <- c(l2, l2.edp[21:30])

load("sim6.edp.part4.Rdata")
l1 <- c(l1, l1.edp[31:40])
l2 <- c(l2, l2.edp[31:40])

load("sim6.edp.part5.Rdata")
l1 <- c(l1, l1.edp[41:50])
l2 <- c(l2, l2.edp[41:50])

load("sim6.edp.part6.Rdata")
l1 <- c(l1, l1.edp[51:60])
l2 <- c(l2, l2.edp[51:60])

load("sim6.edp.part7.Rdata")
l1 <- c(l1, l1.edp[61:70])
l2 <- c(l2, l2.edp[61:70])

load("sim6.edp.part8.Rdata")
l1 <- c(l1, l1.edp[71:80])
l2 <- c(l2, l2.edp[71:80])

load("sim6.edp.part9.Rdata")
l1 <- c(l1, l1.edp[81:90])
l2 <- c(l2, l2.edp[81:90])

load("sim6.edp.part10.Rdata")
l1 <- c(l1, l1.edp[91:100])
l2 <- c(l2, l2.edp[91:100])

l1.edp <- l1
l2.edp <- l2


load("sim6.dp.part1.Rdata")
l1 <- l1.dp[1:10]
l2 <- l2.dp[1:10]

load("sim6.dp.part2.Rdata")
l1 <- c(l1, l1.dp[11:20])
l2 <- c(l2, l2.dp[11:20])

load("sim6.dp.part3.Rdata")
l1 <- c(l1, l1.dp[21:30])
l2 <- c(l2, l2.dp[21:30])

load("sim6.dp.part4.Rdata")
l1 <- c(l1, l1.dp[31:40])
l2 <- c(l2, l2.dp[31:40])

load("sim6.dp.part5.Rdata")
l1 <- c(l1, l1.dp[41:50])
l2 <- c(l2, l2.dp[41:50])

load("sim6.dp.part6.Rdata")
l1 <- c(l1, l1.dp[51:60])
l2 <- c(l2, l2.dp[51:60])

load("sim6.dp.part7.Rdata")
l1 <- c(l1, l1.dp[61:70])
l2 <- c(l2, l2.dp[61:70])

load("sim6.dp.part8.Rdata")
l1 <- c(l1, l1.dp[71:80])
l2 <- c(l2, l2.dp[71:80])

load("sim6.dp.part9.Rdata")
l1 <- c(l1, l1.dp[81:90])
l2 <- c(l2, l2.dp[81:90])

load("sim6.dp.part10.Rdata")
l1 <- c(l1, l1.dp[91:100])
l2 <- c(l2, l2.dp[91:100])

l1.dp <- l1
l2.dp <- l2

load("sim6.me.Rdata")

print(mean(l1.edp))
print(mean(l2.edp))

print(mean(l1.dp))
print(mean(l2.dp))

print(mean(l1.me))
print(mean(l2.me))




## sim7
load("sim7.edp.part1.Rdata")
l1 <- l1.edp[1:10]
l2 <- l2.edp[1:10]

load("sim7.edp.part2.Rdata")
l1 <- c(l1, l1.edp[11:20])
l2 <- c(l2, l2.edp[11:20])

load("sim7.edp.part3.Rdata")
l1 <- c(l1, l1.edp[21:30])
l2 <- c(l2, l2.edp[21:30])

load("sim7.edp.part4.Rdata")
l1 <- c(l1, l1.edp[31:40])
l2 <- c(l2, l2.edp[31:40])

load("sim7.edp.part5.Rdata")
l1 <- c(l1, l1.edp[41:50])
l2 <- c(l2, l2.edp[41:50])

load("sim7.edp.part6.Rdata")
l1 <- c(l1, l1.edp[51:60])
l2 <- c(l2, l2.edp[51:60])

load("sim7.edp.part7.Rdata")
l1 <- c(l1, l1.edp[61:70])
l2 <- c(l2, l2.edp[61:70])

load("sim7.edp.part8.Rdata")
l1 <- c(l1, l1.edp[71:80])
l2 <- c(l2, l2.edp[71:80])

load("sim7.edp.part9.Rdata")
l1 <- c(l1, l1.edp[81:90])
l2 <- c(l2, l2.edp[81:90])

load("sim7.edp.part10.Rdata")
l1 <- c(l1, l1.edp[91:100])
l2 <- c(l2, l2.edp[91:100])

l1.edp <- l1
l2.edp <- l2



load("sim7.dp.part1.Rdata")
l1 <- l1.dp[1:10]
l2 <- l2.dp[1:10]

load("sim7.dp.part2.Rdata")
l1 <- c(l1, l1.dp[11:20])
l2 <- c(l2, l2.dp[11:20])

load("sim7.dp.part3.Rdata")
l1 <- c(l1, l1.dp[21:30])
l2 <- c(l2, l2.dp[21:30])

load("sim7.dp.part4.Rdata")
l1 <- c(l1, l1.dp[31:40])
l2 <- c(l2, l2.dp[31:40])

load("sim7.dp.part5.Rdata")
l1 <- c(l1, l1.dp[41:50])
l2 <- c(l2, l2.dp[41:50])

load("sim7.dp.part6.Rdata")
l1 <- c(l1, l1.dp[51:60])
l2 <- c(l2, l2.dp[51:60])

load("sim7.dp.part7.Rdata")
l1 <- c(l1, l1.dp[61:70])
l2 <- c(l2, l2.dp[61:70])

load("sim7.dp.part8.Rdata")
l1 <- c(l1, l1.dp[71:80])
l2 <- c(l2, l2.dp[71:80])

load("sim7.dp.part9.Rdata")
l1 <- c(l1, l1.dp[81:90])
l2 <- c(l2, l2.dp[81:90])

load("sim7.dp.part10.Rdata")
l1 <- c(l1, l1.dp[91:100])
l2 <- c(l2, l2.dp[91:100])

l1.dp <- l1
l2.dp <- l2


load("sim7.me.Rdata")

print(mean(l1.edp))
print(mean(l2.edp))

print(mean(l1.dp))
print(mean(l2.dp))

print(mean(l1.me))
print(mean(l2.me))


## sim8

load("sim8.edp.part1.Rdata")
l1 <- l1.edp[1:10]
l2 <- l2.edp[1:10]

load("sim8.edp.part2.Rdata")
l1 <- c(l1, l1.edp[11:20])
l2 <- c(l2, l2.edp[11:20])

load("sim8.edp.part3.Rdata")
l1 <- c(l1, l1.edp[21:30])
l2 <- c(l2, l2.edp[21:30])

load("sim8.edp.part4.Rdata")
l1 <- c(l1, l1.edp[31:40])
l2 <- c(l2, l2.edp[31:40])

load("sim8.edp.part5.Rdata")
l1 <- c(l1, l1.edp[41:50])
l2 <- c(l2, l2.edp[41:50])

load("sim8.edp.part6.Rdata")
l1 <- c(l1, l1.edp[51:60])
l2 <- c(l2, l2.edp[51:60])

load("sim8.edp.part7.Rdata")
l1 <- c(l1, l1.edp[61:70])
l2 <- c(l2, l2.edp[61:70])

load("sim8.edp.part8.Rdata")
l1 <- c(l1, l1.edp[71:80])
l2 <- c(l2, l2.edp[71:80])

load("sim8.edp.part9.Rdata")
l1 <- c(l1, l1.edp[81:90])
l2 <- c(l2, l2.edp[81:90])

load("sim8.edp.part10.Rdata")
l1 <- c(l1, l1.edp[91:100])
l2 <- c(l2, l2.edp[91:100])

l1.edp <- l1
l2.edp <- l2


load("sim8.dp.part1.Rdata")
l1 <- l1.dp[1:10]
l2 <- l2.dp[1:10]

load("sim8.dp.part2.Rdata")
l1 <- c(l1, l1.dp[11:20])
l2 <- c(l2, l2.dp[11:20])

load("sim8.dp.part3.Rdata")
l1 <- c(l1, l1.dp[21:30])
l2 <- c(l2, l2.dp[21:30])

load("sim8.dp.part4.Rdata")
l1 <- c(l1, l1.dp[31:40])
l2 <- c(l2, l2.dp[31:40])

load("sim8.dp.part5.Rdata")
l1 <- c(l1, l1.dp[41:50])
l2 <- c(l2, l2.dp[41:50])

load("sim8.dp.part6.Rdata")
l1 <- c(l1, l1.dp[51:60])
l2 <- c(l2, l2.dp[51:60])

load("sim8.dp.part7.Rdata")
l1 <- c(l1, l1.dp[61:70])
l2 <- c(l2, l2.dp[61:70])

load("sim8.dp.part8.Rdata")
l1 <- c(l1, l1.dp[71:80])
l2 <- c(l2, l2.dp[71:80])

load("sim8.dp.part9.Rdata")
l1 <- c(l1, l1.dp[81:90])
l2 <- c(l2, l2.dp[81:90])

load("sim8.dp.part10.Rdata")
l1 <- c(l1, l1.dp[91:100])
l2 <- c(l2, l2.dp[91:100])

l1.dp <- l1
l2.dp <- l2


load("sim8.me.Rdata")

print(mean(l1.edp))
print(mean(l2.edp))

print(mean(l1.dp))
print(mean(l2.dp))

print(mean(l1.me))
print(mean(l2.me))
