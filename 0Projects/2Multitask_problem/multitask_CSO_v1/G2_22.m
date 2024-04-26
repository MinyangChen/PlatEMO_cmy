function [x,f,g] = G2(x)
% This is a user-defined evaluation function
% Input 'x' is a row vector denoting the decision vector of a solution
% Output 'x' denotes the repaired decision vector of the solution
% Output 'f' denotes all the objective values of the solution
% Output 'g' denotes all the constraint values of the solution

    x = max(min(x,10), 0);
    n = length(x);
    sum_jx = 0;

    for j=1:n
        sum_jx = sum_jx+j*x(j)^2;
    end

    f(1) = abs((sum(cos(x).^4)-2*prod(cos(x).^2))/sqrt(sum_jx));

    g(1) = -prod(x)+0.75 - 2;
    g(2) = sum(x)-7.5*n + 2;
    g(3) = sum(abs(x)) - 15 - 2;
end

% n = 15

% best solution
% 0.964745458078867,0.969703695800395,0.975189671256178,0.979296160663619,0.984635247506312,0.990530881256487,0.99440474128775,0.999391155418429,1.00401440179624,1.00934390606604,1.01501336071228,1.02041187379247,1.02567055586281,1.03061182469392,1.03703706580817,
% y* = 0.116003988387987
