function [x,f,g] = G7(x)
% This is a user-defined evaluation function
% Input 'x' is a row vector denoting the decision vector of a solution
% Output 'x' denotes the repaired decision vector of the solution
% Output 'f' denotes all the objective values of the solution
% Output 'g' denotes all the constraint values of the solution

    x    = max(min(x,10),-10);
    
    f(1) = x(1)^2+x(2)^2+x(1)*x(2)-14*x(1)-16*x(2)+(x(3)-10)^2+...
    4*(x(4)-5)^2+(x(5)-3)^2+2*(x(6)-1)^2+5*x(7)^2+...
    7*(x(8)-11)^2+2*(x(9)-10)^2+(x(10)-7)^2+45;

    g(1) = 4*x(1)+5*x(2)-3*x(7)+9*x(8)-105;
    g(2) = 10*x(1)-8*x(2)-17*x(7)+2*x(8);    
    g(3) = -8*x(1)+2*x(2)+5*x(9)-2*x(10)-12; 
    g(4) = 3*(x(1)-2)^2+4*(x(2)-3)^2+2*x(3)^2-7*x(4)-120;      
    g(5) = 5*x(1)^2+8*x(2)+(x(3)-6)^2-2*x(4)-40;
    g(6) = 0.5*(x(1)-8)^2+2*(x(2)-4)^2+3*x(5)^2-x(6)-30; 
    g(7) = x(1)^2+2*(x(2)-2)^2-2*x(1)*x(2)+14*x(5)-6*x(6);       
    g(8) = -3*x(1)+6*x(2)+12*(x(9)-8)^2-7*x(10); 
end

% Number of variables: 10 variables.
% Search Space: −10 ≤ xi ≤ 10, i = 1, 2, . . . , 10.
% The global minima: x*=(2.171996, 2.363683, 8.773926, 5.095984, 0.9906548, 1.430574,1.321644, 9.828726, 8.280092, 8.375927),
% f(x*) = 24.3062091.