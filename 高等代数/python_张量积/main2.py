import numpy as np
## 测试第二种 phi(X) = AXB

def CalMat(A:np.array,B:np.array):
    """
    计算mat 在 \phi(X) 下的表示矩阵
    """
    assert A.shape[0] == A.shape[1]
    _N = A.shape[0]
    res = np.zeros((_N*_N,_N*_N))
    for i in range(_N):
        for j in range(_N):
            E = np.zeros((_N,_N))
            E[i,j] = 1
            Y = A @ E @ B
            res[i*_N + j,] = Y.flatten()
    return res

def CalMat2(A:np.array,B:np.array):
    """
    计算mat 在 \phi(X) = AX - XB 下的表示矩阵
    """
    assert A.shape[0] == A.shape[1]
    _N = A.shape[0]
    res = np.zeros((_N*_N,_N*_N))
    for i in range(_N):
        for j in range(_N):
            E = np.zeros((_N,_N))
            E[i,j] = 1
            Y = A @ E - E @ B
            res[i*_N + j,] = Y.flatten()
    return res
A =np.eye(3,3)
B = np.random.rand(3,3)

C = CalMat(A,B)
D = CalMat2(A,B)
eigvals1 = np.linalg.eigvals(A)
eigvals2 = np.linalg.eigvals(B)
eigvals3 = np.linalg.eigvals(C)
eigvals4 = np.linalg.eigvals(D)

np.set_printoptions(precision=4)

## 保存两个特征值的笛卡尔积
eigval_AB = [i*j for i in eigvals1 for j in eigvals2]
print("两个矩阵特征值的笛卡尔积 ——> 乘法: ")
print(np.sort(eigval_AB))
print("C矩阵的特征值:")
print(np.sort(eigvals3))

eigval_A_B = [i-j for i in eigvals1 for j in eigvals2]
print("两个矩阵特征值的笛卡尔积 ——> 减法: ")
print(np.sort(eigval_A_B))
print("D矩阵的特征值:")
print(np.sort(eigvals4))