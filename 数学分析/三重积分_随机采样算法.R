## 被积分区域为一个三棱锥
library(tidyverse)
N <<- 100000
as.data.frame(
  matrix(runif(N*3,0,1),nrow = N,ncol = 3)
  ) %>% mutate(s = pmap_dbl(., sum)) %>% 
  filter( s < 1) %>% 
  mutate(inte = pmap_dbl(., ~ sum((1-..2)*exp(-(1-..2 - ..3)^2))/6)) %>% 
  pull(inte) %>% mean()