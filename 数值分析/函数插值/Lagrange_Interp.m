%% lagrange Interpolation 拉格朗日多项式插值
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
