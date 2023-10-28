from scipy.integrate import quad
import numpy as np
import matplotlib.pyplot as plt

## 定义含参量积分
def F1(x,a):
    b = np.log(1 - 2*a*np.cos(x) + a**2)
    return b

def F2(x,a,b):
    b = np.log(a**2 * np.sin(x) + b ** 2* np.cos(x))
    return b
y = list()
x = np.linspace(0,8)
for i in x:
    d1, err = quad(F1, 0, np.pi,i)
    y.append(d1)

plt.plot(x,y)
plt.show()
