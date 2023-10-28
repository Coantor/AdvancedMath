## 此脚本用于计算傅里叶系数
Rcpp::sourceCpp('Adapt_integrate_cpp.cpp')

Cal_Fourier_Coef <- function(f,n = 20,from = -pi,to = pi){
  mat = matrix(0,ncol = 2,nrow = n)
  for(i in 1:n){
    mat[i,1] = integrate(\(x){f(x)*cos(i*x)/pi},lower = from,upper = to)$value
    mat[i,2] = integrate(\(x){f(x)*sin(i*x)/pi},lower = from,upper = to)$value
    }
  return(mat)
}

Cal_Fourier_Coef_cpp <- function(f,n = 20,from = -pi,to = pi){
  mat = matrix(0,ncol = 2,nrow = n)
  for(i in 1:n){
    # 下面使用CPP计算积分系数
    mat[i,1] = Integrate_cpp(func = \(x){f(x)*cos(i*x)/pi},low = from,up = to,n = 100)
    mat[i,2] = Integrate_cpp(func = \(x){f(x)*sin(i*x)/pi},low = from,up = to,n = 100)
  }
  return(mat)
}
##产生颜色选择器
Init_color_eng <- function(){
  cb_palette <<- c("#ed1299", "#09f9f5", "#246b93", "#cc8e12", "#d561dd", "#c93f00", "#ddd53e",
                  "#4aef7b", "#e86502", "#9ed84e", "#39ba30", "#6ad157", "#8249aa", "#99db27", "#e07233", "#ff523f",
                  "#ce2523", "#f7aa5d", "#cebb10", "#03827f", "#931635", "#373bbf", "#a1ce4c", "#ef3bb6", "#d66551",
                  "#1a918f", "#ff66fc", "#2927c4", "#7149af" ,"#57e559" ,"#8e3af4" ,"#f9a270" ,"#22547f", "#db5e92",
                  "#edd05e", "#6f25e8", "#0dbc21", "#280f7a", "#6373ed", "#5b910f" ,"#7b34c1" ,"#0cf29a" ,"#d80fc1",
                  "#dd27ce", "#07a301", "#167275", "#391c82", "#2baeb5","#925bea", "#63ff4f")
}
