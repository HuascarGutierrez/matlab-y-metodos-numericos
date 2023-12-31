clc, clear all, close all;
%rk2 metodo de euler GAUSS
%datos
f = inline('-2*x*y');
x_0 = 0.5;
y_0 = 1;
h = 0.05;
x_f =  1.5;
y_exacta = inline('exp(-x.^2+1/4)');

fprintf('M�TODO DE EULER GAUSS RK-2\n')
fprintf('________________________________\n')
fprintf('Ecuaci�n diferencial:\n')
f
fprintf('x_0 = %4.4f \ny_0 = %4.4f \nh = %4.4f \nx_f = %4.4f \n',[x_0 y_0 h x_f])
fprintf('________________________________\n')
fprintf('\tDatos:\n')
fprintf('iter\t\tx_i \t\ty_i\t\t  E_a\n') 
fprintf('________________________________\n')

%algoritmo
x = x_0:h:x_f;
n = (x_f-x_0)/h;
y = zeros(1,n+1);
y(1,1) = y_0;

for i=1:1:n+1
    w(i) = y(i);
    k_1 = h*f(x(i),y(i));
    k_2 = h*f(x(i)+h,y(i)+k_1);
    y(i+1) = y(i) + 1/2*(k_1+k_2);
    iter = i-1;
    e_t = abs((y_exacta(x(i))-y(i))/y_exacta(x(i)))*100;
    fprintf('%4.0f \t %4.4f \t %4.4f \t %4.2f \n',[iter x(i) y(i) e_t])
end

plot(x,w,'-b')
hold on
plot(x,y_exacta(x),'-m')
xlabel('eje de las abcisas')
ylabel('eje de las ordenadas')
title('soluci�n EDO')
legend('soluci�n RK-2','soluci�n exacta')