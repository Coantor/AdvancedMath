Inte_exp <- function(n){
  ## 提取出value值
  value = integrate(\(x){exp(n*x)*(1-x)^(n)},0,1,subdivisions = 300L)[[1]]
  return(value)
}

N = 20
value = 1:N
n = ceiling(seq(1,500,len = N))
for(i in 1:N){
  value[i] = sqrt(n[i]) * Inte_exp(n[i])
}

plot(n,value,ylim = c(0.4,1.4))
abline(h = sqrt(pi/2),col = "red")
library(ggplot2)
xlim()