#include<Rcpp.h>
using namespace Rcpp;

//[[Rcpp::export]]

int Max_CommonFactor(int a,int b)
{
  int c = 0;
  if( a<= 0 || b <= 0){
    return (-1);
  }while( b !=0 ){ // 使用欧几里在辗转相除法
    c = a % b;
    a = b;
    b = c;
  }
  return a;
}