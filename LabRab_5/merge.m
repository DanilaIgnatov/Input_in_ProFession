function F = merge(A, B, y, x)
    for i = 1:size(A,1)
        for j = 1:size(A,2)
            if (A(i,j)<1)
                B(i+x, j+y) = A(i,j);
            end
        end
    end
    F = B;
end