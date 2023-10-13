import numpy as np
import copy
from itertools import combinations

## lambda矩阵本质是环上的矩阵
class LambdaMat:
    
    def __init__(self,m:int,n:int,poly_list:list) -> None:
        """
        第一个输入变量是矩阵的长度,第二个是矩阵的宽度,第三个是每一个向量
        """
        assert m > 0 and n > 0
        self.m = m
        self.n = n
        self.poly_list = list()
        if poly_list != None:
            assert len(poly_list) == m*n
            for i in range(m):
                for j in range(n):
                    self.poly_list.append(np.poly1d(poly_list[i*self.m + j]))
        pass

    def __str__(self):
        """
        调用print函数时,打印Lambda矩阵对象
        """
        print("###### 打印lambda矩阵 : %s行,%s列 ######"%(self.m,self.n))
        for i in range(self.m):
            for j in range(self.n):
                print(self.poly_list[i*self.m + j])
        print("")
        return "#"*40
    def Get(self,i:int,j:int):
        return self.poly_list[i*self.m + j]

    def dot(self,ano_Mat):
        """
        Lambda矩阵的乘法
        """
        assert self.n == ano_Mat.m
        p = LambdaMat(self.m,ano_Mat.n,poly_list=None)
        for i in range(p.m):
            for j in range(p.n):
                poly_tem  = np.poly1d(0)
                for k in range(self.n):
                    poly_tem += np.polymul(self.Get(i,k) ,ano_Mat.Get(k,j))
                p.poly_list.append(poly_tem)
        return p

    def add(self,ano_Mat):
        """
        Lambda矩阵的加法
        """
        assert self.m == ano_Mat.m and self.n == ano_Mat.n
        p = LambdaMat(self.m,self.n,poly_list=None)
        for i in range(p.m):
            for j in range(p.n):
                p.poly_list.append(np.polyadd(self.Get(i,j) , ano_Mat.Get(i,j)) )
        return p
    
    def sub(self,ano_Mat):
        """
        Lambda矩阵的sub加法
        """
        assert self.m == ano_Mat.m and self.n == ano_Mat.n
        p = LambdaMat(self.m,self.n,poly_list=None)
        for i in range(p.m):
            for j in range(p.n):
                p.poly_list.append(np.polysub(self.Get(i,j) , ano_Mat.Get(i,j)) )
        return p

    def submat(self,M1:list,N1:list):
        """
        返回矩阵的切片,M1下标,N1下标
        """
        assert len(M1) == len(N1)
        p = LambdaMat(m= len(M1),n = len(M1),poly_list=None)
        P_index = [i*self.m + j for i in M1 for j in N1] 
        p.poly_list = [self.poly_list[i] for i in P_index]
        return p

    

def Mat_to_LambdaMat(mat:np.array):
    """
    将数值矩阵转化为Lambda矩阵
    """
    assert mat.shape[0] == mat.shape[1]
    p = LambdaMat(mat.shape[0],mat.shape[1],poly_list=None)
    for i in range(mat.shape[0]):
        for j in range(mat.shape[1]):
            if i == j:
                p.poly_list.append(np.poly1d([1,-mat[i,j]]))
            else :
                p.poly_list.append(np.poly1d(-mat[i,j]))
    return p

def LambdaDet(lmd:LambdaMat):
    """
    计算多项式的行列式,利用第一行进行展开
    """
    assert lmd.m == lmd.n
    if(lmd.m == 1):
        return lmd.Get(0,0)
    elif(lmd.m == 2):
        return np.polysub(np.polymul(lmd.poly_list[0],lmd.poly_list[3]),np.polymul(lmd.poly_list[1],lmd.poly_list[2]))
    else:
        p_ans = np.poly1d(0)
        for i in range(lmd.m):
            if lmd.poly_list[i*lmd.m] == np.poly1d(0):
                continue
            x_index = set(list(range(lmd.m))).difference({i})
            mat_tem = lmd.submat(list(x_index),list(range(1,lmd.m)))
            p_ans = np.polyadd(p_ans,np.polymul((-1)**(i)* lmd.poly_list[i*lmd.m],LambdaDet(mat_tem)))
        return p_ans

def polyGCD(p1:np.poly1d,p2:np.poly1d):
    """
    计算最大公因数
    """
    p1_c = copy.copy(p1)
    p2_c = copy.copy(p2)
    r = np.poly1d(1)
    while(r != np.poly1d(0)):
        g,r = np.polydiv(p1_c,p2_c)
        p1_c = p2_c
        p2_c = r
    return p1_c
def LambdaDetFac(lmd:LambdaMat):
    """
    计算lambda矩阵的行列式因子
    """
    Fac = list() #记录最后一个行列式因子
    for i in range(lmd.m-1,-1,-1):
        
        if i == lmd.m-1:
            Fac.append(LambdaDet(lmd))
            continue
        ## 选择所有可能的下标
        index = list( combinations( list(range(lmd.m)),i+1) )
        Is_init = False
        Flag = True
        p_fac = np.poly1d(0)
        for j in index:
            for k in index:
                p_s = LambdaDet(lmd.submat(j,k))
                p_s = p_s/p_s.coef[0]
                ## 为0时,直接跳过
                ## 为常数项时,则最大公因式直接为1
                if p_s.order == 0 and np.abs(p_s.coef[0]) > 1e-5:
                    Fac.append(np.poly1d(1.0))
                    Flag = False
                    break
                ## 以防止当系数过小但是非0,而进行迭代计算
                elif p_s.order == 0 and np.abs(p_s.coef[0]) < 1e-5:
                    continue
                elif p_s.order > 0:
                    if Is_init == False:
                        p_fac = p_s
                        Is_init = True
                    elif Is_init == True:
                        p_fac = polyGCD(p_fac,p_s)
                        p_fac = p_fac/p_fac.coef[0]

            if Flag == False:
                break
        ## 最大公因式没有被记录过
        if Flag == True:
            a0 = p_fac.coef[0]
            Fac.append(p_fac/a0)
    ## 逆序输出
    return(Fac[::-1])
def LambdaInvariantFac(lmd:LambdaMat):
    """
    计算lambda矩阵的不变因子
    """
    DetFac = LambdaDetFac(lmd)
    InvriantFac = list()
    for i in range(lmd.m):
        if i == 0:
            InvriantFac.append(DetFac[0])
        else :
            g,r = np.polydiv(DetFac[i],DetFac[i-1])
            InvriantFac.append(g/g.coef[0])
    return(InvriantFac)

def FrobeniusStandard(lmd:LambdaMat):
    """
    计算矩阵的Frobenius标准型
    """
    assert lmd.m == lmd.n
    ## 计算出lambda矩阵的不变因子
    InvariantFac = LambdaInvariantFac(lmd)
    Froben_Standard = np.zeros((lmd.m,lmd.n))
    k = 0
    for i in range(lmd.m):
        deg = InvariantFac[i].order
        if deg == 1:
            Froben_Standard[k,k] = (-1)*InvariantFac[i].coef[1]
            k += 1
        elif deg > 1 :
            for j in range(deg-1):
                Froben_Standard[k,k+1] = 1
                k += 1
            ## 填写最后一行
            Froben_Standard[k,k-deg+1:k+1] = (-1)*InvariantFac[i].coef[::-1][:-1]
            k += 1
    return(Froben_Standard)