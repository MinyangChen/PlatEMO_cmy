function [x,f,g] = G1(x)
% This is a user-defined evaluation function
% Input 'x' is a row vector denoting the decision vector of a solution
% Output 'x' denotes the repaired decision vector of the solution
% Output 'f' denotes all the objective values of the solution
% Output 'g' denotes all the constraint values of the solution

% D = 13
    x = max(x, 0);
    x = min(x, [1,1,1,1,1,1,1,1,1,100,100,100,1,1,1]);

    x1 = x(1:4); x2 = x(5:end);
    f(1) = 5*sum(x1)-5*sum(x1.*x1)-sum(x2);

    g(1) = 2*x(1)+2*x(2)+x(10)+x(11)-10 + 2;
    g(2) = 2*x(1)+2*x(3)+x(10)+x(12)-10+x(14) - 2;
    g(3) = 2*x(2)+2*x(3)+x(11)+x(12)-10+x(15) + 2;
    g(4) = -8*x(1)+x(10) - 2;
    g(5) = -8*x(2)+x(11)+x(14) + 2;
    g(6) = -8*x(3)+x(12)+x(15) - 2;
    g(7) = -2*x(4)-x(5)+x(10) + 2;
    g(8) = -2*x(6)-x(7)+x(11)+x(14) - 2;
    g(9) = -2*x(8)-x(9)+x(12)+x(15) + 2;


end

% r Number of variables: 15 variables.
% Search Space: 0 ≤ xi ≤ ui, i = 1, 2, . . . , n, u = (1,1,…,1,100,100,100,1,1,1)
% The global minima: x* = (1,1,…,1,3,2,2,1,1,1), f(x*) = -15.