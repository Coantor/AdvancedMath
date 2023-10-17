import numpy as np

def KroneckerDot(mat1:np.array,mat2:np.array):
    """
    计算矩阵的的Kronecker内积
    """
    mat3 = np.zeros((mat1.shape[0]*mat2.shape[0],mat1.shape[1]*mat2.shape[1]))
    for i in range(mat1.shape[0]):
        for j in range(mat1.shape[0]):
            k1 = i*mat2.shape[0]
            k2 = (i+1)*mat2.shape[0]
            l1 = j*mat2.shape[1]
            l2 = (j+1)*mat2.shape[1]
            mat3[k1:k2,l1:l2] = mat1[i,j]*mat2
    return mat3

A = np.array([1,2,3,4]).reshape((2,2))
B = np.random.rand(4,4)
C =KroneckerDot(A,B)

## 验证A,B,C特征值的关系
eigvals1 = np.linalg.eigvals(A)
eigvals2 = np.linalg.eigvals(B)
eigvals3 = np.linalg.eigvals(C)

np.set_printoptions(precision=4)

## 保存两个特征值的笛卡尔积
eigval_AB = [i*j for i in eigvals1 for j in eigvals2]
print("两个矩阵特征值的笛卡尔积 ——> 乘法: ")
print(np.sort(eigval_AB))
print("C矩阵的特征值:")
print(np.sort(eigvals3))
