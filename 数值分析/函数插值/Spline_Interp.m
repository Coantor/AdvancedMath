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