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

tic
N = 1024;
xn = [0 .5 1.5 2 2.5 3 3.5 0]; % Sinal x[n]

if length(xn) ~= N % N --> zero padding (x[n] = 0, L <= n <= N-1)
    for r = (length(xn)+1):N
        xn(1,r) = 0;
    end
end


xe = xn(1:2:length(xn)); % par
xo = xn(2:2:length(xn)); % Impar

Wn = exp((-j*2*pi)/N); % Exponencial de ponderação

Xk = zeros(N,1); % Cria uma vetor Nx1 posições


for i = 1:N 
    for a = 1:(N/2)
        X = xe(1,a)*Wn^(2*(i-1)*(a-1)) + Wn^(i-1)*(xo(1,a)*Wn^(2*(i-1)*(a-1))); % DFT 
        Xk(i,1) = Xk(i,1) + X;
    end
end
toc
Y1 = Xk



tic
Y = fft1(xn,N)
toc
% a =  fftn(xn);
%stem(xn)
figure(1)
subplot(2,1,1);
stem(abs(Xk));
title('DFT usando representação matricial, N=',N);
grid on
subplot(2,1,2);
stem(abs(Y))
title('DFT usando a funação fft1() do Matlab , N=',N);
grid on



