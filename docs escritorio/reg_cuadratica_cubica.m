%regresion cuadratica
clc, clear all, close all;
%datos
x = [3 4 5 7 8 9 11 12];
y = [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6];

%x=[0.75 2 3 4 6 8 8.5];
%y=[1.2 1.95 2 2.4 2.4 2.7 2.6];

%calculos
n = size(x,2);
sumX = sum(x);
sumX2 = sum(x.^2);
sumX3 = sum(x.^3);
sumX4 = sum(x.^4);
sumY = sum(y);
sumXY = sum(x.*y);
sumX2Y = sum(x.^2.*y);


A = [n sumX sumX2;sumX sumX2 sumX3;sumX2 sumX3 sumX4];
B = [sumY;sumXY;sumX2Y];
U = inv(A)*B;
a_0 = U(1,1);
a_1 = U(2,1);
a_2 = U(3,1);
Yreg_2 = inline('a_0 + a_1*x + a_2*x.^2');

prom = mean(y);
Sr = sum((y-a_0-a_1*x-a_2*x.^2).^2);
St = sum((y-prom).^2);
r2 = (St-Sr)/St;
r  = r2^(0.5);

%salida 
fprintf('\t\t\t REGRESION CUADRATICA\n')
fprintf('Los datos son:\n')
fprintf('X=\n')
fprintf(' %1.1f',x)
fprintf('\nY=\n')
fprintf(' %1.1f',y)
fprintf('\n\n')
fprintf('________________________________________')
fprintf('\nLa ecuacion cuadratica es:\n')
fprintf('Yreg_2 = %1.4f %1.4fx + %1.4fx^2\n\n',a_0,a_1,a_2)
fprintf('________________________________________\n')
fprintf('DATOS: \n')
fprintf('Sr = %1.4f\n',Sr)
fprintf('St = %1.4f\n',St)
fprintf('r^2 = %1.4f\n',r2)
fprintf('r = %1.4f\n',r)


%graficas
plot(x,y,'ob')
hold on
xlabel('abcisas')
ylabel('ordenadas')
title('grafica X Vs. Y')
axis([1 13 1 7])
%axis([1 14 Yreg_2(a_0,a_1,a_2,1) Yreg_2(a_0,a_1,a_2,14)])
X_cal = 1:0.05:14;
plot(X_cal,Yreg_2(a_0,a_1,a_2,X_cal),'-b');
legend('puntos experimentales','regresión cuadrática')
text(5,6,'Yreg_2 = 3.0323 -0.1005x + 0.0159x^2')
text(5,5.5,'r^2 = 0.1976')
text(5,5,'r = 0.4445')

%polyfit(x,y,grado de regresion)
%corr2(x,y)


