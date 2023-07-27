### 我们知道任何一个可导的函数,如果某一点导数大于0,
### 并不能保证其函数在一个充分小的领域内单调.只能得到其函数值的大小关系
### 出现这个问题的根本原因是导函数未必连续.因此下面给出一个反列

y_f <- function(x){
  y = x*x*sin(1/x) + x
}
## 自适应采样函数
adaptive_x <- function(from ,to,key_point ){
  h = (to-from)/100
  x = seq(from,to,len = 1400)
  x_ada = purrr::map(key_point,~ seq(.x-h,.x+h,len = 60))
  x = sort(c(x,unlist(x_ada)))
}

par(mfrow = c(1,2))
x =  adaptive_x(-0.2,0.2,0)
y = y_f(x)

plot(x,y,type = "l",main = "单调函数经典反列")
abline(a = 0,b= 1,col = "red",lty = 2)

### 局部放大
y_delta  = y - x
plot(x,y_delta,type = "l",main = "局部放大版")
y_s = x * x
lines(x,y_s,col = "blue",lty = 2)
lines(x,-y_s,col = "blue",lty = 2)
abline(a = 0,b = 0,col = "red",lty = 3)
