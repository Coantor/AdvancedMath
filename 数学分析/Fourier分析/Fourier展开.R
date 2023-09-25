source("CalFourierCoef.R")
## 根据前面的计算系数的函数脚本,此脚本是主脚本
## 待展开函数
f = function(x){
  d = (pi- x)/2
  d[d > pi/2] = d[d > pi/2] - pi
  return(d)
}
n = 20
## 产生随机颜色
set.seed(10)

## 返回Fourier系数矩阵
mat = Cal_Fourier_Coef(f,n = n)


## 计算傅里叶级数右边展开表达式
x = seq(-pi,pi,len = 300)
y_real = f(x)
a0 =  integrate(f,-pi,pi)$value/pi
fourier_fun = vector(mode = "list",n)
fourier_fun[[1]] = function(x){
  return(mat[1,1]*cos(x) + mat[1,2]*sin(x) + a0/2)
  }
for(i in 2:n){
  fourier_fun[[i]] = function(x){
    s = a0/2
    for(j in 1:i){
      s = s + mat[j,1]*cos(j*x) + mat[j,2]*sin(j*x)
    }
    return(s)
  }
}
plot(x,y_real,type = "l" ,lwd = 2,ylab = "y",main = "fourier展开",
     ylim = c(-1.8,1.8))
abline(h = 0,col = "blue",lwd= 1.3,lty = 2)
## 产生随机颜色发生器
Init_color_eng()
for(i in 1:n){
  points(x,y = fourier_fun[[i]](x),col = cb_palette[i],type = "l")
}

