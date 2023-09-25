## 绘制多元函数 f = (x^2*y^2)/(x^3 + y^3)

f = function(theta){
  v = cos(theta)^2 * sin(theta)^2/(cos(theta)^3 + sin(theta)^3)
  return(v)
}

x = seq(0,2*pi,len = 1000)
y = f(x)
plot(x,y,type = "l",lwd = 2,main = "判断是否无界")
abline(v = 0.75*pi,col = "red",lwd = 0.4)

