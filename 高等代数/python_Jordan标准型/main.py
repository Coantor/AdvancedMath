from JordanStandard import Calc_JordanStandard
import pandas as pd
import numpy as np
## 测试1
a = pd.read_table("mat.txt",index_col=None,header=None,sep=" ").values

if __name__ == "__main__":
    a =  np.outer([1,-1,1,-1],[1,1,1,1])
    Jordan_a = Calc_JordanStandard(a)
    print(a)
    print("a的Jordan标准型为:")
    print(Jordan_a)

    # ## 测试2
    # a = np.random.rand(6,3)
    # a = np.dot(a,a.T) #秩一般来说都是3,[0,0,0][lambda1,lambda2,lambda3]
    # #print(a)
    # Jordan_a = Calc_JordanStandard(a)
    # print("a的Jordan标准型为:")
    # np.set_printoptions(precision=4)
    # print(Jordan_a)
