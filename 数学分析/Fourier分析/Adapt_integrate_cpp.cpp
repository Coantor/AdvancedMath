#include <Rcpp.h>
#define PI 3.1415926
using namespace Rcpp;


// [[Rcpp::export]]
double Integrate(Function func,double low,double up)
{
  double x1 =  Rcpp::as<double>( func(low) );
  double  x2 =  Rcpp::as<double>( func((low + up)/2) );
  double x3 =  Rcpp::as<double>( func(up) );
  return((x1 + 4*x2 +x3) *(up - low)/6.0);
}
// [[Rcpp::export]]
double ada_integrate(Function func,double low,double up,double ans,double tol = 1e-7)
{
  double mid = (low + up) /2;
  double left = Integrate(func,low,mid);
  double right = Integrate(func,mid,up);
  if(fabs(left + right - ans) < tol) return ans;
  return(ada_integrate(func,low,mid,left) +ada_integrate(func,mid,up,right) );
}

// [[Rcpp::export]]
double Integrate_cpp(Function func,double low,double up,int n = 20)
{
  double h = (up - low)/n; //计算每一隔
  double s = 0, a = low, b = a + h; //积分值
  for(int i = 0; i < n;i ++){
    s += Integrate(func,a,b);
    a = a + h;
    b = b + h;
  }
  return(s);
}
