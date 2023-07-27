### 第一个迭代函数 x_(n+1)= sqrt(x_n + a),其中a为参数
a <<- 1 #设置为全局变量
### 求解不动点
z = polyroot(c(-1,-1,1))
z = z[near(Im(z),0) & Re(z) > 0] #很复杂的操作
z = Re(z)
par(mfrow = c(2,2))

## 第一张图, f(x) 与 x 的关系
f <- function(x){
  sqrt(x + a)
}
x = seq(0,a*4,len = 20)
plot(x,f(x),type = "l",
     main =  expression(paste(x[n+1],"=",sqrt(x[n]+a))))
abline(a = 0,b = 1,col = "red")


## 第二幅图, {x[n]}的迭代过程
x[i] = runif(1)
for(i in 2:length(x)){
  x[i] = f(x[i-1])
}
plot(x,ylim = c(x[1],2),type="b",main = "单调收敛")
abline(a = z,b = 0,col= "red")

### 下面绘制第二组迭代函数,此时迭代序列是分奇偶单调
### x[n+1] = 1 + 1/x[n]

f2 <- function(x){
  return(1 + 1/x)
}

## 绘制第二组 函数与 x的关系
x = seq(0.2,4,len = 50)
plot(x,f2(x),type = "l",ylim = c(0,5),main = expression(paste(x[n+1],"=",1 + frac(1,x[n]))))
abline(a = 0,b = 1,col = "red")


## 绘制第二组迭代序列

y = 1:20
y[1] = runif(1)/2 + 0.5
for(i in 2:length(y)){
  y[i] = 1 + 1/y[i-1]
}
plot(y,type="n",main = "子列分奇偶收敛")
points(seq(1,length(y),2),y[seq(1,length(y),2)],col = "blue",pch = 16,type = "b")
points(seq(2,length(y),2),y[seq(2,length(y),2)],col = "darkgreen",pch = 16,type= "b")
abline(a = z,b = 0,col= "red")



