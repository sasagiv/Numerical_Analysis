function [x, NumIters] = Newton( f, df, x0,TOL,MaxIters )
        mStop = 0;
        NumIters = 0;
        x = x0;
        while NumIters < MaxIters && mStop == 0
            NumIters = NumIters +1;
            prev = x;
            x = x - (f(x)./df(x));
            if abs(f(prev)) < TOL && abs(x-prev) < TOL
                mStop = 1;
            end

        end  
end