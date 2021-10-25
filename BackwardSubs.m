function x = BackwardSubs(U, y, m )
    x(m,1)= y(m,1)./U(m,m);
    for i=2:m
        j = m+1-i;
        temp = 0;
        for k=1:i-1
            temp = temp + U(j,m+1-k).*x(m+1-k,1);
        end
        x(j,1) = (y(j,1)-temp)./U(j,j);
    end
end