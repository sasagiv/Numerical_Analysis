function [x, NumIters] = Bisection( f,a,b,TOL,MaxIters )
    if f(a)*f(b) < 0
        mStop = 0;
        NumIters = 0;
        while NumIters < MaxIters && mStop == 0
            NumIters = NumIters +1;
            x = (a+b)./2;
            if (b-a)./2 < TOL && abs(f(x)) < TOL
                mStop = 1;
            end
            if f(a)*f(x) < 0
                b = x;
            else
                a = x;
            end
        end
    end   
end