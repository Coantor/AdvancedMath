## 3(sin,cox,tan) + 3(倒数) + 3(反函数) 
## 这里选用R语言最擅长的数据框做为基本数据结构
library(tidyverse)

## 自适应采样函数,这里考率到每个边的差异
adaptive_x_side <- function(from ,to,key_point,side = 3){
  h = (to-from)/400
  x = seq(from,to,len = 1000)
  if(side == 3){ #双侧逼近
  x_ada = map(key_point,~ seq(.x-h,.x+h,len = 100))
  }else if(side == 1){ #左侧逼近
    x_ada = map(key_point,~ seq(.x-h,.x,len = 100))
  }else if(side == 2){ #右侧逼近
    x_ada = map(key_point,~ seq(.x,.x+h,len = 100))
  }
  x = sort(c(x,unlist(x_ada)))
}

## 这一步一定会产生NAs值,但是当绘图函数碰到这里时,将进行绘制,因此无关要紧
data = data.frame(x = adaptive_x_side(-pi,pi,c(-pi/2,pi/2))) %>% 
  mutate(y_sin = sin(x),y_cos = cos(x), y_tan = tan(x),
         y_asin = asin(x),y_acos = acos(x), y_atan = atan(x),
         y_csc = 1/sin(x),y_sec = 1/cos(x),y_cot = 1/tan(x))

data %>% 
  gather(key = "key",value = "value",2:10) %>% 
  ggplot(aes(x = x,y = value)) + 
  geom_point(cex = 0.1) + 
  geom_hline(yintercept = 0,color = "black")+
  geom_vline(xintercept = 0,color = "red")+
  facet_wrap( ~ key,nrow = 3,ncol = 3) + 
  theme_bw()+ ylim(c(-5,5))

