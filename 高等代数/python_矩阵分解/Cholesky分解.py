import numpy as np

a = np.random.rand(4,4)
a = a.T @ a

C = np.linalg.cholesky(a)
print(C)
print(a)