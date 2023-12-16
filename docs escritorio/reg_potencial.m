clc, clear all, close all;
%datos
%x = [1 2 3 4 5];
%y = [0.5 1.7 3.4 5.7 8.4];
%y = [10 15 20 25 30 35 40 45 50 55 60];
%x = [1.3897 1.8036 1.9891 2.1903 2.6036 2.7222 2.9073 2.9575 3.2372 3.2949 3.2943];
x = [0.0054 0.0118 0.0142 0.0236 0.0275 0.0364 0.0348 0.0405 0.0447 0.0577];
y = [10 20 30 40 50 60 70 80 90 100];
%variables
n = size(x,2);
u = log10(x);
w = log10(y);
A = [n sum(u); sum(u) sum(u.^2)];
B = [sum(w); sum(u.*w)];
sol = inv(A)*B;
a_0 = sol(1,1);
a_1 = sol(2,1);
alpha = 10^(sol(1,1));
beta = sol(2,1);
St = sum((w-mean(w)).^2);
Sr = sum((w-sol(1,1)-sol(2,1)*u).^2);
r2 = (St-Sr)/St;
r = r2^(0.5);

Wreg_2 = inline('a_0 + a_1*u');
Yreg_2 = inline('alpha * x.^(beta)');
%salida 
fprintf('\t\t\t REGRESION POTENCIAL\n')
fprintf('Los datos son:\n')
fprintf('X=')
disp(x)
fprintf('Y=')
fprintf('   %1.0f',y)
fprintf('\n_________________________________________________________')
fprintf('\n\n')
fprintf('La ecuacion lineal es:\n')
fprintf('Wreg = %1.4f + %1.4fu\n\n',sol(1,1),sol(2,1))
fprintf('La ecuacion potencial es:\n')
fprintf('F = %1.4f*x^(%1.4f)\n\n',alpha, beta)
fprintf('_________________________________________________________')
fprintf('\n\tDatos:\n\n')
fprintf('Sr = %1.4f\n',Sr)
fprintf('St = %1.4f\n',St)
fprintf('r^2 = %1.4f\n',r2)
fprintf('r = %1.4f\n',r)
g = 2*alpha;
fprintf('k = %1.4f[N/m]\n',alpha)

%graficas
figure(1)
plot(u,w,'ob')
hold on
xlabel('abcisas')
ylabel('ordenadas')
title('grafica U Vs. W')
axis([min(u)-0.01 max(u)+0.01 min(w)-1 max(w)+1])
%axis([1 14 Yreg_2(a_0,a_1,a_2,1) Yreg_2(a_0,a_1,a_2,14)])
u_cal = min(u)-1:0.05:max(u)+1;
plot(u_cal,Wreg_2(a_0,a_1,u_cal),'-b');
legend('puntos experimentales','regresion lineal transformada')
text(-1.6,1,'Wreg = -0.3002 + 1.7517u')
text(-1.6,0.7,'r = 1.0000')

figure(2)
plot(x,y,'ob')
hold on
xlabel('abcisas')
ylabel('ordenadas')
title('grafica X Vs. Y')
axis([min(x)-0.05 max(x)+0.05 min(y)-1 max(y)+20])
%axis([1 14 Yreg_2(a_0,a_1,a_2,1) Yreg_2(a_0,a_1,a_2,14)])
x_cal = min(x)-0.05:0.05:max(x)+10;
plot(x_cal,Yreg_2(alpha,beta,x_cal),'-b');
legend('puntos experimentales','regresion potencial transformada')
text(0.06,40,'Yreg = 0.5009*x^(^1^.^7^5^1^7^)')
text(0.06,30,'r = 1.0000')

%polyfit(x,y,grado de regresion)
%corr2(x,y)
