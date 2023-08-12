#include"iostream"
#include<iomanip> //控制输出精度
#include"cmath"
#include"fstream" //输入数据进入文本
#define PI acos(-1) //定义pi

using namespace std;

void func01()
{
    ofstream ofs;
	ofs.open("data.txt",ios::out);
	
    double pi = PI;
    double f = pi,g = 1,r = 1;
    int count = 100;//控制计算流程
    for(int n = 0;n < count ;n ++){
        int N = int(f/g);
        r = f - N * g;
        if( N < 0 || r < 1e-15 ){
            break; //防止过小的g导致N为负数
        }
        ofs << setprecision(10) << r << endl ;
        cout << setprecision(10)<< f << " = [" << N << "] * " << g << " + " << r << endl;
        f = g;
        g = r;
    }
    ofs.close();
}

int main()
{
    func01();    
}