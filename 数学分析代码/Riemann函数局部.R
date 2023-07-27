#### 此脚本用于绘制黎曼函数,当然一定是局部版本.
#### 计算机还无法绘制完整的Riemann函数

# 核心函数用C++写,用来加速
Rcpp::sourceCpp("Max_CommonFactor.cpp")

## 用R本身写的函数
r_Max_CommonFactor <- function(a,b){
  if( a<= 0 || b <= 0){
    return (-1)
  }
  while( b !=0 ){ # 使用欧几里在辗转相除法
    c = a %% b
    a = b
    b = c
  }
  return(a)
}


#### 核心代码流程
N = 400 #划分
M = 400000 #待采样的点
x = 1:M
y = x

par(mfrow =c(1,1))
# 寻找需要绘制的有理点
count = 0 #计数指标
for(i in 1:N){
  for(j in (i+1):N){
    if(Max_CommonFactor(i,j) == 1){
      count = count + 1
      x[count] = i/j
      y[count] = 1/j
      
    }
  }
}
x = x[1:count]
y = y[1:count]

plot(x,y,type="p",pch = 16,cex = 0.4,main = "Riemann函数")


