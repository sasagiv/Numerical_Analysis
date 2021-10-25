function [N,x,tf] = prob4(m)
    h = 70./(m-1);
    I = eye(m,m);
    for i=1:m
        x(1,i) = -7 + (i-1).*(h/5);
        y(1,i) = (i-1)*h;
        f(1,i) = 0.5-(1./pi).*atan(x(1,i));
    end
    for i=1:m
        for j=1:m
            K(i,j) = 1./(pi + pi.*(x(1,i)-y(1,j)).^2);
        end
    end
    for i=1:m
        for j=1:m
            A(i,j) = I(i,j)-5.*h.*K(i,j);
        end
    end
    t0 = cputime;
    tic
    [L,U,P] = LUdecomp(A,m);
    y = ForwardSubs(L,P.*f,m);
    N = BackwardSubs(U,y,m);
    tf = cputime-t0;
    toc
end