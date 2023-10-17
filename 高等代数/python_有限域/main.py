## 验证Zp(p是素数,Z是主理想整环,pZ是素理想,即pZ是极大理想,则Z/pZ是域)是数域
## 对于一个有限域,给出一个字典.给出其对应的乘法逆元
from sympy.ntheory.modular import isprime

def CalcSet(p:int):
    """
    返回一个字典,键是域中的代表元,值是该代表元的乘法逆元
    """
    a = list(range(p))
    F = dict()
    for i in range(1,p):
        s = [k for k in range(1,p) if (k*i) % p == 1]
        if (len(s) == 0):
            F[i] = None
        else:
            F[i] = s[0]
    return F

P = [i for i in range(100,130) if isprime(i) == True]

print(str(P[0]) + "域中的键值对: ")
print(CalcSet(P[0]))

## 像一个合数有限域就不是一个域
print(CalcSet(8))