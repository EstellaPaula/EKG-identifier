function F = signal_filter(S)

    size = 10;
    b = (1 / size) * ones(1,size);
    a = 1;
    F = filter(b,a,S);

end