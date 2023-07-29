library(R6)
library(stringi) #字符串处理包
Poly <- R6Class(
  classname = "Poly", #定义一个多项式类

  public = list(
    vec = NA,
    deg = NA,
    initialize  = function(vec){
      self$vec = vec #比如vec=c(1,2,3),则x^2 + 2* x + 3
      if(length(vec) == 1 && vec[1] == 0){  
        self$deg = -Inf #否则定义为零多项式
      }else if(all(vec == 0)){
        self$vec = 0
        self$deg = -Inf
      }
      else {
        self$deg = length(vec) - 1
        ## 清除开始的零元素
        while( self$vec[self$deg+1] == 0 ){
          self$vec = self$vec[1:self$deg]
          self$deg = self$deg - 1
        }
         #正常的次数定义
      }
    },
    ## 泛函
    print = function(...) {
      if(self$deg == -Inf){
        cat("0\n")
      }else{
      strs = paste("x^","(",collapses = 0:self$deg,"):",sep = "")
      cat(paste(strs,sep = "  "), '\n')
      cat(paste(round(self$vec,3),collapse = "      "),"\n")
      }
    },
    ## 转化为字符串
    to_str = function(){
      strs = NULL
      if(self$deg == -Inf){
        strs = "0"
      }else{
        strs = paste(round(self$vec,3),collapses = paste("x^","(",collapses = 0:self$deg,") +",sep = ""))
        strs = str_flatten(strs)
        
        strs = str_remove(strs,"x\\^\\(0\\)") #去掉常数项
        strs = str_sub(strs,end = "-2") #去掉最后一个+
        }
      return(strs)
    }
)
)
mutiply = function(one,ano_poly){
  m = one$deg + 1
  n = ano_poly$deg + 1
  new_ploy = Poly$new(0)
  if(m != -Inf && n != -Inf)
  { 
    new_ploy$deg =m + n- 2 #公式
    #计算多项式的系数
    vec = rep(0, m + n-1) #保存新的向量
    for(i in 1:m){
      for(j in 1:n){
        vec[i+j-1] = vec[i+j-1] + one$vec[i] * ano_poly$vec[j]
      }
    }
    new_ploy$vec = vec
  }
  return(new_ploy)
}
plus = function(one,ano_poly){
  # 加法原则创建新的多项式
  m = one$deg + 1
  n = ano_poly$deg + 1
  if(m == -Inf){
    return(ano_poly)
  }else if (n == -Inf){
    return(one)
  }
  new_ploy = Poly$new(rep(1,max(m,n)))
  
  if(m >= n){
    new_ploy$vec = one$vec + c(ano_poly$vec,rep(0,m-n))
  }else{
    new_ploy$vec = ano_poly$vec + c(one$vec,rep(0,n-m))
  }
  # 检查最大项是否为0
  if(all(new_ploy$vec  == 0)){
    return(Poly$new(0)) #放回0多项式
  }
  while( new_ploy$vec[new_ploy$deg+1] == 0 ){
    new_ploy$vec = new_ploy$vec[1:new_ploy$deg]
    new_ploy$deg = new_ploy$deg - 1
  }
  return(new_ploy)
} # 加法函数
mins = function(one,ano_poly){
  if(one$deg == -Inf){
    temp_poly = ano_poly$clone()
    temp_poly$vec = (-1)*temp_poly$vec
    return(temp_poly)
  }else if(ano_poly$deg == -Inf){
    return(one)
  }
  temp_poly = ano_poly$clone()
  temp_poly$vec = (-1)*temp_poly$vec
  new_ploy = plus(one,temp_poly)
  return(new_ploy)
}#减法函数


division = function(one,ano_poly){
  m = one$deg + 1
  n = ano_poly$deg + 1 
  if(m == -Inf || n == -Inf){
    stop("除法的特殊情况")
  }
  if(m < n){
    q_poly = Poly$new(0)
    r_poly = one
    }
  else{
    vec_q = rep(0,m-n+1)
    last_kx = one$clone()
    for(i in (m-n+1):1){
      vec_q[i] = last_kx$vec[i-1+n]/ano_poly$vec[n]
      last_kx = mins(last_kx,mutiply(Poly$new(vec_q),ano_poly)) #计算剩下的系数
      if(all(last_kx$vec == 0)){
        break;
      }
    }
    q_poly = Poly$new(vec_q)
    r_poly = mins(one,mutiply(ano_poly ,q_poly))
  }
  return(list(qx = q_poly,rx = r_poly))
} #带余除法,迭代算法.返回列表

#求最大公因式
Max_CommonFactor <- function(one,ano_poly){
  Q = division(one,ano_poly)
  #qx = Q[[1]]
  rx = Q[[2]]
  qx = ano_poly
  while(any(rx$vec != 0)){
    Q  = division(qx,rx)
    qx = rx
    rx = Q[[2]]
  }
  qx$vec = qx$vec/qx$vec[length(qx$vec)] #首一多项式
  return(qx)
}
