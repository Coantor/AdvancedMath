double_fac <- function(N){
  n = 2*N
  m = 2*N - 1
  a = 1
  while(n > 0 && m > 0){
    a = a * n/m
    n = n -2
    m = m - 2
  }
  return(a)
}

par(mfrow = c(2,2))

Num = 50 # 模拟50轮
z = matrix(0,ncol = 2,nrow = Num)
for(i in 1:Num){
  z[i,1] = double_fac(i)
  z[i,2] = sqrt(i * pi)
}
plot(1:Num,z[,1],col="red",pch = 16,cex = 0.6,xlab = "n",ylab = "value")
points(1:Num,z[,2],col = "blue",type = "b")
legend(x = 25,y= 5,
       legend = c("(2n)!!/(2n-1)!!","sqrt(n*pi)")
       ,col = c("red","blue"),pch = c(16,1))


z2 = matrix(0,ncol = 2,nrow = Num)
for(i in 1:Num){
  z2[i,1] = double_fac(i+0.5)
  z2[i,2] = sqrt((i+0.5) * pi)
}
plot(1:Num,z2[,2],col="red",pch = 16,cex = 0.6,xlab = "n",ylab = "value"
        ,main = "想当然的使用阶乘估计")
points(1:Num,z2[,1],col = "blue",type = "b")
legend(x = 35,y= 5,
       legend = c("(2n+1)!!/(2n)!!","sqrt(n*pi)")
       ,col = c("red","blue"),pch = c(16,1))

for(i in 1:Num){
  z2[i,2] =  2*sqrt((i+0.5)/pi)
}
plot(1:Num,z2[,2],col="red",pch = 16,cex = 0.6,xlab = "n",ylab = "value"
     ,main = "正确的使用阶乘估计")
points(1:Num,z2[,1],col = "blue",type = "b")
legend(x = 35,y= 5,
       legend = c("(2n+1)!!/(2n)!!","2*sqrt(n/pi)")
       ,col = c("red","blue"),pch = c(16,1))

