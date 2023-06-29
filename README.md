# 数值分析与高等代数中经典算法编程实现

## 介绍

在一般的数值分析教程中,我们学了基本的数值分析算法.

1. 线性方程组的求解,LU分解(高斯消元法)、正定矩阵的Cholesky分解、追赶法求解特殊结构的矩阵.
2. 非线性方程的求解:牛顿迭代法、不动点迭代、二分法等等其他先进的算法。
3. 函数逼近中学习的插值算法:拉格朗日插值、埃尔米塔插值、分段插值、三次样条插值。最佳平凡逼近、最小二乘问题。
4. 数值积分中出现的算法:牛顿-柯斯特公式、复合梯形公式、自适应积分.
5. 线性方程组的迭代算法:雅可比迭代、超松弛迭代技术，共轭梯度法。
6. 矩阵特征值的计算:幂法、反幂法、QR方法。
7. 微分方程初值问题算法: 欧拉法、龙格-库塔方法。

而在高等代数中很多算法没有给出计算机的代码实现:

1. 方阵行列式的求解。
2. 方阵的逆矩阵求解。
3. 线性方程组的求解(包括基础解系的部分)。
4. 向量组的秩,矩阵的秩。
5. 向量正交化(施密特正交化)。
6. 多项式的带余除法。
7. 多项式最大公因数的求法(欧几里得辗转相除法)。

## 数值分析

数值分析代码matlab实现:

目前实现以下功能(2023-6-29):

#### 1.函数插值

对于函数插值我设计的思路是:建立一个插值的基类`Base_Interp`，用来承接所有的上层插值方法。

具有以下的属性:

```matlab
properties       %属性,x0,y0,多项式,n
        m_x0 = nan;
        m_y0 = nan;
        m_polynomial = nan; %保存多项式信息
        m_coef = nan;        %保存多项式系数
        m_n = nan;           %保存插值多项式的个数
end
```

实现的方法有

```matlab
% 初始构造
function obj = Base_Interp(x0,y0)
...
end

% 返回预测值(核心函数)
function y_pre = Interp(obj,x)
...
end

% 数据可视化
function plot(obj,str,x,y_real,N)
...
end%plot
```

##### 拉格朗日插值:

```matlab
classdef  Lagrange_Interp < Base_Interp
    
    properties       
        % 所有属性继承自 Base_Interp
    end
    
    methods
        function  obj = Lagrange_Interp(x0,y0)
            
           obj = obj@Base_Interp(x0,y0);
           obj.m_n = length(x0);
            %  核心代码
            syms t;
            z = zeros(obj.m_n,1);
            obj.m_polynomial = poly2sym(z,t);       %定义一个符号多项式 
            for i = 1:obj.m_n
                base =y0( i );
                for j =1:obj.m_n
                     if j ~= i
                         base = base* (t-x0(j))/(x0(i)-x0(j));   
                     end
                end
                obj.m_polynomial = obj.m_polynomial + base;
            end
            obj.m_polynomial = simplify(obj.m_polynomial);
            obj.m_coef = sym2poly(obj.m_polynomial);
        end
        
        % 通过已有多项式得到新的多项式
        function y_pre = Interp(obj,x)
            y_pre = Interp@Base_Interp(obj,x);
        end
        
        function plot(obj,x,y_real,N)
            plot@Base_Interp(obj,'Lagrange ',x,y_real,N);
        end
    end% methods
    
end
```



##### 埃尔米塔插值:

