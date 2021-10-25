function y = ForwardSubs( L, b, m )
    y(1,1)= b(1)./L(1,1);
    for i=2:m
        temp = 0;
        for k=1:i-1
            temp = temp + L(i,k).*y(k);
        end
        y(i,1) = (b(i)-temp)./L(i,i);
    end
end