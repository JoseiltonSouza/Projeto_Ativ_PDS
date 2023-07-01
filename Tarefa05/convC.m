%% Implementação da Convolução Linear
% José Joseilton dos Santos Souza - 118111104
% Seja o sinal  x(n)=cos(2πn/21) que é adicionado a interferência 
% η(n)=0,2∗(−1)^nδ(n) produzindo r(n)=x(n)+η(n). Implemente a  convolução 
% usando o método Overlapp-Add de r(n) com o filtro h(n)=12δ(0)+12δ(1), 
% pelo menos 5096 amostras de $r(n)$ sendo processadas em blocos de M0=128. 
% Desenhe em um mesmo gráfico r(n) e o resultado da convolução.

clc;
clear all;
close all;

format short
%% *Convolução Circular* - Método Overlapp and add

% Sinal   x(n) = cos(2πn/21) 
% Interferência  η(n)=0,2*(−1)n*δ(n)
% r(n)=x(n)+η(n)
% Filtro h(n) = 1/2δ(0)+1/2δ(1)

Am = 5096; % Números de amostras 
Mo = 128; % Dividir r(n) em blocos de M0
Am1 = 5120;
rn = (cos((2*pi/21)*(0:Am1-1)))+0.2*(-1).^(0:Am1-1); % η(n) + x[n]
h_n = [1/2 1/2]; % Filtro h(n

% Divide o vetor x(n) em uma matriz de 40 x 128
r_n = zeros(ceil(Am/Mo),Mo); % Inicialiaza o vetor rn(x) com zeros
a = 0;
for k = 1:ceil(Am/Mo) % Calcula os pontos da função r(n)=x(n)+η(n)
   for j = 1:Mo
       r_n(k,j) = (cos((2*pi/21)*a))+(0.2*(-1).^a);  
       a = a + 1;
   end
end

 
[numRows,numCols] = size(r_n); % Retorna o número de colunas e linhas

Q = cconv(rn,h_n); % Teste [r_n(1,:) r_n(2,:)]

y = zeros(1,numRows*numCols+1); % Inicializa o vetor com zeros

for i = 1:numRows % Método Overlapp and add 
    a = (i-1)*numCols;
    y(a+1:a+numCols+1) = y(a+1:a+numCols+1) + conv1(r_n(i,:),h_n); 
end


figure(1)

subplot(2,1,1)
stem(y,'g');
title('Sinal convoluído r(n) * h(n)');
xlim([0 250]);
grid on;

subplot(2,1,2)
stem(rn,'m')
title('Sinal r(n) = x(n)+\eta(n)');
xlim([0 250]);
grid on;


figure(2)
hold on
stem(rn,'m')
stem(y,'g');
title('Convolução circular');
legend('r(n) = x(n)+\eta(n)','r(n) * h(n)');
xlim([0 250]);
grid on
hold off

