clc, clear all, close all;
 %Metodo de Newton Raphson
f = inline('x.^2+exp(x)-3');
der_f = inline('2*x+exp(x)');
error = 0.01;

x = -3:0.01:3;

plot(x,f(x),'-b');
hold on 
plot(x,0,'-r');
hold on
xlabel('eje x');
ylabel('eje y');
title('Gráfico de la función');
legend('Función','y = 0');

x_ant = 1;
maximo = 100;
iter = 0;
e_a = inf;

fprintf('\tEjercicio 3 - 2do parcial\n')
fprintf('_____________________________________\n')
fprintf('Datos:\n')
fprintf('x_0 = %2.0f\n',x_ant)
fprintf('Error estándar =%1.2f%%\n',error)
fprintf('_____________________________________\n')
fprintf('iter   x_i   f(x_i)   der_f(x_i)   e_a\n')
fprintf('_____________________________________\n')

while iter<maximo && e_a>error
    fprintf('%1.0f    %1.4f  %1.4f      %1.4f    %1.2f%%\n',iter,x_ant,f(x_ant),der_f(x_ant),e_a)
    i(iter+1) = iter;
    g_i(iter+1) = x_ant;
    x_act = x_ant - f(x_ant)/der_f(x_ant);
    e_a = abs((x_act-x_ant)/x_act)*100;
    x_ant = x_act;
    iter = iter +1;
    
    j(iter) = iter;
    h_j(iter) = e_a;
end
fprintf('%1.0f    %1.4f  %1.4f      %1.4f    %1.2f%%\n',iter,x_ant,f(x_ant),der_f(x_ant),e_a)
fprintf('_____________________________________\n')
fprintf('El resultado es: %1.4f\nCon un error de: %1.2f%%\nEn la iteracion: %1.0f\n',x_act,e_a,iter)


i(iter+1) = iter;
g_i(iter+1) = x_ant;
    
figure(2)
plot(i,g_i,'-r');
hold on 
plot(i,g_i,'*r');
hold on
xlabel('eje x');
ylabel('eje y');
title('Gráfico de la solución');
legend('iteraciones','x_i');

figure(3)
plot(j,h_j,'-b');
hold on 
plot(j,h_j,'*b');
hold on
xlabel('eje x');
ylabel('eje y');
title('Gráfico del error');
legend('iteraciones','e_a');

