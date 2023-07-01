%% Processamento Digital de Sinais  
% Implementação de uma DFT usando a representação matricial
% José Joseilton dos Santos Souza - 118111104
% Usando a representação matricial apresentada em sala, implemente uma 
% função que receba um vetor de N amostras de um sinal (o valor de N 
% pode ser definido a pior) e devolva a DFT desse sinal.
clc;
clear all;
close all; 

format short
%% Exemplo: x[n] = 1, n = 1,2,...,8; x[n] = 0, c.c. 

xn = [0 .5 1.5 2 2.5 3 3.5 0] % Sinal x[n]
% xn = [0 .5 1.5 2 2.5 3 3.5]; % ones(8,1) % Sinal x[n]
N = 1024; 

%% Transformada Discreta de Fourier

% x[n] tem L valores,   0 <= n <= L
% X[k], 0 <= n <= N-1 
% N = 2^l, sendo l um inteiro positivo

n = 0:1:N-1; % Índice de x[n]
k = 0:1:N-1; % Índice de X[k]

if length(xn) ~= N % Caso o tamanho de x[n] seja menor que N --> zero padding (x[n] = 0, L <= n <= N-1)
    for r = (length(xn)+1):N
        xn(1,r) = 0;
    end
end

Wn = exp((-j*2*pi)/N); % Exponencial de ponderação

F = zeros(N,N); % Cria uma matriz NxN


for i = 0:N-1
    for j = 0:N-1
        F(i+1,j+1) = Wn^(i*j); % DFT matriz NxN
    end
end

Xk = F * xn' % coeficientes da DFT


a =  fft1(xn,N);
% stem(xn)
figure(1)
subplot(2,1,1);
stem(abs(Xk));
title('DFT usando representação matricial (N=64)');
grid on
subplot(2,1,2);
stem(abs(a))
title('DFT usando decimação no tempo (N=64)');
grid on

v1 = [2:N-1].^2;
v2 = [2:N-1].*log2([2:N-1]);
n = 2:N-1;
figure(2)

plot(n,v1,n,v2,'LineWidth',2)
title('Complexidade do calculo da DFT (N=1024)');
xlabel('N')
ylabel('O(\cdot)')
legend('O(N^2)','O(N \cdot log_2N)')
grid on





