function [evals_gamma, choi] = evals_Choi(matricesB, N)

evals_gamma = zeros(length(matricesB), N);
choi = zeros(length(matricesB), N, N);

for i=1:length(matricesB)
    b = zeros(N, N);
    b(:, :) = matricesB(i, :, :);
    L0_gamma = zeros(N);
    for n = 1:sqrt(N)
        for j = 1:sqrt(N)
            for k = 1:sqrt(N)
                for m = 1:sqrt(N)
                
                    origin_row = (n - 1) * sqrt(N) + k;
                    origin_col = (j - 1) * sqrt(N) + m;
                
                    gamma_row = (n - 1) * sqrt(N) + j;
                    gamma_col = (k - 1) * sqrt(N) + m;
                
                    L0_gamma(gamma_row, gamma_col) = b(origin_row, origin_col);
                end
            end
        end
    end

    [vecg, evalg] = eig(L0_gamma/sqrt(N));
    evals_gamma(i, :) = sort(real(diag(evalg)), 'descend');
    choi(i, :, :) = L0_gamma(:,:);
end
end

