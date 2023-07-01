%% Projeto filtros FIR
% José Joseilton dos Santos Souza - 118111104
% No arquivo  sinal.wav  foi gravado um sinal composto de soma de cossenos 
% amostrados a uma frequência de 16 kHz. Deseja-se conhecer quantas  
% componentes (cossenos) formam esse sinal;
% Também foi solicitado um sistema que separe as componentes do sinal gravado.
clc;
clear all;
close all;

format short

clc;
clear all;
close all;

format short

N = 2^13;
[y Fs] = audioread('sinal_1.wav');

t = (0:length(y)-1)/Fs; % Vetor de tempo

% Plot do sinal original
figure(1)
plot(t, y);
title('Sinal Original');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0, 0.05]);

% Análise Espectral Usando a FFT
Y = fft1(y,N);
Y1 = fft(y);
figure(2)
stem(abs(Y));
title('Sinal Original')
ylabel('|X[k]|');
xlabel('k');
xlim([0, N]);

% F  = (k*Fs)/N 

% Usando a função designfilt e projetando os filtros FIR
% Filtro PassaFaixa - fc ~= 4001,95 Hz
pbFilt1 = designfilt('bandpassiir','FilterOrder',40, ...
         'HalfPowerFrequency1',3991,'HalfPowerFrequency2',4011, ...
         'SampleRate',16000); 
% fvtool(pbFilt1) % A resposta em frequência do filtro 

y11 = filter(pbFilt1,y); % Fazendo a filtragem do sinal

Y11 = fft1(y11,N);
figure(3)
stem(abs(Y11));
ylabel('|X[k]|');
xlabel('k');
title('Sinal-01')
xlim([1000, 7000]);

% Filtro PassaFaixa - fc ~= 2001,95 Hz
pbFilt2 = designfilt('bandpassiir','FilterOrder',30, ...
         'HalfPowerFrequency1',1996,'HalfPowerFrequency2',2006, ...
         'SampleRate',16000); 
% fvtool(pbFilt2) % A resposta em frequência do filtro 

y12 = filter(pbFilt2,y); % Fazendo a filtragem do sinal

Y12 = fft1(y12,N);
figure(4)
stem(abs(Y12));
ylabel('|X[k]|');
xlabel('k');
title('Sinal-02')
xlim([500, 7500]);

% Filtro PassaFaixa - fc ~= 841,80 Hz
pbFilt3 = designfilt('bandpassiir','FilterOrder',30, ...
         'HalfPowerFrequency1',839,'HalfPowerFrequency2',844, ...
         'SampleRate',16000); 
% fvtool(pbFilt3) % A resposta em frequência do filtro 

y13 = filter(pbFilt3,y); % Fazendo a filtragem do sinal

Y13 = fft1(y13,N);
figure(5)
stem(abs(Y13));
ylabel('|X[k]|');
xlabel('k');
title('Sinal-03')

% Filtro PassaFaixa - fc ~= 642,58 Hz
pbFilt4 = designfilt('bandpassiir','FilterOrder',30, ...
         'HalfPowerFrequency1',640,'HalfPowerFrequency2',645, ...
         'SampleRate',16000); 
% fvtool(pbFilt3) % A resposta em frequência do filtro 

y14 = filter(pbFilt4,y); % Fazendo a filtragem do sinal

Y14 = fft1(y14,N);
figure(6)
stem(abs(Y14));
ylabel('|X[k]|');
xlabel('k');
title('Sinal-04')