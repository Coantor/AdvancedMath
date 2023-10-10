N = 10
z1 = 1:N
z2 = 1:N
for(k in 1:N){
  mat1 = matrix(0,nrow =k,ncol = k)
  mat2 = matrix(0,nrow =k,ncol = k)
  for(i in 1:k){
    for(j in 1:k){
      mat1[i,j] = max(i,j)
      mat2[i,j] = abs(i-j)
    }
  }
  z1[k] = det(mat1)
  z2[k] = det(mat2)
}
plot(z1,type = "b",cex = 1.5,pch = 16,ylim = c(-N,N))
text(z1,labels = abs(z),pos = 2,col = "blue")

plot(z2,log = "y")