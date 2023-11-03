import numpy as np
## 控制打印精度
np.set_printoptions(precision=3)
np.random.seed(123)

## 就算一个正规矩阵的正交相似标准型
def CalcNormStandard(Q:np.array):
    """
    返回矩阵的正交相似标准型和一组基
    """
    assert Q.shape[0] == Q.shape[1]
    standard = np.zeros(Q.shape)
    Base = np.zeros(Q.shape)
    (vals,vecs) = np.linalg.eig(Q)
    #breakpoint()
    # vals = [i for i in vals]
    i = 0
    while(i < Q.shape[0]):
        if np.fabs(np.imag(vals[i]))<1e-6:
            standard[i,i] = np.real(val=vals[i])
            Base[:,i] = np.real(vecs[:,i])
            i += 1
        else:
            ## 此时出现复数根
            if np.fabs(np.real(vals[i] - vals[i+1])) < 1e-5:
                a = np.real(vals[i])
                b = np.imag(vals[i])
                standard[i,i] = a
                standard[i+1,i+1] = a
                standard[i,i+1] = -b
                standard[i+1,i] = b
                alpha1 = np.real(vecs[:,i])
                alpha2 = np.imag(vecs[:,(i+1)])
                Base[:,i] = alpha1 
                Base[:,(i+1)] = alpha2
                
                # print("this " + str(i))
                # print(vecs[:,i])
                # print(vecs[:,i+1])
                # print(Q @ alpha1 - a*alpha1 - b * alpha2)
                # print(Q @ alpha2+ b*alpha1 -a * alpha2)
                i += 2
            else:
                print("出错,需要查看")

    return(standard,Base)


w = np.random.rand(4)
a = np.eye(4,4) - 2 *np.outer(w,w)/np.dot(w,w)

b = np.linalg.qr(np.random.rand(4,4))[0]

(Normal,Base) = CalcNormStandard(b)
print(Normal)
print(Base @ Normal @ np.linalg.inv(Base))
print(b)



