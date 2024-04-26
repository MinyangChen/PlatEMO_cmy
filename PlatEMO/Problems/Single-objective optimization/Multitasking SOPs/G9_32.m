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
    g(1) = v1+3*v2^2+x(3)+4*x(4)^2+5*x(5)-127 - 3;
    g(2) = 7*x(1)+3*x(2)+10*x(3)^2+x(4)-x(5)-282 + 3;
    g(3) = 23*x(1)+v2+6*x(6)^2-8*x(7)-196 - 3;
    g(4) = 2*v1+v2-3*x(1)*x(2)+2*x(3)^2+5*x(6)-11*x(7) + 3;
end

% r Number of variables: 15 variables.
% Search Space: −10 ≤ xi ≤ 10, i = 1, 2, . . . , 7.
% The global minima: x∗ = (0.822257714012413,1.73855627199062,-0.0323176454987845,3.72454923627787,-0.65883623176337,-1.97493520137118,3.01349758241458,5.79868834289578,9.56040618108473,0.000137754775452648,9.00000171666629,0.00143216246289502,10,3.86089185558369,9.99999999999994), 
% f (x∗) = -176.26768604601