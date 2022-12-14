function test = B_to_rChoi(filename_B,filename_rChoi)
    load(filename_B);  %file with var matricesB

    N = = size(matricesB, 2);
    [evals, choiT] = evals_Choi(matricesB, N);
    choi = zeros(length(matricesB), N*N);
    for k=1:length(matricesB)
        b = zeros(N, N);
        b(:, :) = choiT(k, :, :);
        for i = 1:N
            for j = 1:N
                if (i>=j)
                    choi(k,(i-1)*N+j) = real(b(i,j));
                else
                    choi(k,(i-1)*N+j) = imag(b(i,j));
                end
            end
        end
    end
    save(filename_rChoi, 'choi');
end

