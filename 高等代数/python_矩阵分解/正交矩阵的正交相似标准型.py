import numpy as np
## 控制打印精度
np.set_printoptions(precision=4)


## 就算一个正交矩阵的正交相似标准型
def CalcNormStandard(Q:np.array):
    """
    返回矩阵的正交相似标准型和一组基
    """
    standard = np.zeros(Q.shape)
    Base = np.zeros(Q.shape)

    return(standard,Base)



w = np.random.rand(4)
a = np.eye(4,4) - 2 *np.outer(w,w)/np.dot(w,w)

Is = a.T @ a
Is[np.isclose(Is, 0, atol=1e-10)] = 0
print("验证a是一个正交矩阵:")
print(Is)



