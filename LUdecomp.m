function [L,U,P] = LUdecomp( A, m )
    U = A;
    L = eye(m,m);
    P = eye(m,m);
    for k=1:m-1
        maxU = -100;
        for j=k:m
            if (abs(U(j,k)) > maxU)
                maxU = abs(U(j,k));
                i = j;
            end
        end
        for n=k:m
            temp = U(k,n);
            U(k,n) = U(i,n);
            U(i,n) = temp;
        end
        for n=1:k-1
            temp = L(k,n);
            L(k,n) = L(i,n);
            L(i,n) = temp;
        end
        for n=1:m
            temp = P(k,n);
            P(k,n)= P(i,n);
            P(i,n) = temp;
        end
        for j=k+1:m
            L(j,k) = U(j,k)./U(k,k);
            for n = k:m
                U(j,n) = U(j,n)-(L(j,k).*U(k,n));
            end
        end

    end
end