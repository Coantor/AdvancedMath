source("lamda矩阵.R")
N = 3
k = 2
x = ceiling(runif(k*N*N,0,5))
dim(x) = c(k,N*N)
x[2,1] = 0
Lm = LambdaMatrix$new(x,N,N) #3行3列的矩阵
print(Lm)
## 保存到文件夹
Lm$to_file("LambdaMatrix.txt")

## 计算行列式
Lambda_det(Lm)

### 给出实列,高代绿皮书上面的问题P305
x = matrix(0,2,9)
x[2,c(1,5,9)] = 1
x[1,] = c(0,-1,1,-3,2,0,1,-1,1)

Lm = LambdaMatrix$new(x,3,3)
Lambda_det(Lm)
