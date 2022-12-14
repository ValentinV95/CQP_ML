function Choi_eigvs_normalize(filename_choi,filename_choi_norm)
    load(filename_choi);
    
    N = 4;
    
    if (N ~= sqrt(size(choi, 2))
        disp("Bad size")
    else
        bas =[ 1   1   1  1;
               1  -1  -1  1;
              -1   1  -1  1;
              -1  -1   1  1] * 0.5;
        choi(:, 1:4) = real(bas*(choi(:, 1:4)-1/2)')';
        choi(:, 5:16) = choi(:, 5:16)/4;
        choi = choi(:, 2:16);
        save(filename_choi_norm, 'choi');
    end
end

