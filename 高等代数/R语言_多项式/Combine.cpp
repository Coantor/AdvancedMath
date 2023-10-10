#include<Rcpp.h>
#include<vector>
typedef long long ll;
using namespace std;

ll C_number(ll n,ll m)
{
  if(m == 0 || m == n) return 1;
  return(C_number(n-1,m)+C_number(n-1,m-1));
}

//[[Rcpp::export]]
vector<int> Combine(int N,int r) //从1:N中选取r个数,不重复选取
{
  int C = C_number(N,r);
  vector<int> ans(0,C*r); //记录最后的数据
  vector<int> temp(0,r); //记录每次迭代下的数据
  for(int i = 0;i < N;i++){
    
  }
}