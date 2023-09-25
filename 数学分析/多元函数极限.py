import matplotlib.pyplot as plt
import numpy as np

ax1 = plt.axes(projection='3d')
## 定义函数
def  f(x1,y1):
  return (x1 ** 2 * y1 ** 2)/(x1 ** 3 + y1 ** 3)

x = np.linspace(1e-4,1,1000)
y = np.linspace(1e-4,1,1000)

X, Y = np.meshgrid(x, y)
Z = np.zeros(X.shape)

for i in range(Z.shape[0]):
  for j in range(Z.shape[1]):
    Z[i,j] = f(X[i,j],Y[i,j])

plt.figure()
ax1.plot_surface(X,Y,Z,cmap='rainbow')
plt.show()
## 下面绘制theta的函数图像
def g(theta):
  x1 = np.sin(theta)
  x2 = np.cos(theta)
  return (x1**2 * x2**2)/(x1**3 + x2 ** 3)

plt.figure()
X = np.linspace(0,2*np.pi,1000)
Y = g(X)
plt.plot(X,Y)
plt.show()