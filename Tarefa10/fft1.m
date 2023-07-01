% Implemente uma função que receba N amostras de um sinal e devolva a sua 
% DFT calculada usando o algoritmo de decimarão no tempo.
% José Joseilton dos Santos Souza - 118111104
function Xk = fft1(xn,N)
    if length(xn) ~= N % N --> zero padding (x[n] = 0, L <= n <= N-1)
        for z = (length(xn)+1):N % Acrescenta zeros a partir da última posição [1 2 ... N] 
            xn(z) = 0;
        end
    end 
    
    Xk = zeros(N,1); % Cria uma vetor Nx1 posições
    if mod(N,2) == 0 % Verifica se o resto da divisão por 2
        Wn = exp(-i*2*pi*((0:N/2-1)/N)); % Exponencial de ponderação
        Xe = fft1(xn(1:2:end),N/2); % Par -> Chamando a propria função fft1()
        Xo = fft1(xn(2:2:end),N/2); % Impar -> Chamando a propria função fft1()
        for r = 1:(N/2)
           Xk(r,1) = Xe(r,1) + Wn(r)*Xo(r,1); 
           Xk(r+(N/2),1) = Xe(r,1) - Wn(r)*Xo(r,1);
        end
    else
         Xk = xn;        
    end
end

