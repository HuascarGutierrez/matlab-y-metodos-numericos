clc, clear all,close all;
%regresion lineal
%x = [3.15 3.33 3.88 4.15 5.11 6.08 6.39 7.01 7.58 7.88 7.99 8.15 8.35];
%y = [383.51 383.11 382.42 381.87 380.84 380.12 379.85 379.08 378.61 378.08 377.75 377.44 377.11];

%x=[0 2 4 6 9 11 12 15 17 19];
%y=[5 6 7 6 9 8 7 10 12 12];

%x=[6 7 11 15 17 21 23 29 29 37 39];
%y=[29 21 29 14 21 15 7 7 13 0 3];

x = [3 4 5 7 8 9 11 12];
y = [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6];

n= size(x,2);
%datos
a_0 = (sum(x.^2)*sum(y)-sum(x.*y)*sum(x))/(n*sum(x.^2)-sum(x)^2);
a_1 = (n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.^2)-sum(x)^2);
Sr = sum((y-a_0-a_1*x).^2);
St = sum((y-mean(y)).^2);
r2 = (St-Sr)/St;
r = r2^(0.5);

y_cal = inline('a_0 + a_1 *x');
%salida
fprintf('\t\t\t REGRESION LINEAL\n')
fprintf('Los datos son:\n')
fprintf('X=')
disp(x)
fprintf('Y=')
fprintf('   %1.1f',y)
fprintf('\n_________________________________________________________')
fprintf('\n\n')
fprintf('La ecuacion lineal es:\n')
fprintf('Yreg = %1.4f + %1.4fx\n\n',a_0,a_1)
fprintf('_________________________________________________________')
fprintf('\n\tDatos:\n\n')
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
axis([1 13 0 7])
%axis([5 40 y_cal(a_0,a_1,40)-1 y_cal(a_0,a_1,5)+2])
X_cal = 1:0.05:13;
plot(X_cal,y_cal(a_0,a_1,X_cal),'-b');
legend('puntos experimentales','regresion lineal')
text(8,2,'Yreg = 2.2917 + 0.1367x')
text(8,1.5,'r^2 = 0.1817')
text(8,1,'r = 0.4263')


