## 函数列的性质
Dirichlet <- function(n,x){
  p = n + 1/2
  q = 1/2
  return(sin(p*x)/(2*sin(q*x)))
}
z = as.hexmode(ceiling(sort(runif(300,min = 0,max = 16^3))))
curve(expr = Dirichlet(20,x),from = -3,to = 3,n = 10000,
      ylab = "y",main = "Dirichlet核函数")
for(i in rev(seq(2,16,len = 9))){
  curve(expr = Dirichlet(i,x),add = T,col = z[i],n = 10000)
}

##Fejer核函数
Fejer <- function(n,x){
  p = n/2
  q = 1/2
  return( (sin(p*x)/sin(q*x))^2 /(n*pi) )
}
curve(expr = Fejer(20,x),from = -3,to = 3,n = 10000,
      ylab = "y",main = "Fejer核函数")
for(i in rev(seq(2,16,len = 9))){
  curve(expr = Fejer(i,x),add = T,col = z[i],n = 10000)
}
