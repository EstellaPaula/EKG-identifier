function [A]= vector_caract(S)

A = zeros(8,1);   %A este vectorul caracteristic

Fs = 500;   % frecventa
T = 1/Fs;   % perioada
L = 5000;   % lungime semnal
t = (0:L-1)*T;   % vectorul reprezentat timp

f = Fs*(0:(L/2))/L;

Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

n = length(P1);    % de aici incepe construirea efectiva a vectorului caracteristic
amplitudine = zeros(n,1);

amplitudine = sort(P1, 'descend');      %vector sortat descrescator al vectorului amplitudine

k = 0;
g = 1;
for j = 1:2:8
    maxim = amplitudine(g);
    A(j) = amplitudine(g);
    g = g+1;
    for i = 1:n
        if(maxim == P1(i))
            k = i;
            break;
        end
    end
    A(j+1) = f(k);
end
%disp(A);

end