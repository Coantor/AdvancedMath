import numpy as np
import matplotlib.pyplot as plt

np.random.seed(10)

a = np.array([[1,0,-1],[0,1,-1],[0,0,1]])
d = a @ np.diag([0,0,1]) @ np.linalg.inv(a)
#print(d)
#print(d @ d)

N = 10
## 下面是二维的情况:
base = np.array([[1,-1],[0,1]])
phi = np.linalg.inv(base) @ np.diag([1,0]) @ base

record = dict()
x = list()
y = list()
texts = list()
for i in range(N):
    r = np.random.rand(2) * 2 -1
    r = r/np.linalg.norm(r)
    dist = np.linalg.norm(phi @ r)
    if dist > 1:
        ## r是无法hash的对象,用元组进行打包,很妙的处理
        x.append(r[0])
        y.append(r[1])
        texts.append(dist)
        record[tuple(r)] = dist

print(record)
t = np.linspace(0,2*np.pi,200)
xt = np.cos(t)
yt = np.sin(t)
fig=plt.figure()
ax = plt.axes()
ax.set_aspect(1)
ax.plot(xt,yt,0.3)
ax.arrow(0,0,1,0,head_width=0.1)
ax.arrow(0,0,-0.7071067,0.7071067,head_width=0.1)
ax.plot(np.linspace(0,1,num=10),np.zeros(10))
for i in range(len(x)):
    ax.arrow(0, 0, x[i],y[i],head_width=0.05, fc='b', ec='k')
    ax.text(x[i]+0.2,y[i]-0.2,np.round(texts[i],2)) 
ax.grid()
ax.set_title('phi ^ 2 = phi ')
plt.show()




### 三维的情况
# record = dict()
# for i in range(N):
#     r = np.random.rand(3) * 2 -1
#     r = r/np.linalg.norm(r)
#     dist = np.linalg.norm(d @ r)
#     if dist > 1:
#         ## r是无法hash的对象,用元组进行打包,很妙的处理
#         record[tuple(r)] = dist

# print(record)