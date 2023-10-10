library(plotly)
library(plot3D)
## logb(a^2*cos(x) + b^2 * sin(x))
f1 <- function(x,a,b){
  if(a == 0 & b == 0){
    print("条件不满足 a^2 + b ^ 2 != 0")
    break;
  }
  
  return(logb(a^2*cos(x) + b^2 * sin(x)))
}

a = seq(0.1,2,len = 20)
b = seq(0.1,2,len = 20)

z = matrix(0,nrow = length(a),ncol = length(b))
for(i in 1:length(a)){
  for(j in 1:length(b))
  {
    z[i,j] = integrate(\(x){f1(x,a = a[i],b = b[j])},0,pi/2)$value
  }
}

d = mesh(a,b)
a = d$x
b = d$y

plot_ly(x = ~a,y = ~b,z = ~z,type = "surface")

## f2 = ln(|a^2 - sin(x)^2|)
f2 <- function(x,a){
  return(logb(abs(a^2  - sin(x)^2)))
}
a = seq(0.1,2,len = 100)
z = a
for(j in 1:length(b)){
  z[j] = integrate(\(x){f2( x, a[j] )},0,pi/2)$value
}
plot_ly(x = ~a,y = ~ z,linetype = "dash")

## f3 = logb(1-2*a*cos(x)+a^2)
f3 <- function(x,a){
  return(logb(1-2*a*cos(x)+a^2))
}
a = seq(0.001,2,len = 100)
z = a
for(j in 1:length(b)){
  z[j] = integrate(\(x){f3( x, a[j] )},0,pi/2)$value
}
plot_ly(x = ~a,y = ~ z,linetype = "dash")
