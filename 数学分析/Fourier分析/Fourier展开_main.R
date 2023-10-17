 source("CalFourierCoef.R")
## 根据前面的计算系数的函数脚本,此脚本是主脚本
## 待展开函数
f = function(x){
  d = sin(x)/x
  d[is.nan(d)] = 1
  ## 
  d = x
  d[x>pi] = d[x>pi] - pi*2
  d[x< -pi] = d[x< -pi] + pi*2
  
  ## 
  d = pi/2 -x
  d[x < 0] = pi - d[x<0]
  return(d)
}
n = 10
## 产生随机颜色
set.seed(10)
## 计算傅里叶级数右边展开表达式
x = seq(-3/2*pi,3/2*pi,len = 300)
y_real = f(x)
a0 =  integrate(f,-pi,pi)$value/pi

## 产生随机颜色发生器
Init_color_eng()

## 调整画面图片
par(mfrow =c(2,1))

#### 使用R语言计算系数 ======
# 返回Fourier系数矩阵
mat = Cal_Fourier_Coef(f,n = n)
fourier_fun = vector(mode = "list",n)
# 生成级数
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
plot(x,y_real,type = "l" ,lwd = 2,ylab = "y",main = "fourier展开",sub = "核心函数用R语言")
abline(h = 0,col = "blue",lwd= 1.3,lty = 2)

for(i in 1:n){
  points(x,y = fourier_fun[[i]](x),col = cb_palette[i],type = "l")
}

#### 使用C++计算系数 =====
mat_cpp = Cal_Fourier_Coef_cpp(f,n = n)
fourier_fun_cpp = vector(mode = "list",n)
##生成级数
fourier_fun_cpp[[1]] = function(x){
  return(mat_cpp[1,1]*cos(x) + mat_cpp[1,2]*sin(x) + a0/2)
}
for(i in 2:n){
  fourier_fun_cpp[[i]] = function(x){
    s = a0/2
    for(j in 1:i){
      s = s + mat_cpp[j,1]*cos(j*x) + mat_cpp[j,2]*sin(j*x)
    }
    return(s)
  }
}
plot(x,y_real,type = "l" ,lwd = 2,ylab = "y",main = "fourier展开",sub = "核心函数用C++")
abline(h = 0,col = "blue",lwd= 1.3,lty = 2)
for(i in 1:n){
  points(x,y = fourier_fun_cpp[[i]](x),col = cb_palette[i],type = "l")
}


