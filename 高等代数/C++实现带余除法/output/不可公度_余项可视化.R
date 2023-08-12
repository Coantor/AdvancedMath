library(tidyverse)
data = readr::read_table("data.txt",col_names = F) %>% 
  mutate(id = 1:nrow(.))
data %>% 
  ggplot(aes(x = id ,y = X1)) + 
  geom_point() + 
  scale_y_log10() + 
  theme_classic() + 
  labs(title = "不可公度余项结果")
