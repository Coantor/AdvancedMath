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


