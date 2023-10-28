import numpy as np

def cal_adj(a:np.array):
    assert a.shape[0] == a.shape[1]
    n = a.shape[0]
    b = np.zeros((n,n))
    for i in range(n):
        x_index = list(range(n))
        x_index.remove(i)
        for j in range(n):
            y_index = list(range(n))
            y_index.remove(j)
            ## 这是一个比较妙的处理,从numpy的array选出子矩阵,先选横的向量,再选列的位置
            b[i,j] = (-1)**(i+j)*np.linalg.det(a[x_index][:,y_index])
    return(b.T)

a = np.random.rand(4,4)
print(a)
print("-"*40)
a_adj = cal_adj(a)
print("矩阵伴随为:")
print(a_adj)
print("-"*40)
d = a_adj @ a
d[np.isclose(d, 0, atol=1e-10)] = 0
print(d/np.linalg.det(a))
print("-"*40)