curve(logb(tan(x/2)),0.01,2,main = "csc(x)原函数",ylim = c(-5,1),ylab = "y")
curve(logb(-1/tan(x) + 1/sin(x)) + 0.2,0.01,2,add = T,col = "red")
curve(-logb(1/tan(x) + 1/sin(x)) + 0.4,0.01,2,add = T,col = "blue")