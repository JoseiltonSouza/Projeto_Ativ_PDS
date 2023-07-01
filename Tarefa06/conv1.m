%% Implementação da Convolução Linear
% José Joseilton dos Santos Souza - 118111104
% Seja o sinal  x(n)=cos(2πn/21) que é adicionado a interferência 
% η(n)=0,2∗(−1)nδ(n) produzindo r(n)=x(n)+η(n). Implemente a  convolução 
% usando o método Overlapp-Add de r(n) com o filtro h(n)=12δ(0)+12δ(1), 
% pelo menos 5096 amostras de $r(n)$ sendo processadas em blocos de M0=128. 
% Desenhe em um mesmo gráfico r(n) e o resultado da convolução.

function y = conv1(x,h)

    hn = [h zeros(1,length(x)-1)]; % Com M-1 zeros
    xn = [x zeros(1,length(h)-1)]; % com L-1 zeros
    N = length(h)+length(x)-1; % A condição N >= M+L-1
    y = zeros(1,length(xn)); % Inicilaiza o vetor y com n-zeros
    
    for n = 1:N
        for m = 1:N
            y(n) = y(n) + xn(m) * hn(mod(n - m, N)+1);
        end
    end
end
