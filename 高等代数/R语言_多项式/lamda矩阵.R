library(R6)
source("多项式类.R")
## 拥有一个多项式类
LambdaMatrix <- R6Class(
  classname = "LambdaMatrix",
  public = list(
    da = list(),
    initialize = function(x,m,n){
      ## 输入方式是一列为一个多项式,从左到右,m,n分别为行数和列数
      private$m = m
      private$n = n
      for(i in 1:(m*n)){
        self$da=append(self$da,Poly$new(x[,i]))
      }
    },
    get_shape = function(){
      return(c(private$m,private$n))
    },
    print = function(...){
      for(i in 1:private$m){
        for(j in 1:private$n){
          cat("[",i,",",j,"] :","\n")
          print(self$da[[(i-1)*private$m+j]])
        }
      }
    },
    to_file = function(filename){
      ## 打印形式的
      
      for(i in 1:private$m){
        strs = "( "
        for(j in 1:private$n){
          strs = str_c(strs,self$da[[(i-1)*private$m+j]]$to_str()," | ")
        }
        strs = str_c(strs," )")
        if(i == 1){
          cat(strs,"\n\n",file = filename)
        }else{
          cat(strs,"\n\n",file = filename,append = TRUE)
        }
       
      }
    }
    
  ),
  private = list(
    m = 0, #m行
    n = 0 #n列
  )
)

## 计算行列式
Lambda_det =  function(Lm,H = 16){#最大多项式长度为16
  shape = Lm$get_shape()
  if(shape[1] != shape[2]){
    stop("矩阵格式不匹配,无法计算行列式")
  }
  if(shape[1] == 1){ #一阶行列式
    return(Lm$da[[1]]) 
  }else if(shape[1] == 2){ #二阶行列式
    return( 
      mins(mutiply(Lm$da[[1]],Lm$da[[4]]),mutiply(Lm$da[[2]],Lm$da[[3]]))
    )
    }
    else{ #高阶行列式
      ## 按照第一行展开
      N = shape[1]
      ans = Poly$new(0) #做为最终结果
      for(i in 1:shape[1]){
        # 生成余子式,找到产生余子式的下指标
        Label = setdiff(1:N,i) + N #下指标 
        for(j in 2:(N-1)){
          Label = c(Label,setdiff(1:N,i) + j*N)
        }
        D = matrix(0,nrow = H,ncol = length(Label))
        for(j in 1:length(Label)){
          vec_temp = Lm$da[[Label[j]]]$vec
          if(j <=(N-1)){ #在这里就计算代数余子式
            vec_temp = (-1)^(1+i)*vec_temp
          }
          if(length(vec_temp) > H){
            stop("矩阵元素次数太高,需要调高H")
          }
          D[,j] = c(vec_temp,rep(0,H-length(vec_temp)))
        }
        
        S = LambdaMatrix$new(D,N-1,N-1)
        S_det = Lambda_det(S) #代数余子式
        ans = plus(ans,mutiply(S_det,Lm$da[[i]]))
      }
      return(ans)
    }#
}

# ## 行列式因子
# Fac_Lambda_det <- function(Lm)
# {
#   # 计算每一阶的行列式因子
#   N = sqrt(length(Lm$da)) #计算方阵的长和宽
#   Fac_Lambda = list() #保存行列式因子
#   for(i in N:1){
#       #可能出现的主子式,离散数学的知识,从1:N中不重样的抽取k个数组
#        
#       
#       
#   }
#   
# 
# }  

## 不变因子


### 我们可以证明A 与 A' 是相似的,仅仅需要他们行列式因子一样.

## 初等因子,多项式的不可约性(没有办法实现).


