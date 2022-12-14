function [sph] = hypersphere(coord)

    s = size(coord);
    sph = zeros(2*s(1) - 2, s(2));
    for i = 1:s(2)
        rcoord = cat(1, real(coord(:,i)), imag(coord(:,i)))/norm(coord(:,i));
        rs = size(rcoord);
        coeff = (rcoord(rs(1)))^2 + (rcoord(rs(1)-1))^2;
        if (abs(rcoord(rs(1))) > 1e-10)
            sph(1, i) = (atan(-(rcoord(rs(1)-1) + sqrt(coeff))/rcoord(rs(1))) + pi/2) / pi;
        else
            sph(1, i) = 0.0;
        end
        for j = 2:rs(1)-1
            if( abs(coeff) < 1e-10)
                sph(j-1, i) = 0.0;
            else
                sph(j-1, i) = (atan(-rcoord(rs(1) - j)/sqrt(coeff)) + pi/2) / pi;
            end
            coeff = coeff + rcoord(rs(1) - j)^2;
        end
        if (abs(rcoord(1)) > 1e-10 && abs(cos(pi*sph(rs(1)-2, i)))>1e-10)  
            if(abs(abs(rcoord(1)/cos(pi*sph(rs(1)-2, i))) - 1) > 1e-5)
                print('norm alert');
            else
                sph(rs(1), i) = rcoord(1)/cos(pi*sph(rs(1)-1, i));
            end
        end
    end
end

