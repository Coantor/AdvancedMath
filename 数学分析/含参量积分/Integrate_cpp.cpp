#include<Rcpp>
#include<cmath>

using namespace Rcpp;


double f1(double x,double par)
{
    return(log(1+par*cos(x)));
}

// [[Rcpp::export]]
double integrator1(double par,double lower,double upper,int N = 1000)
{
  


}

