import aifc
import numpy as np
import copy

a = np.round(np.random.rand(4,4)*10,1)
a = np.array([[1,1,1],[2,3,1],[2,1,-5]])
np.set_printoptions(precision=4)

def SchmidtQR(a:np.array) -> tuple:
    """
    使用Schmidt变换进行QR分解
    """
    assert a.shape[0] == a.shape[1]
    Q = np.zeros(a.shape)
    R = np.zeros(a.shape)
    for i in range(a.shape[0]):
        ## 对a的第i列做Schmidt正交化
        if i == 0:
            Q[:,0] = a[:,0]
            R[0,0] = 1
        else:
            Q[:,i] = a[:,i]
            
            for j in range(i):
                R[j,i] = np.dot(a[:,i],Q[:,j])/ np.dot(Q[:,j],Q[:,j])
                Q[:,i] = Q[:,i] - R[j,i]* Q[:,j]
            R[i,i] = 1
    norms = np.array([np.linalg.norm(Q[:,i]) for i in range(a.shape[0])])
    ## 每一列除以一个元素
    Q = Q/norms
    ## 每一行除以一个元素
    R = R/(1/norms)[:,None]
    return(Q,R)

def Householder(w:np.array) -> np.array:
    """
    输入坐标反射的方向,给出反射变换,即正交变换
    """
    assert len(w.shape) == 1
    if np.fabs(np.dot(w,w)) < 1e-10:
        print("向量模长接近0")
        pass
    N_ = w.shape[0]
    Q = np.eye(N_,N_) - 2 * np.outer(w,w)/np.dot(w,w)
    return(Q)


def HouseholderQR(a:np.array) ->tuple :
    """
    使用HouseHolder变换进行QR分解
    """
    assert a.shape[0] == a.shape[1]
    n = a.shape[1]  # 取出矩阵的规格
    Q = np.eye(n)  # 获得正交矩阵
    R = np.zeros((n, n))  # 最终的上三角矩阵
    for i in range(n - 1):
        x = a[i:, i]  # 取出第i列,逐渐变小的矩阵
        y = np.zeros(n - i);
        y[0] = np.sqrt(np.dot(x, x))
        Qs = Householder(x-y)  # 就是Qs矩阵
        Q_full = np.eye(n)
        Q_full[i:,i:] = Qs
        Q = Q_full @ Q
        R = Q @ a

    # 最终矩阵需要转置
    return(Q.T,R)

if __name__ == "__main__":
    (Q,R) = HouseholderQR(a)
    print("原始矩阵")
    print(a)
    print(Q @ R)
    print("-" * 40)
    print("正交矩阵:")
    print(Q)
    print("-" * 40)
    I = Q.T @ Q
    I[np.isclose(I, 0, atol=1e-10)] = 0
    print(I)
    print("-" * 40)
    print("上三角矩阵:")
    print(R)