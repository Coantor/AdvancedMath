f1 <- function(a){
  low = 0
  up = pi
  ## 向量化处理
  b = purrr::map(a,\(y){integrate(f =\(x){logb(1 - 2*y*cos(x) + y^2)},low,up)$value})
  return(b)
}

curve(expr = f1(x),0,6)