function[ person_id ] = ecg_function(input_signal, israw)

k = 1;      %folosit ca index pentru vectorul N
N = zeros(180,1);   %un vector pt diferenta de norme 

if(israw == 1)
    S_input = signal_filter(input_signal);
    for i = 1:90
        sound = load(strcat('D:\LUCRU\FAQ\TS\tema1\ECG-DB\Person_', strcat(num2str(i), strcat('\','rec_1m.mat'))));
        S = sound.val(2,:);
        
        a = vector_caract(S);   %sunet  rec1
        b = vector_caract(S_input);    %semnal input
        
        N(k) = norm(S - S_input);
        k = k + 1;
    end
    for i = 1:90
        sound = load(strcat('D:\LUCRU\FAQ\TS\tema1\ECG-DB\Person_', strcat(num2str(i), strcat('\','rec_2m.mat'))));
        S = sound.val(2,:);
        
        a = vector_caract(S);   %sunet  rec1
        b = vector_caract(S_input);    %semnal input
        
        N(k) = norm(S - S_input);
        k = k + 1;
    end
    
    mat = zeros(length(N),1);
    mat = sort(N);
    
    for i = 1:length(N)
        if(mat(1) == N(i))
            person_id = i;
            break;
        end
    end
    if(person_id > 90)          % aceasta verificare se face deoarece lucram cu doua fisiere per persoana
        person_id = person_id - 90;
    end
end
    
if(israw == 0)
    for i = 1:90
        sound = load(strcat('D:\LUCRU\FAQ\TS\tema1\ECG-DB\Person_', strcat(num2str(i), strcat('\','rec_1m.mat'))));
        S = sound.val(2,:);

        sound = load(strcat('D:\LUCRU\FAQ\TS\tema1\ECG-DB\Person_', strcat(num2str(i), strcat('\','rec_2m.mat'))));
        d = sound.val(2,:);

        a = vector_caract(S);   %sunet  rec1
        b = vector_caract(d);   %sunet rec 2
        c = vector_caract(input_signal);    %semnal input 

        if((norm(a) - norm(c)) == 0)        %vedem diferenta dintre norme pentru fisier rec1.mat
            person_id = i;
            break;
        end
        if((i ~= 74) && ( norm(b) - norm(c)) == 0)  % %vedem diferenta dintre norme pentru fisier rec2.mat
            person_id = i;
            break;
        end
    end
end

end