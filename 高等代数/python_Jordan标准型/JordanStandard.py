import numpy as np
from collections import Counter

Error = 1e-8

## 为了防止计算特征值出现误差这里采用近似计算的方法
def Filter_val(eigvals:np.array):
    for i in range(eigvals.shape[0]):
        if np.abs(int(eigvals[i]) - eigvals[i]) < Error:
            eigvals[i] =  int(eigvals[i])
    pass
## 秩逐渐减少
def Calc_Rank(a:np.array,n:int):
    rank_a = list()
    b = np.eye(a.shape[0])
    for i in range(n+1):
        r = np.linalg.matrix_rank(b) #计算矩阵的秩
        if i >0 and r == rank_a[-1]:
            rank_a.append(r)
            break
        rank_a.append(r)
        b = np.dot(a,b)
        
    return rank_a


## 计算n阶约当块的个数,计算公式为 (R((A)^[n-1])+R((A)^[n+1]) -2*R((A)^[n]))
def Calc_Jordan_NUM(a:np.array,lambda_val:np.float_,n:int):
    rank_a = Calc_Rank(lambda_val * np.ones(a.shape) - a,n)
    Jordan_unit = dict()
    for i in range(1,len(rank_a)-1):
        Jordan_num = rank_a[i-1] + rank_a[i+1] - 2 * rank_a[i]
        if( Jordan_num != 0):
            Jordan_unit[i] = Jordan_num
    return Jordan_unit

## 获取Jordan块
def Get_Jordan_chunck(lambda_val:np.float_,n:int):
    Jordan_chunck = np.zeros((n,n))
    for i in range(n):
        Jordan_chunck[i,i] = lambda_val
        if(i < n-1):
            Jordan_chunck[i,i+1] = 1
    return Jordan_chunck

def Calc_JordanStandard(a:np.array):
    eigvals = np.linalg.eigvals(a) #QR
    Filter_val(eigvals)
    ## 统计数字
    Counter_eigvals = Counter(eigvals)
    Jordan_a = np.zeros(a.shape)
    ## 计算Jordan标准型
    k = 0
    ## key_eig_val 特征值,Counter_eigvals[key_eig_val]特征值个数
    for key_eig_val in Counter_eigvals:
        if(Counter_eigvals[key_eig_val]) == 1:
            Jordan_a[k,k] = key_eig_val
            k += 1 
        else :
            ## 计算此时的不同阶数的Jordan块个数
            ## key -- 阶数 value -- 个数
            Jordan_unit = Calc_Jordan_NUM(a,key_eig_val,a.shape[0])
            for key in Jordan_unit:
                for j in range(Jordan_unit[key]):
                    ## 通过Jordan_chunck函数返回Jordan块
                    ## Jordan_chunck(特征值,阶数)
                    Jordan_a[k:k+key,k:k+key] = Get_Jordan_chunck(key_eig_val,key)
                    k += key
    return(Jordan_a)