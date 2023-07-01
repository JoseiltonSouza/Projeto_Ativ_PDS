%% Comparação FFT e Convolução
% José Joseilton dos Santos Souza - 118111104
% Seja o sinal x(n)=cos(2πn/21) que é adicionado a interferência 
% η(n)=0,2∗(−1)nδ(n) produzindo r(n)=x(n)+η(n).Implemente a convolução 
% de r(n) com o filtro h(n)=12δ(0)+12δ(1) usando o método Overlapp-Add, 
% em seguida use a FFT para implementar a mesma convolução. Compare os 
% tempos de execução dos dois métodos.

clc;
clear all;
close all;

format short

Am = 5096; % Números de amostras 

rn = (cos((2*pi/21)*(0:Am-1)))+0.2*(-1).^(0:Am-1); % η(n) + x[n]
hn = [1/2 1/2]; % Filtro h(n)

IDFT = (fft(rn,Am)) .* (fft(hn,Am)); % Teste
rrr = ifft(IDFT); % Teste 

N = 2^ceil(log2(5096));
tic
R = fft1(rn,N); % FFT de r(n)
H = fft1(hn,N); % FFT de h(n)
Y = (R.*H); % Y = R*H 


Wn = exp((-j*2*pi)/N); % Exponencial de ponderação
F = zeros(N,N); % Cria uma matriz NxN
% 
for n = 0:N-1
    for k = 0:N-1
        F(n+1,k+1) = ((1/N)*Wn^(-n*k)); % IDFT matriz NxN
    end
end

y = (F*Y)';
toc

figure(1)
stem(abs(R));
xlabel('n');
ylabel('|R(e^{j\omega})|');
title('FFT de r(n) = x(n)+\eta(n), N=');
grid on
% 
figure(2)
stem(abs(H));
xlabel('n');
ylabel('|H(e^{j\omega})|');
title('FFT de  h(n) = 1/2\delta(0)+1/2\delta(1), N=',N);
grid on

figure(3)
stem(abs(Y));
xlabel('n');
ylabel('|Y(e^{j\omega})|');
title('FFT de  Y = R \cdot H');
grid on


figure(4)
subplot(2,1,1)
stem(rrr);
xlabel('n');
ylabel('y');
title('Usando a função iftt do Matlab');
xlim([0 250]);
grid on

subplot(2,1,2)
stem(y);
xlabel('n');
ylabel('y');
title('Usando a IDFT matricial');
xlim([0 250]);
grid on




