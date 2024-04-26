function [x,f,g] = G9(x)
% This is a user-defined evaluation function
% Input 'x' is a row vector denoting the decision vector of a solution
% Output 'x' denotes the repaired decision vector of the solution
% Output 'f' denotes all the objective values of the solution
% Output 'g' denotes all the constraint values of the solution

    x    = max(min(x,10),-10);
    
    f(1) = (x(1)-10)^2+5*(x(2)-12)^2+x(3)^4+3*(x(4)-11)^2+...
    10*x(5)^6+7*x(6)^2+x(7)^4-4*x(6)*x(7)-10*x(6)-8*x(7);

    v1 = 2*x(1)^2;
    v2 = x(2)^2;
    g(1) = v1+3*v2^2+x(3)+4*x(4)^2+5*x(5)-127;
    g(2) = 7*x(1)+3*x(2)+10*x(3)^2+x(4)-x(5)-282;
    g(3) = 23*x(1)+v2+6*x(6)^2-8*x(7)-196;
    g(4) = 2*v1+v2-3*x(1)*x(2)+2*x(3)^2+5*x(6)-11*x(7);
end

% r Number of variables: 7 variables.
% Search Space: −10 ≤ xi ≤ 10, i = 1, 2, . . . , 7.
% The global minima: x∗ = (2.330499, 1.951372,−0.4775414, 4.365726,−0.6244870, 1.038131,1.594227), f (x∗) = 680.6300573.