clc, clear all,close all;
%Método de Newton Raphson
%Datos
f=inline('2*(x.^3)-11.7*x.^2.+17.7*x-5');
derF=inline('6*x.^2-23.4*x+17.7');
x_0=2;
e_std=0.1;
CS=5;
x_ante=x_0;

x=0:0.01:4;
plot(x,f(x),'-k') 
hold on
plot(x,0,'-r')
hold on
xlabel('eje de las abscisas');
ylabel('eje de las ordenadas');
title('gráfica de la función x');
legend('f(x)');

fprintf('\t\tMÉTODO DE NEWTON RAPHSON\n\n')
fprintf('\tx_0=%1.0f\n',x_0)
fprintf('\te_std=%4.2f%%\n',e_std)
fprintf('\tC.S.=%1.0f\n',CS)
fprintf('_______________________\n')
fprintf('iter\t x_i\t e_a\t\n')
fprintf('_______________________\n')
iter=1;
iter_max=50;
e_a=inf;
g_i(1)=0;
g_fi(1)=x_ante;
fprintf('%3.0f\t\t %4.4f\t %3.1f\n', [0 x_ante e_a])
while(e_a>e_std && iter<iter_max)
   x_actu=x_ante-(f(x_ante)/derF(x_ante));
   g_i(iter+1)=iter;
   g_fi(iter+1)=x_actu;
   e_a=abs((x_actu-x_ante)/x_actu)*100;
   g_ei(iter)=iter;
   g_ea(iter)=e_a;
   x_ante=x_actu;
   fprintf('%3.0f\t\t %4.4f\t %3.1f%%\n', [iter x_actu e_a])
   iter=iter+1;
end

fprintf('_______________________\n')
fprintf('La solución aproximada converge al valor %4.4f\nen %1.0f iteraciones con un error e_a=%4.1f%%\n',[x_actu,iter-1,e_a])


figure(2)
plot(g_i,g_fi,'*k')
hold on
plot(g_i,g_fi,'-k')
hold on
xlabel('eje de las abscisas');
ylabel('eje de las ordenadas');
title('gráfica de la solucion x');
legend('solucion','x_i');
figure(3)
plot(g_ei,g_ea,'*k')
hold on
plot(g_ei,g_ea,'-k')
hold on
xlabel('eje de las abscisas');
ylabel('eje de las ordenadas');
title('gráfica del error');
legend('error','e_i');
%f=inline('2.*(x.^3)-11.7.*x.^2.+17.7*x-5');
%derF=inline('6*x.^2-23.4*x+17.7');