clc, clear all, close all;
%rk4 metodo de runge kutta de grado 4
%datos
%f = inline('-2*x*y');
%f = inline('2*x*y+x');
%f = inline('y*x.^2-1.1*y');
%f = inline('(1+2*x)./y.^2');
%f = inline('(3*y)./x.^2');
f = inline ('(sin(x.^2)-8)./exp(2.*x.*y)');
x_0 = 1;
y_0 = 2;
h = 0.2;
x_f =  3;
%y_exacta = inline('exp(-3./x+1)');
%y_exacta = inline('(3*(3+x+x.^2)).^(1/3)');
%y_exacta = inline('exp(x.^3./3-1.1*x)');
%y_exacta = inline('exp(-x.^2+1/4)');
%y_exacta = inline('(exp(x.^2+log(3)-0.25)-1)/2');


fprintf('MÉTODO DE RUNGE KUTTA DE CUARTO GRADO RK-4\n')
fprintf('________________________________\n')
fprintf('Ecuación diferencial:\n')
f
fprintf('x_0 = %4.4f \ny_0 = %4.4f \nh = %4.4f \nx_f = %4.4f \n',[x_0 y_0 h x_f])
fprintf('________________________________\n')
fprintf('\tDatos:\n')
%fprintf('iter\t\tx_i \t\ty_i\t\t  E_a\n') 
fprintf('iter\t\tx_i \t\ty_i\t\t\n') 

fprintf('________________________________\n')

%algoritmo
x = x_0:h:x_f;
n = (x_f-x_0)/h;
y = zeros(1,n+1);
y(1,1) = y_0;

for i=1:1:n+1
    w(i) = y(i);
    k_1 = h*f(x(i),y(i));
    k_2 = h*f(x(i)+h/2,y(i)+k_1/2);
    k_3 = h*f(x(i)+h/2,y(i)+k_2/2);
    k_4 = h*f(x(i)+h,y(i)+k_3);
    y(i+1) = y(i) + 1/6*(k_1+2*k_2+2*k_3+k_4);
    iter = i-1;
    %e_t = abs((y_exacta(x(i))-y(i))/y_exacta(x(i)))*100;
    %fprintf('%4.0f \t %4.4f \t %4.4f \t %4.2f%% \n',[iter x(i) y(i) e_t])
        fprintf('%4.0f \t %4.4f \t %4.4f \n',[iter x(i) y(i)])

end

plot(x,w,'-b')
hold on
%plot(x,y_exacta(x),'-m')
xlabel('eje de las abcisas')
ylabel('eje de las ordenadas')
title('solución EDO')
legend('solución RK-4')