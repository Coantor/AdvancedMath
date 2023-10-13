from  matplotlib import pyplot as plt
import numpy as np

## 定义欧拉函数
def Euler_function(n:int) -> int:
    a = [i for i in range(1,n+1) if np.gcd(i,n) == 1 ]
    return(len(a))

N = list(range(1,1001))

## 向量化函数
Euler_function_vec = np.vectorize(Euler_function)
PHI_N = Euler_function_vec(N)

plt.plot(N,PHI_N)
plt.show()

