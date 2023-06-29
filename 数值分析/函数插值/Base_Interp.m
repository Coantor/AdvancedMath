%% 定义插值的基类
classdef Base_Interp < handle
    properties       %属性,x0,y0,多项式,n
        m_x0 = nan;
        m_y0 = nan;
        m_polynomial = nan; %保存多项式信息
        m_coef = nan;            %保存多项式系数
        m_n = nan;                 %保存插值多项式的个数
    end
    
    methods
        % 初始构造
        function obj = Base_Interp(x0,y0)
             % 保证插值的顺序
            [x0,ind]  = sort(x0);
            y0(ind) = y0;
              
            obj.m_x0 = x0;
            obj.m_y0 = y0;
        end
        
        % 返回预测值
        function y_pre = Interp(obj,x)
            y_pre = polyval(obj.m_coef,x);
        end
        
        % 数据可视化
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
