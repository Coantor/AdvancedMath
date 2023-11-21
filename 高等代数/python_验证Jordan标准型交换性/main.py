import numpy as np

## 得到一个Jordan标准型
m = 10
J = np.zeros((m,m))
## 行选择0到倒数第二行,列选择1到最后一列
J[0:-1,1:] = np.eye(m-1,m-1)

A = np.zeros((m,m))
for i in range(1,m):
    a = np.random.randint(-10,10)
    for j in range(i,m):
        A[j-i,j] = a

print("打印矩阵A:")
print(A)
print("-"*40)
print("打印JA - AJ")
print(J @ A - A @ J)