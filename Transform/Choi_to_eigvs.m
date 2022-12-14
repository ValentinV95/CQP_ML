function Choi_to_eigvs(filename_Choi,filename_eigvs)
    load(filename_Choi);
    
    N = sqrt(size(choi,2));
    
    eigv = zeros(length(choi), N*N);
    for k=1:length(choi)
        b = zeros(N*N, 1);
        b(:) = choi(k, :);
        b1 = zeros(N, N);
        
        %if Choi real
        for i = 1:N
            for j = 1:N
                if (i == j)
                    b1(i,j) = b((i-1)*N+j);
                else
                    if (i>j)
                        b1(i,j) = (b((i-1)*N+j) - sqrt(-1)* b((j-1)*N+i));
                    else
                        b1(i,j) = (b((j-1)*N+i) + sqrt(-1)* b((i-1)*N+j));
                    end
                end
            end
        end
        
        %if Choi full
        %b1 = reshape(b', [N N]);
        
        [v,e] = eig(b1);
        eigv(k, 1:N) = real(diag(e));
        sph = hypersphere(v);
        rsph = reshape(sph, [], 1);
        for i = 1:N
            eigv(k, N + 1 + (i-1)*(N - 1) : N + i*(N - 1)) = rsph(N + 2*(i - 1)*(N - 1) : 2*N - 2 + 2*(i - 1)*(N - 1));
        end
    end
    choi = eigv;
    save(filename_eigvs, 'choi');
end

