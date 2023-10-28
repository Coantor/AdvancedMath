### 这里验证fourier系数收敛问题
source("CalFourierCoef.R")
f = function(x){
  d = (pi- x)/2
  d[d > pi/2] = d[d > pi/2] - pi
  return(d)
}
a0 = integrate(f,-pi,pi)$value/pi
n = 30
## 返回Fourier系数矩阵
mat = Cal_Fourier_Coef(f,n = n)

v = vector(mode = "double",length = n+1)
v[1] = a0^2/2
for(i in 1:n){
  v[i+1] = sum(mat[1:i,]^2)
}

v_real = integrate(\(x)f(x)*f(x)/pi,lower = -pi,upper = pi)$value

plot(1:(n+1),v,type = "b",ylim = c(0,2),cex = 0.8,pch = 16,
     xlab = "x",ylab = "部分和",main = "fourier系数平方收敛")
abline(h = v_real,col = "red")