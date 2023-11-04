"""
此脚本主要用于实现一个定理 正交矩阵可以由不超过n个反射矩阵的乘积表示
定理的构造性证明由本人给出,下面是验证性的过程
"""
#%%
import numpy as np
from NormStandard import *
from QR import *
import matplotlib.pyplot as plt
#%%  生成一个正交矩阵
N = 20
np.random.seed(123)
a = np.round(np.random.rand(N,N)*10,0)
a = np.linalg.qr(a)[0]

## 计算其正交相似标准型
(Normal,Base) = CalcNormStandard(a)
#print(Base @ Normal @ Base.T - a)
print("-"*60)
#print(Normal)
#%% 测试误差
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


#%% 针对二维情况写一个demo
# theta = np.pi/4
# a = np.array([[np.cos(theta),-np.sin(theta)],[np.sin(theta),np.cos(theta)]])
# v = np.array([np.cos(theta),np.sin(theta)])

# H1 = Householder(v-np.array([1,0]))
# H2 = np.array(v - np.array([np.cos(theta+np.pi/2),np.sin(theta+np.pi/2)]))
# print(H2*H1)
# print(a)