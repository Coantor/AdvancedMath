## 绘制莱布尼兹级数

## 绘制Sn,Rn.
S = logb(2)
N = 30
Sn = 1:N
Rn = 1:N
an = 1:N
Rn[1] = S
for(i in 2:N){
  an[i] = (-1)^(i+1)*1/i
  Sn[i] = Sn[i-1] + (-1)^(i+1) /i
  Rn[i] = S - Sn[i]
}
par(mfrow = c(2,1))
plot(Sn,type = "b",pch = 16,main = expression(S[n]))
plot(Rn,type = "b",pch = 16,col = "red",main = expression(R[n]) )
points(abs(an),col = "blue",pch = 13,cex = 0.5)
legend("topright",inset = 0.05,legend = c("Rn","an"),col = c("red","blue"),pch=c(16,13))
