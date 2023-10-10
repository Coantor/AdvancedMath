#include "iostream"
#include "cmath"
#include "Ration.h"
#include "random"

using namespace std;

void test01()
{
    //测试加减乘除的运算
    int a = 12,b = 5,c = 43,d = 67;
    Ration A(a,b),B(c,d);
    //加减乘除运算
    cout << A + B << endl;
    cout << A - B << endl;
    cout << A * B << endl;
    cout << A / B << endl;
    cout << (A < B) << endl;

}

//有理数域上的整数带余除法
void test02()
{
    // a = b * N + r
    int a = 107,b = 173,c =155,d = 187;
    Ration A(a,b),B(c,d);
    Ration r(1,1);
    int k = 0;
    while(r != 0 && k < 30){
        k ++;
        int N ;
        N = (A/B).to_int();
        r = A - N * B;
        if(N < 0){ //防止B太小,导致N计算为负数
            break;
        }
        cout << '[' << A << "] == [" << B << "] * [" << N << "] + " << r << endl;
        A = B;
        B = r;
    }
}

//测试3,随机生成迭代数据,然后计算迭代次数
void test03()
{
    random_device rd; 
    mt19937 gen(rd()); //gen是一个使用rd()作种子初始化的标准梅森旋转算法的随机数发生器
    uniform_int_distribution<> unif_df(1, 200);
    int N = 10;
    for(int i =0; i < N ;i ++){
        int a = unif_df(gen),b = unif_df(gen),c = unif_df(gen),d = unif_df(gen);
        Ration A(a,b),B(c,d);
        int n = Max_Factor_terms(A,B);
        cout << n << endl; //输出迭代次数
        if(n > 10){
            cout << " this term's "<< A << "  "<< B << endl;
        }
        cout << " A/B  Max_Factor is : " << Max_Factor(A,B) << endl ;

    }
}

int main()
{
   test01();
   test02();
   test03();
}