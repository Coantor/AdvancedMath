## 迭代函数 x_{n+1} = c/2 + xn^2/2
iter_fun <- function(x,c){
  return(c/2 + x^2/2)
}

N <<- 10 #迭代次数
c = c(runif(3,0,1.8),1)
par(mfrow = c(2,2))
for(j in 1:length(c)){
  x = numeric(N)
  x[1] = c[j]/2
  for(i in 2:N){
    x[i] = iter_fun(x[i-1],c[j])
  }
  plot(x,main = paste("c = ",c[j]))
}
