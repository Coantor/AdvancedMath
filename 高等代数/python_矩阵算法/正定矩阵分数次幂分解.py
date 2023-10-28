import numpy as np
from numpy.linalg import * 

a = np.random.rand(4,4)
## 产生正定矩阵
a = a.T @ a

vals,vecs = eig(a)
print(vals)
print(vecs)



