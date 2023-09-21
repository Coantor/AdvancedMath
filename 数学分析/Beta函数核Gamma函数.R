## 此脚本主要绘制Beta函数与gamma函数
## gamma(x) = int_{t = 0}^{t = + \infity} t^(x-1)exp(-t)dt

gamma_fun <- function(x){
  v = purrr::map_dbl(x, \(y)integrate(f = \(t){t^(y-1)*exp(-t)},lower = 0,upper = Inf)$value)
  return(v)
}
curve(expr = gamma_fun,from = 0.2,to=4,main = "gamma函数",ylab = "y")


x <- seq(0.03,1, length.out = 40)
y <- x
f <- function(a, b) { r <- beta(a,b) }
z <- outer(x, y, f)
z[is.na(z)] <- 1
op <- par(bg = "white")
persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue",main = "beta函数")
