// 建立有理函数类
#include"cmath"
#include"iostream"
//求两个数的最大公因数
int Max_Factor (int a,int b);
class Ration
{
public:
Ration (int m,int n = 1){
    
    if(n == 0){
    throw "Division by zero condition!";
    }else if(m == 0){
        m_m = 0;
        m_n = 1;
        m_is_checked = true;
    }else {
        int d = Max_Factor(m,n);
        //做出互素处理
        m_m = m/d;
        m_n = n/d;
        m_is_checked = true;
        if(m * n < 0){ //保证分母一直为正数
            m_m = (-1) * abs(m)/d;
            m_n = abs(n)/d;
        }
        
    }
}
bool Is_check(){return (m_is_checked);}
int get_m(){return m_m;}
int get_n(){return m_n;}
double to_double(){return double(m_m)/double(m_n);}
int to_int(){return m_m/m_n;}

private:
    int m_m;//分子
    int m_n;//分母
    bool m_is_checked = false;//是否进行进行互素处理,默认false
};

Ration operator +(Ration a,Ration b){
    return(Ration(a.get_m() * b.get_n() + a.get_n() * b.get_m(), a.get_n() * b.get_n()));
}

Ration operator -(Ration a,Ration b){
    return(Ration(a.get_m() * b.get_n() - a.get_n() * b.get_m(), a.get_n() * b.get_n()));
}

Ration operator * (Ration a,Ration b){
    return(Ration(a.get_m() * b.get_m() , a.get_n() * b.get_n()));
}

Ration operator / (Ration a,Ration b){
    return(Ration(a.get_m() * b.get_n() , a.get_n() * b.get_m()));
}
bool operator > (Ration a,Ration b){
    return(a.get_m()*b.get_n() > b.get_m()*a.get_n());
}

bool operator < (Ration a,Ration b){
    return(a.get_m()*b.get_n() < b.get_m()*a.get_n());
}

bool operator == (Ration a,Ration b){
    return((a.get_m() == b.get_m() &&  a.get_n() == b.get_n()));
}

bool operator != (Ration a,Ration b){
    return((a.get_m() != b.get_m() ||  a.get_n() != b.get_n()));
}

std::ostream & operator << (std::ostream &cout, Ration A){
    if(A.get_m() == 0){
        std::cout << "0" ;
    }else {
        std::cout << A.get_m() << "/" << A.get_n() ;
    }
    return(cout);
}


int Max_Factor (int a,int b){
    int c = 1;
    if(abs(a) < abs(b)){
        int temp = a;
        a = b;
        b = temp;
    }
    if(b == 0){
    throw "Division by zero condition!";
    }
    while(c != 0 ){
        c = a%b;
        a = b;
        b = c;
    }
    return (abs(a));
}

Ration Max_Factor (Ration A,Ration B)
{
    if( A < B){
        Ration temp = A;
        A =  B;
        B = temp;
    }
    Ration r(1,1);
    while(r != 0){
        int N ;
        N = (A/B).to_int();
        r = A - N * B;
        A = B;
        B = r;
    }
    return (A);
}
int Max_Factor_terms(Ration A,Ration B)
{
    int n = 0;//返回迭代次数
    if( A < B){
        Ration temp = A;
        A =  B;
        B = temp;
    }
    Ration r(1,1);
    while(r != 0){
        n ++;
        int N ;
        N = (A/B).to_int();
        r = A - N * B;
        A = B;
        B = r;
    }
    return (n);
}