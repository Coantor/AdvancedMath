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

## 绘制复旦2023第一题
x = seq(-2,2,len = 1000)
z = 1:length(x)
for(i in 1:length(x)){
  op = c(x[i],x[i]+1)
  oa = c(x[i]-1,x[i]+1)
  z[i] = sum(op*oa)/sqrt(sum(oa*oa)*sum(op*op))
}
plot(x,acos(z),cex = 0.3)
abline(h = pi/4,col = "red")
