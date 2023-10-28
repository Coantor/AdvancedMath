from Polynomial import *
import numpy as np
import pandas as pd

np.seterr(divide='ignore',invalid='ignore')

if __name__ == "__main__":
    p1 = Mat_to_LambdaMat(np.eye(4))
    p2 = Mat_to_LambdaMat(np.array([[0,1,-1],[3,-2,0],[-1,1,-1]]))
    p3 = Mat_to_LambdaMat(np.array([[1,2,0],[0,2,0],[-2,-2,1]]))
    p4 = Mat_to_LambdaMat(np.array([[0,1,0],[0,0,0],[0,0,0]]))

    ## 给出有理标准型
    p5 = Mat_to_LambdaMat(np.array([[0,1,0,0],[0,0,1,0],[0,0,0,0],[0,0,0,1]]))
    p6 = Mat_to_LambdaMat(np.array([[0,1,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,1]]))

    a = pd.read_table("mat.txt",index_col=None,header=None,sep=" ").values
    print(a)
    p7 = Mat_to_LambdaMat(a)

    ## 计算矩阵的不变因子
    print("p1矩阵对应lambda矩阵的行列式因子组")
    print(LambdaDetFac(p1))
    print("")
    print("p1矩阵对应lambda矩阵的不变因子组")
    print(LambdaInvariantFac(p1))
    print("")
    print("p2矩阵对应lambda矩阵的行列式因子组")
    print(LambdaDetFac(p2))
    print("")
    print("p2矩阵对应lambda矩阵的不变因子组")
    print(LambdaInvariantFac(p2))
    print("")
    print("p3矩阵对应lambda矩阵的行列式因子组")
    print(LambdaDetFac(p3))
    print("")
    print("p3矩阵对应lambda矩阵的不变因子组")
    print(LambdaInvariantFac(p3))
    print("")
    print("p4矩阵对应lambda矩阵的行列式因子组")
    print(LambdaDetFac(p4))
    print("")
    print("p4矩阵对应lambda矩阵的不变因子组")
    print(LambdaInvariantFac(p4))
    print("")
    print("p5矩阵对应lambda矩阵的行列式因子组")
    print(LambdaDetFac(p5))
    print("")
    print("p5矩阵对应lambda矩阵的不变因子组")
    print(LambdaInvariantFac(p5))
    print("")
    print("p6矩阵对应lambda矩阵的行列式因子组")
    print(LambdaDetFac(p6))
    print("")
    print("p6矩阵对应lambda矩阵的不变因子组")
    print(LambdaInvariantFac(p6))
    print(np.array([[0,1,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,1]]))
    print("")
    print(FrobeniusStandard(p6))
    print("p7矩阵对应的Frobenuis标准型")
    print(FrobeniusStandard(p7))
    print(LambdaDetFac(p7))
