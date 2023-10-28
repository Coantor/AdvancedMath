import numpy as np

a = np.round(np.random.rand(4,4)*10,1)
np.set_printoptions(precision=4)
## 再做QR分解,使用Schmidt正交化进行

def SchmidtQR(a:np.array):
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

if __name__ == "__main__":
    (Q,R) = SchmidtQR(a)
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





    
    

