### 正定矩阵的LU分解

##### 生成正定矩阵 =====
a = runif(3*4,0,10)
## S3面向对象系统的特性
attr(a,"dim") <- c(4,3)
## 使用A' * A ,从而A是3行3列的矩阵
A = crossprod(a)

##### 进行Cholesky分解 =====
## 生成上三角矩阵
U = matrix(0,nrow = nrow(A),ncol = ncol(A))
for(i in 1:nrow(L)){
  for(j in i:nrow(L)){
    if(j == i){
      U[j,j] = sqrt(A[i,i] - crossprod(U[1:(i-1),i]))
    }else {
      
    }
  }
}



