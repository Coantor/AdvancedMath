### 迭代函数
f <- function(x){
  return(logb(1+x))
}

N = 100
x = 1:N
for(i in 2:N){
  x[i] = f(x[i-1])
}
## x = 2/n

plot(x*(1:N),main = "迭代序列 [*n] 的序列")
abline(h = 2,col="red",lty = 2)

## (n*x - 2) * n
plot( (1:N)*((1:N)*x - 2), main= "迭代序列 [*n^2] 的序列" )

