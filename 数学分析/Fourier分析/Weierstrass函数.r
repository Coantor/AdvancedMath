## 处处连续处处不可微分的函数
N = 10
a <<- 0.8
b <<- 10 #保证ab > 1 + 3/2*pi
Weierstrass <- function(x,n){
  v = purrr::map_dbl(x,\(x){ sum(a^n * sin(b^n * pi * x))})
  return(v)
}
par(mfrow = c(1,1))
curve(expr = Weierstrass(x,1:N),from = 0,to = 1,n = 1000,lwd = 1,
      ylab = "Weierstrass函数",main = "处处连续处处不可导")

### 提高绘图精度 ====
png(file = "Weierstrass函数.png", width = 1200, height = 600)
p = curve(expr = Weierstrass(x,1:N),from = 0,to = 1,n = 1000,lwd = 1,
      ylab = "Weierstrass函数",main = "处处连续处处不可导")
dev.off( )
