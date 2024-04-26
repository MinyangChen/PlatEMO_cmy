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

    g(1) = -prod(x)+0.75;
    g(2) = sum(x)-7.5*n;
end

% n = 20 or other

% best solution
% 1.56667590201002,1.55790771290272,4.74204317189957,7.87583098839048,4.67273742296936,7.87638556735878,4.73816700481982,1.53464831435711,4.74190095879314,4.74009860213119,4.70924222352495,1.55283566392511,7.83408578911515,4.73461476726101,7.88781496297118,4.69851253321308,7.89185586802138,7.86517789728812,7.81437692471831,4.66580923800068,2.06881390648362e-07,-12474290199178.7,-46.2992784863288

% f*
% 1e-8