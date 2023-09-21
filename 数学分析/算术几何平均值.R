library(ggplot2)
library(magrittr)
## 核心函数,计算算术几何平均值
Cal_AG <- function(a,b,index = 1,n = 5){
  X1 = numeric(len = n)
  X2 = numeric(len = n)
  X1[1] = a
  X2[1] = b
  for(i in 2:n){
    X1[i] = (X1[i-1]+X2[i-1])/2
    X2[i] = sqrt(X1[i-1]*X2[i-1])
  }
  return(data.frame(X1,X2,n = 1:n,a = a,b = b))
}
set.seed(10)
M = 9  #模拟9轮
N = 10 #每轮模拟10次数据
da = purrr::pmap_dfr(list(runif(M,0,10),runif(M,0,10),1:M),\(x,y,index){Cal_AG(x,y,index,N)})

da  %>%  
  mutate(a = round(a,2)) %>% 
  ggplot(aes(x = n,y = X2)) + 
  geom_point() +  
  geom_line() + 
  facet_wrap(. ~ a,scales = "free") + 
  theme(axis.title = element_blank())

## 计算积分
Int_AG <- function(a,b){
  Int = integrate(f = \(x){1/sqrt(cos(x)^2 * a*a + b*b*sin(x)^2)},lower = 0,upper = pi/2)$value
  return(pi/(2*Int))
}

da2 = purrr::pmap_dfr(list(runif(M,0,10),runif(M,0,10),1:M),\(x,y,index){Cal_AG(x,y,index,N) %>% slice_tail(n = 1)}) %>% 
  mutate(real_ans = purrr::map2_dbl(.$a,.$b,Int_AG))
