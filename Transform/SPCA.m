function test = sPCA_for_Choi(filename_data,filename_labels, filename_v,filename_d)
    load(filename_data);  %file with var choi
    data = choi;
    load(filename_labels);  %file with var answers
    labels = answers';

    nComp = 15;
    kind = 'norm';

    %Mirkes, E.M., Gorban, A.N., Zinoviev, A. Supervised PCA. 2016. Available online: https://github.com/Mirkes/SupervisedPCA (accessed on 20.07.2022).
    [ V, D ] = SupervisedPCA( data, labels, nComp, kind );
    
    save(filename_v, 'V');
    save(filename_d, 'D');
end
