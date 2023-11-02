import numpy as np
from DecomSemiP import cal_matrix_k

## 控制numpy打印的精度
np.set_printoptions(precision=4)

## 对任意一个矩阵进行极分解
a = np.round(np.random.rand(4,4) * 10,1)
c = cal_matrix_k(a.T @ a)
Q = np.linalg.inv(a.T) @ c

print("a = Q * c ,其中Q 为正交矩阵,c是半正定矩阵")
print(a)
print("-"*40)
print(Q)
print("-"*40)
I = Q.T @ Q
I[np.isclose(I, 0, atol=1e-10)] = 0
print(I)
print("-"*40)
print(c)
print("-"*40)
print("判断c是否半正定矩阵")
print([np.linalg.det(c[:i,:i]) for i in range(1,a.shape[0]+1)])