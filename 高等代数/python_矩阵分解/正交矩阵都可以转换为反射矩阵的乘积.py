"""
此脚本主要用于实现一个定理 正交矩阵可以由不超过n个反射矩阵的乘积表示
定理的构造性证明由本人给出,下面是验证性的过程
"""
#%%
import numpy as np
from NormStandard import *
from QR import *
import matplotlib.pyplot as plt

#print(Normal)
#%% 测试误差
def TestResidue()->None:
    residue = list()
    m = 100
    for i in range(m):
        np.random.seed(i)
        a = np.round(np.random.rand(N,N)*10,0)
        a = np.linalg.qr(a)[0]
        (Normal,Base) = CalcNormStandard(a)
        residue.append(np.sum(np.fabs(Base @ Normal @ Base.T - a)))
    plt.plot(residue)
    plt.show()
    plt.title("residue with items")
    plt.close()
    pass


#%% 
def TestTwoDem() :
    """
    针对二维情况写一个demo
    """
    theta = np.random.rand(1)[0]

    a = np.array([[np.cos(theta),-np.sin(theta)],[np.sin(theta),np.cos(theta)]])

    v1 = np.array([1,0])
    v2 = np.array([0,1])
    u1 = np.array([np.cos(theta),np.sin(theta)])
    u2 = np.array([np.cos(theta+np.pi/2),np.sin(theta+np.pi/2)])

    H1 = Householder(u1 - v2)
    H2 = Householder(u1 - u2)
    print(a)
    print(H2 @ H1)
    pass

def FacReflectMat(Normal:np.array,Base:np.array):
    """
    主函数,将正交矩阵转化为反射矩阵的乘积
    Step1 :将正交矩阵转化为正交相似标准型
    Step2 :将正交相似标准型转化为反射矩阵的乘积
    Step3 :对第二步得到的反射矩阵拉回到正常的基上
    """
    assert Normal.shape == Base.shape
    i = 0
    n = Normal.shape[0]
    Reflect = list() #返回最后的反射矩阵列表
    while i < n:
        if np.fabs(Normal[i,i] - 1) < 1e-7:
            i += 1
            continue
        elif np.fabs(Normal[i,i] + 1) < 1e-7:
            Ref = np.eye(n)
            Ref[i,i] = -1
            Reflect.append(Base @ Ref @ Base.T)
            i += 1
        else:
            """
            反解出此时的theta角度
            """
            theta = np.arccos(Normal[i,i])
            v2 = np.array([0,1])
            u1 = np.array([np.cos(theta),np.sin(theta)])
            u2 = np.array([np.cos(theta+np.pi/2),np.sin(theta+np.pi/2)])

            H1 = Householder(u1 - v2)
            H2 = Householder(u1 - u2)
            Ref1 = np.eye(n)
            Ref2 = np.eye(n)
            Ref1[i:i+2,i:i+2] = H2
            Ref2[i:i+2,i:i+2] = H1
            Reflect.append(Base @ Ref1 @ Base.T)

            Reflect.append(Base @ Ref2 @ Base.T)

            i+= 2
    return(Reflect)



#%% 主程序
if __name__ == "__main__":
    N = 6
    np.random.seed(123)
    a = np.round(np.random.rand(N,N)*10,0)
    a = np.linalg.qr(a)[0]

    ## 计算其正交相似标准型
    (Normal,Base) = CalcNormStandard(a)
    Reflect = FacReflectMat(Normal,Base)
    

    s = np.eye(N)
    for i in range(len(Reflect)):
        vals = np.linalg.eigvals(Reflect[i])
        print("打印特征值:")
        print(vals)
        s = s @ Reflect[i]
    print("-"*40)
    print(a)
    print("-"*40)
    print(s)



        