```matlab
classdef  Lagrange_Interp < Base_Interp
    
    properties       
        % 所有属性继承自 Base_Interp
    end
    
    methods
        function  obj = Lagrange_Interp(x0,y0)
            
           obj = obj@Base_Interp(x0,y0);
           obj.m_n = length(x0);
            %  核心代码
            syms t;
            z = zeros(obj.m_n,1);
            obj.m_polynomial = poly2sym(z,t);       %定义一个符号多项式 
            for i = 1:obj.m_n
                base =y0( i );
                for j =1:obj.m_n
                     if j ~= i
                         base = base* (t-x0(j))/(x0(i)-x0(j));   
                     end
                end
                obj.m_polynomial = obj.m_polynomial + base;
            end
            obj.m_polynomial = simplify(obj.m_polynomial);
            obj.m_coef = sym2poly(obj.m_polynomial);
        end
        
        % 通过已有多项式得到新的多项式
        function y_pre = Interp(obj,x)
            y_pre = Interp@Base_Interp(obj,x);
        end
        
        function plot(obj,x,y_real,N)
            plot@Base_Interp(obj,'Lagrange ',x,y_real,N);
        end
    end% methods
    
end%% 进行Hermite三次多项式插值
classdef Hermite_Interp < Base_Interp
    properties       %属性,x0,y0,多项式,n
        m_dy0 = nan; %保存导数信息
    end
    
    methods
        function obj = Hermite_Interp(x0,y0,dy0)
            
            obj = obj@Base_Interp(x0,y0);
            obj.m_dy0 = dy0;
            obj.m_n = length(x0) -1;
            n = obj.m_n;
            % 核心代码
            obj.m_polynomial = cell(n,1);
            obj.m_coef = cell(n,1);
            syms t;
            for i = 1:n
                x_ = x0(i:i+1);
                y_ = y0(i:i+1);
                dy_ = dy0(i:i+1);
                l1 = (t-x_(2))/(x_(1)-x_(2));
                l2 = (t-x_(1))/(x_(2)-x_(1));
            % 计算 b1,b2
                b1 = (t-x_(1))*l1^2;
                b2 = (t-x_(2))*l2^2;
            % 计算 a1,a2
                a1 = ( 1-2*(t-x_(1))/(x_(1)-x_(2)) ) *l1*l1;
                a2 = (1-2*(t-x_(2))/(x_(2)-x_(1))) *l2*l2;
                obj.m_polynomial{i} = y_(1)*a1+y_(2)*a2+dy_(1)*b1+dy_(2)*b2;
                obj.m_polynomial{i} = simplify(obj.m_polynomial{i});
                obj.m_coef{i} = sym2poly(obj.m_polynomial{i});       
            end
        end
        
        % 得到预测结果
        function y_pre = Interp(obj,x)
            n = length(x);
            y_pre = zeros(n,1);
            x_min = min(obj.m_x0);
            x_max = max(obj.m_x0);
            for i = 1:n
                % pos 的求法
                if x(i) <x_min || x(i) >x_max
                    error("外插值,跳出函数")
                end
                pos = find(obj.m_x0 > x(i),1);
                % test
                y_pre(i) = polyval(obj.m_coef{pos-1},x(i));
            end
        end
      
        function plot(obj,x,y_real,N)
                plot@Base_Interp(obj,'Hermite',x,y_real,N);
        end%plot
        
    end

end
```

##### 牛顿插值:

```matlab
%% 这里建立了牛顿插值法的应用
classdef Newton_Interp < Base_Interp
    properties
    end
    
    methods
        % 可以选择插值多项式的阶数
          function  obj = Newton_Interp(x0,y0,N)
                if(~exist('N','var'))
                    N = length(x0);  % 如果未出现该变量，则对其进行赋值
               end
           obj = obj@Base_Interp(x0,y0);
           obj.m_n = length(x0);
           
            %  核心代码
            before = obj.m_y0';     %转化为列向量
            syms t;
            obj.m_polynomial = 0;
            base = 1;
            for i  = 1:N
                obj.m_polynomial = obj.m_polynomial  + before(1)*base;
                base = base*(t-obj.m_x0(i));
                xx = obj.delay_diff(obj.m_x0,i);
                yy = diff(before);
                next = yy./xx;
                before = next;              % 更新列向量
            end
             obj.m_polynomial = simplify(obj.m_polynomial);
             obj.m_coef = sym2poly(obj.m_polynomial);
             
            end
            
           % 类成员, ~是必须的,否则输入参数太多
            function x =  delay_diff(~,x0,n)
                N = length(x0);
                x  =zeros(N-n,1);
                for i = 1:(N-n)
                    x(i) = x0(i+n) - x0(i);
                end
            end
           
            % 得到插值结果
           function y_pre = Interp(obj,x)
             y_pre = Interp@Base_Interp(obj,x);
           end 
            % 可视化部分
            function plot(obj,x,y_real,N)
                plot@Base_Interp(obj,'Newton ',x,y_real,N);
            end         
    end

end


```

##### 分段线性插值:

```matlab
%% 线性插值结果 Linear_Interp
classdef  Linear_Interp < Base_Interp
    properties
        % 所有属性继承自 Base_Interp
    end
    
    methods
        function obj = Linear_Interp(x0,y0)
            obj = obj@Base_Interp(x0,y0);
            % 核心代码
            obj.m_n = 1;     %选用线性插值
            n = length(x0) -1;
            obj.m_coef = cell(n,1);
            obj.m_polynomial = cell(n,1);
            for i = 1:n
                x = obj.m_x0(i:i+1);   %保证顺序正确
                y = obj.m_y0(i:i+1);
                obj.m_coef{i} = [diff(y)./diff(x),y(1)-diff(y)/diff(x)*x(1)];
                obj.m_polynomial{i} = poly2sym(obj.m_coef{i});
            end
            
        end
        
        function y_pre = Interp(obj,x)
            n = length(x);
            y_pre = zeros(n,1);
            x_min = min(obj.m_x0);
            x_max = max(obj.m_x0);
            for i = 1:n
                 if x(i) <x_min || x(i) >x_max
                    error("外插值,跳出函数")
                end
                pos = find(obj.m_x0 > x(i),1);
                % test
                y_pre(i) = polyval(obj.m_coef{pos-1},x(i));
            end
        end

        function plot(obj,x,y_real,N)
            plot@Base_Interp(obj,'Linear ',x,y_real,N);
        end
    end
end
```

