## 此代码用于实现Riemann重排定理
## 条件收敛的级数
an <- function(n){
  return(1/n) #向量化处理
}

## 需要收敛到的数值
ANS = 0 #随机选取

## 核心流程
Record = list() 

N = 30 #迭代N次
An = 1:N
S = an(1)
### 分别是奇偶的下标
K_plus = 1
K_mins = 2

for(i in 1:N){
  if(S >= ANS){ #此时需要减少S,取出偶数项
    while(S >= ANS){
      K_mins = K_mins + 2
      S = S - an(K_mins)
    }
    Record = append(Record,K_mins)
    An[i] = S
  }else if(S < ANS) {
    #此时需要增加S,取出奇数项
    while(S < ANS){
      K_plus = K_plus + 2
      S = S + an(K_plus)
    }
    Record = append(Record,K_plus)
    An[i] = S
  }
}

## 读出Record
Filename = paste("黎曼重排定理收敛到_",ANS,".txt",sep = "")
K_plus_raw = 1
K_mins_raw = 2
for(i in 1:N){
  if(Record[[i]] %% 2 == 0 ){ #偶数的情况
    str = as.character(seq(K_mins_raw,Record[[i]],2))
    K_mins_raw = Record[[i]] + 2
  }else { #奇数的情况
    str = as.character(seq(K_plus_raw,Record[[i]],2))
    K_plus_raw = Record[[i]] + 2
  }
  if(i == 1){
    cat(str," #\n",file = Filename,append = FALSE)
  }else{
    cat(str," #\n",file = Filename,append = TRUE)
  }
}
Record = unlist(Record)
plot(An,type = "b",pch = 16,lty = 3,ylim = c(min(An)*0.98 ,max(An)*1.02),
     ylab = "经过重排后的序列An",main = "Riemann重排定理")
abline(a = ANS,b = 0,col = "red",lty=2,cex = 2)
text(x = 1:N,y = An,labels = Record,pos = 1)



