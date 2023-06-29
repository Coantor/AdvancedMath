%% lagrange Interpolation �������ն���ʽ��ֵ
classdef  Lagrange_Interp < Base_Interp
    
    properties       
        % �������Լ̳��� Base_Interp
    end
    
    methods
        function  obj = Lagrange_Interp(x0,y0)
            
           obj = obj@Base_Interp(x0,y0);
           obj.m_n = length(x0);
            %  ���Ĵ���
            syms t;
            z = zeros(obj.m_n,1);
            obj.m_polynomial = poly2sym(z,t);       %����һ�����Ŷ���ʽ 
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
        
        % ͨ�����ж���ʽ�õ��µĶ���ʽ
        function y_pre = Interp(obj,x)
            y_pre = Interp@Base_Interp(obj,x);
        end
        
        function plot(obj,x,y_real,N)
            plot@Base_Interp(obj,'Lagrange ',x,y_real,N);
        end
    end% methods
    
end
