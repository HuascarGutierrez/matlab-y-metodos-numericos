clc, clear all, close all;
%rk1 metodo de euler
%datos
%f = inline('-2*x*y');
%f = inline('2*x*y+x');
%f = inline('y*x.^2-1.1*y');
f = inline('(1+2*x)./y.^2');
x_0 = 2;
y_0 = 3;
h = 0.05;
x_f =  3;
y_exacta = inline('(3*(3+x+x.^2)).^(1/3)');

fprintf('MÉTODO DE EULER RK-1\n')
fprintf('________________________________\n')
fprintf('Ecuación diferencial:\n')
f
fprintf('x_0 = %4.4f \ny_0 = %4.4f \nh = %4.4f \nx_f = %4.4f \n',[x_0 y_0 h x_f])
fprintf('________________________________\n')
fprintf('\tDatos:\n')
fprintf('iter\t\tx_i \t\ty_i\t\t  E_t\n') 
fprintf('________________________________\n')

%algoritmo
x = x_0:h:x_f;
n = (x_f-x_0)/h;
y = zeros(1,n+1);
y(1,1) = y_0;

for i=1:1:n+1
    w(i) = y(i);
    k_1 = h*f(x(i),y(i));
    y(i+1) = y(i) + k_1;
    iter = i-1;
    e_t = abs((y_exacta(x(i))-y(i))/y_exacta(x(i)))*100;
    fprintf('%4.0f \t %4.4f \t %4.4f \t %4.2f%% \n',[iter x(i) y(i) e_t])
end

plot(x,w,'-b')
hold on
plot(x,y_exacta(x),'-m')
xlabel('eje de las abcisas')
ylabel('eje de las ordenadas')
title('solución EDO')
legend('solución RK-1','solución exacta')