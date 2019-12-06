t = 0:0.01:20;

suma = 0;

%verificare semnale filtrate


for i = 1:90
    sound = load(strcat('D:\LUCRU\FAQ\TS\tema1\ECG-DB\Person_', strcat(num2str(i), strcat('\','rec_1m.mat'))));
    S = sound.val(2,:);
    
    id = ecg_function(S,0);
    
    if(i == id)
        suma = suma + 1;
    end
end
for i = 1:90
    sound = load(strcat('D:\LUCRU\FAQ\TS\tema1\ECG-DB\Person_', strcat(num2str(i), strcat('\','rec_2m.mat'))));
    S = sound.val(2,:);
    
    id = ecg_function(S,1);
    
    if(i == id)
        suma = suma + 1;
    end
end

disp('Procentaj semnale filtrate (raw = 0)');
x = suma * 100 / 180;
disp(x);


%verificare semnale nefiltrate

suma = 0;

for i = 1:90
    sound = load(strcat('D:\LUCRU\FAQ\TS\tema1\ECG-DB\Person_', strcat(num2str(i), strcat('\','rec_1m.mat'))));
    S = sound.val(1,:);
    
    id = ecg_function(S,1);
    
    if(i == id)
        suma = suma + 1;
    end
end
for i = 1:90
    sound = load(strcat('D:\LUCRU\FAQ\TS\tema1\ECG-DB\Person_', strcat(num2str(i), strcat('\','rec_2m.mat'))));
    S = sound.val(1,:);
    
    id = ecg_function(S,1);
    
    if(i == id)
        suma = suma + 1;
    end
end

disp('Procentaj sunete nefiltrate (raw =1)');
x = suma * 100 / 180;
disp(x);


