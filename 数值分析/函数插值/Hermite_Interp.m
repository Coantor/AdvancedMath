%% ����Hermite���ζ���ʽ��ֵ
classdef Hermite_Interp < Base_Interp
    properties       %����,x0,y0,����ʽ,n
        m_dy0 = nan; %���浼����Ϣ
    end
    
    methods
        function obj = Hermite_Interp(x0,y0,dy0)
            
            obj = obj@Base_Interp(x0,y0);
            obj.m_dy0 = dy0;
            obj.m_n = length(x0) -1;
            n = obj.m_n;
            % ���Ĵ���
            obj.m_polynomial = cell(n,1);
            obj.m_coef = cell(n,1);
            syms t;
            for i = 1:n
                x_ = x0(i:i+1);
                y_ = y0(i:i+1);
                dy_ = dy0(i:i+1);
                l1 = (t-x_(2))/(x_(1)-x_(2));
                l2 = (t-x_(1))/(x_(2)-x_(1));
            % ���� b1,b2
                b1 = (t-x_(1))*l1^2;
                b2 = (t-x_(2))*l2^2;
            % ���� a1,a2
                a1 = ( 1-2*(t-x_(1))/(x_(1)-x_(2)) ) *l1*l1;
                a2 = (1-2*(t-x_(2))/(x_(2)-x_(1))) *l2*l2;
                obj.m_polynomial{i} = y_(1)*a1+y_(2)*a2+dy_(1)*b1+dy_(2)*b2;
                obj.m_polynomial{i} = simplify(obj.m_polynomial{i});
                obj.m_coef{i} = sym2poly(obj.m_polynomial{i});       
            end
        end
        
        % �õ�Ԥ����
        function y_pre = Interp(obj,x)
            n = length(x);
            y_pre = zeros(n,1);
            x_min = min(obj.m_x0);
            x_max = max(obj.m_x0);
            for i = 1:n
                % pos ����
                if x(i) <x_min || x(i) >x_max
                    error("���ֵ,��������")
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