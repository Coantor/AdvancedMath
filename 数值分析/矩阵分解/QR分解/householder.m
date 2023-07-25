function [H] = householder(w)
% householder ¾ØÕó
n = length(w);
if size(w,1)  == 1
     H = eye(n,n) - 2 * w' * w ./ sum(w.^2);
elseif size(w,2) == 1
    H = eye(n,n) - 2 * w * w' ./ sum(w.^2);
else 
    warning("w³öÏÖ´íÎó");
end

end

