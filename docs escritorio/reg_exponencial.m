clc, clear all, close all;
%datos
x = [1 2 3 4 5];
y = [0.5 1.7 3.4 5.7 8.4];
%variables
n = size(x,2);
u = x;
w = log(y);
A = [n sum(u); sum(u) sum(u.^2)];
B = [sum(w); sum(u.*w)];
sol = inv(A)*B;
a_0 = sol(1,1);
a_1 = sol(2,1);
alpha = exp(sol(1,1));
beta = sol(2,1);
St = sum((w-mean(w)).^2);
Sr = sum((w-sol(1,1)-sol(2,1)*u).^2);
r2 = (St-Sr)/St;
r = r2^(0.5);

Wreg_2 = inline('a_0 + a_1*u');
Yreg_2 = inline('alpha * exp(beta*x)');
%salida 
fprintf('\t\t\t REGRESION exponencial\n')
fprintf('Los datos son:\n')
fprintf('X=')
disp(x)
fprintf('Y=')
fprintf('   %1.1f',y)
fprintf('\n_________________________________________________________')
fprintf('\n\n')
fprintf('La ecuacion lineal es:\n')
fprintf('Wreg = %1.4f + %1.4fx\n\n',sol(1,1),sol(2,1))
fprintf('La ecuacion potencial es:\n')
fprintf('Yreg = %1.4f*e^(%1.4f*x)\n\n',alpha, beta)
fprintf('_________________________________________________________')
fprintf('\n\tDatos:\n\n')
fprintf('Sr = %1.4f\n',Sr)
fprintf('St = %1.4f\n',St)
fprintf('r^2 = %1.4f\n',r2)
fprintf('r = %1.4f\n',r)

%graficas
figure(1)
plot(u,w,'ob')
hold on
xlabel('abcisas')
ylabel('ordenadas')
title('grafica X Vs. W')
axis([0 6 min(w)-1 max(w)+1])
%axis([1 14 Yreg_2(a_0,a_1,a_2,1) Yreg_2(a_0,a_1,a_2,14)])
u_cal = -0.1:0.05:14;
plot(u_cal,Wreg_2(a_0,a_1,u_cal),'-b');
legend('puntos experimentales','regresion lineal transformada')
text(3,-0.5,'Wreg = -1.0698 + 0.6853x')
text(3,-0.8,'r = 0.9733')

figure(2)
plot(x,y,'ob')
hold on
xlabel('abcisas')
ylabel('ordenadas')
title('grafica X Vs. Y')
axis([0 6 min(y)-1 max(y)+1])
%axis([1 14 Yreg_2(a_0,a_1,a_2,1) Yreg_2(a_0,a_1,a_2,14)])
x_cal = 0.1:0.05:14;
plot(x_cal,Yreg_2(alpha,beta,x_cal),'-b');
legend('puntos experimentales','regresion exponencial transformada')
text(3.5,3,'Yreg = 0.3431*e^(^0^.^6^8^5^3^*^x^)')
text(3.5,2,'r = 0.9733')
%polyfit(x,y,grado de regresion)
%corr2(x,y)
