%% ���Բ�ֵ��� Linear_Interp
classdef  Linear_Interp < Base_Interp
    properties
        % �������Լ̳��� Base_Interp
    end
    
    methods
        function obj = Linear_Interp(x0,y0)
            obj = obj@Base_Interp(x0,y0);
            % ���Ĵ���
            obj.m_n = 1;     %ѡ�����Բ�ֵ
            n = length(x0) -1;
            obj.m_coef = cell(n,1);
            obj.m_polynomial = cell(n,1);
            for i = 1:n
                x = obj.m_x0(i:i+1);   %��֤˳����ȷ
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
                    error("���ֵ,��������")
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