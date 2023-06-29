%% �����ֵ�Ļ���
classdef Base_Interp < handle
    properties       %����,x0,y0,����ʽ,n
        m_x0 = nan;
        m_y0 = nan;
        m_polynomial = nan; %�������ʽ��Ϣ
        m_coef = nan;            %�������ʽϵ��
        m_n = nan;                 %�����ֵ����ʽ�ĸ���
    end
    
    methods
        % ��ʼ����
        function obj = Base_Interp(x0,y0)
             % ��֤��ֵ��˳��
            [x0,ind]  = sort(x0);
            y0(ind) = y0;
              
            obj.m_x0 = x0;
            obj.m_y0 = y0;
        end
        
        % ����Ԥ��ֵ
        function y_pre = Interp(obj,x)
            y_pre = polyval(obj.m_coef,x);
        end
        
        % ���ݿ��ӻ�
       function plot(obj,str,x,y_real,N)
             figure(N);
             plot(x,y_real,"LineWidth",1.7);
             hold on
             scatter(obj.m_x0,obj.m_y0,30);
             y_pre = obj.Interp(x);
             plot(x,y_pre,"r-.","LineWidth",1.2);
             hold off
             legend("real point","sample point","pre point",'Location','SouthEast');
             str =strcat( str,'Interpolation');
             title(str);
       end%plot
    end
end
