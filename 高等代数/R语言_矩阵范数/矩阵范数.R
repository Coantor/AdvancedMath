## 第一类矩阵范数 induced norm
A = matrix(data = rnorm(9,0,1),3,3)

print("p = 1对应的诱导范数,maximum absolute column sum")
print(norm(A,type = "1"))

print("p = 2对应的诱导范数, the largest singular value (svd) of x.")
print(norm(A,type = "2"))

print("p = +infinity 对应的诱导范数, maximum absolute row sum")
print(norm(A,type = "i"))

## 第二类矩阵范数,元素形式范数（entrywise norm）
print(" Frobenius norm, the Euclidean norm of x treated as if it were a vector")
print(norm(A,type = "f"))

print(" Maximum Modulus of all the elements")
print(norm(A,type = "M"))