##### 三次样条插值：

```matlab
%% 这里是三次样条插值,分别对每两个点进行分段插值,保证二阶光滑
classdef Spline_Interp < Base_Interp
    properties
    end
    methods
        function obj = Spline_Interp(x0,y0)
          
          obj = obj@Base_Interp(x0,y0);
                                               % 核心代码,这里采取自然边界来处理
          n = length(x0)-1;          %多项式个数
          obj.m_n = n;
          obj.m_polynomial = cell(n,1);
          obj.m_coef = cell(n,1);
          h = diff(obj.m_x0);       %差分结果
          dy = diff(obj.m_y0);
          y = obj.m_y0;
          Z = zeros(n+1,n+1);    %系数矩阵
          Z(1,1) = 1;
          for i = 2:n
              Z(i,i-1) = h(i-1);
              Z(i,i) = 2*(h(i-1)+h(i));
              Z(i,i+1) = h(i);
          end
          Z(n+1,n+1) = 1;
          
          X = obj.m_x0;
          Y = zeros(n+1,1);             %目标值
          
          for i = 2:n
              Y(i) =6*( dy(i)/h(i) - dy(i-1)/h(i-1) );
          end
          m = Z\Y;                     %M为二阶导数值,可以优化
          syms t;
          for i = 1:n
              b = dy(i)/h(i)-h(i)/2*m(i)-h(i)/6*(m(i+1)-m(i));
              c  = m(i)/2;
              d = (m(i+1)-m(i))/(6*h(i));
              obj.m_polynomial{i} = y(i) + b*(t-X(i))+c*(t-X(i))^2 + d*(t-X(i))^3;
              obj.m_coef{i} = sym2poly(obj.m_polynomial{i});
          end
        end
        
        % 得到预测结果
        function y_pre = Interp(obj,x)
            n = length(x);
            y_pre = zeros(n,1);
            x_min = min(obj.m_x0);
            x_max = max(obj.m_x0);
            for i = 1:n
                % pos 的求法
                if x(i) <x_min || x(i) >x_max
                    error("外插值,跳出函数")
                end
                pos = find(obj.m_x0 > x(i),1);
                % test
                y_pre(i) = polyval(obj.m_coef{pos-1},x(i));
            end
        end%Interp
      
        function plot(obj,x,y_real,N)
                plot@Base_Interp(obj,'SplineInterp',x,y_real,N);
        end%plot
        
    end

end
```



设计原理图:

!["拉格朗日插值类的设计思路"](D:\数值分析\matlab\函数插值\图片2.png)

类的抽象结果:

!["设计原理"](D:\数值分析\matlab\函数插值\图片1.png )![输入图片说明](%E6%95%B0%E5%80%BC%E5%88%86%E6%9E%90/%E5%87%BD%E6%95%B0%E6%8F%92%E5%80%BC/%E5%9B%BE%E7%89%872.png)



##### 调用方法:

`Interp_main.m`是调用插值函数的脚本.



## 高等代数部分
![输入图片说明](%E6%95%B0%E5%80%BC%E5%88%86%E6%9E%90/%E5%87%BD%E6%95%B0%E6%8F%92%E5%80%BC/%E5%9B%BE%E7%89%871.png)
高等代数代码matlab实现:

目前实现以下功能(2023-6-29):

1. 矩阵行列式求解,包括两个函数文件 Det.m,Det2.m。前者是通过行列式展开计算,后者是通过消元法求解.这两个函数的测试文件为matrix_deternimant.m,包括对这两个函数的测试以及与自带函数det计算速度的对比.
2. 方阵求逆，包括两个函数文件, Inv.m,Inv2.m。前者是先求解矩阵的伴随，后者是通过初等行变换实现.这两个函数的测试文件为 matrix_inverse.m,包括对这两个函数的测试以及与自带函数inv计算速度的对比.
3. 求矩阵以及向量组的秩.包括一个函数文件 Calc_rank.m 主要实现方法是矩阵的初等变换(目前仅仅实现了初等行变换),测试文件为 matrix_rank.m.