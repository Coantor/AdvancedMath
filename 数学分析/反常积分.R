#### 反常积分收敛,但是无穷远处极限不存在
f_sin_x6 <- function(x){
  f = x/(1 + sin(x)^2 * x^6)
}
## 自适应采样函数
adaptive_x <- function(from ,to,key_point ){
  h = (to-from)/400
  x = seq(from,to,len = 500)
  x_ada = purrr::map(key_point,~ seq(.x-h,.x+h,len = 200))
  x = sort(c(x,unlist(x_ada)))
}

#### 绘制第一组函数
par(mfrow = c(1,1))
x = adaptive_x(0,2.5 * pi,c(pi,2*pi))
y = f_sin_x6(x)
plot(x,y,type = "l",main = "反常积分收敛,但是无穷远处极限不存在")
abline(a = 0,b =1,col = "red")
abline(a = 0,b = 0,col = "black",lty = 2)
legend("topleft",inset = 0.05,legend = 
         expression(paste("y = ",frac(x,1+sin(x)^2 * x^6))))

f_sin_x4 <- function(x){
  f = x/(1 + sin(x)^2 * x^4)
}

#### 绘制第二组函数

x = adaptive_x(0,2.5 * pi,c(pi,2*pi))
y = f_sin_x4(x)
plot(x,y,type = "l",main = "反常积分不收敛,和前一张图片差距非常小")
abline(a = 0,b =1,col = "red")
abline(a = 0,b = 0,col = "black",lty = 2)
legend("topleft",inset = 0.05,legend = 
         expression(paste("y = ",frac(x,1+sin(x)^2 * x^4))))
