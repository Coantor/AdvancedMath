source("多项式类.R")  #产生一个多项式类

### 代码测试

p1 = Poly$new(c(1,2,3))
p2 = Poly$new(c(4,5,123,90))
## 乘法
p3 = mutiply(p1,p2)
print(p3)
## 加法
p4 = plus(p2,p1)
print(p4)
## 减法
p5 = mins(p1,p2)
print(p5)

## 带余除法
Q = division(p3,p1)
print(Q[[1]])

print(Q[[2]])

## 最大公因式,结果每一个问题
q1 = Poly$new(c(-1,2,-1,-1,1))
q2 = Poly$new(c(1,-2,0,1))
rx = Max_CommonFactor(q1,q2)
