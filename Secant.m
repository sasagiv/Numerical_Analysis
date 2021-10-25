function [x, NumIters] = Secant( f, x0, x1,TOL,MaxIters )
        mStop = 0;
        NumIters = 1;
        x = x1;
        prev = x0;
        while NumIters < MaxIters && mStop == 0
            NumIters = NumIters +1;
            temp = x;
            x = x - f(x)*((f(x)-f(prev))./(x-prev))^(-1);
            prev= temp;
            if abs(f(prev)) < TOL && abs(x-prev) < TOL
                mStop = 1;
            end

        end  
end