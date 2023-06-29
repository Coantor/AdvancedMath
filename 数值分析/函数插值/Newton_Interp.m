%% ���ｨ����ţ�ٲ�ֵ����Ӧ��
classdef Newton_Interp < Base_Interp
    properties
    end
    
    methods
        % ����ѡ���ֵ����ʽ�Ľ���
          function  obj = Newton_Interp(x0,y0,N)
                if(~exist('N','var'))
                    N = length(x0);  % ���δ���ָñ������������и�ֵ
               end
           obj = obj@Base_Interp(x0,y0);
           obj.m_n = length(x0);
           
            %  ���Ĵ���
            before = obj.m_y0';     %ת��Ϊ������
            syms t;
            obj.m_polynomial = 0;
            base = 1;
            for i  = 1:N
                obj.m_polynomial = obj.m_polynomial  + before(1)*base;
                base = base*(t-obj.m_x0(i));
                xx = obj.delay_diff(obj.m_x0,i);
                yy = diff(before);
                next = yy./xx;
                before = next;              % ����������
            end
             obj.m_polynomial = simplify(obj.m_polynomial);
             obj.m_coef = sym2poly(obj.m_polynomial);
             
            end
            
            % ���Ա, ~�Ǳ����,�����������̫��
            function x =  delay_diff(~,x0,n)
                N = length(x0);
                x  =zeros(N-n,1);
                for i = 1:(N-n)
                    x(i) = x0(i+n) - x0(i);
                end
            end
           
            % �õ���ֵ���
           function y_pre = Interp(obj,x)
             y_pre = Interp@Base_Interp(obj,x);
           end 
            % ���ӻ�����
            function plot(obj,x,y_real,N)
                plot@Base_Interp(obj,'Newton ',x,y_real,N);
            end
            
            
    end
    
    
end


