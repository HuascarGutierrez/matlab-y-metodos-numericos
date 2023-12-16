clc, clear all;
%método de la bisección
fprintf('\t\tMÉTODO DE LA BISECCIÓN\n\n')
x=-2:0.05:1;
f=inline('((exp(-2*x)-1)/(sin(x)-3))+4');

x_a=-2;%límite inferior
x_b=-1; %límite superior
e_std=0.001; %error estándar
iter_max=50; %nro de iteraciones máximas
%Valores de inicialización
e_a=100;
x_rante=inf;
iter=0;
fprintf('LOS DATOS SON:\n')
fprintf('El límite inferior es: x_a=%3.4f \n',x_a)
fprintf('El límite inferior es: x_a=%3.4f \n',x_b)
fprintf('Con un error estándar de: e_std=%3.3f%% \n',e_std)
if (f(x_a)*f(x_b)<0)
    fprintf('Existe al menos una raíz\n')
else
    fprint('No existe ninguna raíz en este intervalo\n')
    return
end
fprintf('_________________________________________\n')
fprintf('iter\t\t x_a\t\t x_b\t\t x_r\t\t e_a\t\n')
a=-2.05;
b=1;
while(a<10)
    
    x_i(b) = a;
    f_x(b) = f(a);
    a=a+0.05;
    b=b+1;
end

plot(x_i,f_x,'or')
hold on
plot(x_i,f_x,'-b')

while(e_a>e_std && iter<iter_max)
    iter=iter+1;
    x_ractu=(x_a+x_b)/2;
    e_a=abs((x_ractu-x_rante)/x_ractu)*100;
    fprintf('%3.0f\t\t %3.4f\t %3.4f\t %3.4f\t %3.3f%%\n', [iter x_a x_b x_ractu e_a])
    if f(x_a)*f(x_ractu)<0
        x_b=x_ractu;
    elseif f(x_a)*f(x_ractu)>0
        x_a=x_ractu;
    else
        x_a=x_ractu;
        x_b=x_ractu;
    end
    x_rante=x_ractu;
    g_i(iter) = iter;
    g_xr_actu(iter) = x_ractu;
    g_ea(iter) = e_a;
end
    iter=iter+1;
    x_ractu=(x_a+x_b)/2;
    e_a=abs((x_ractu-x_rante)/x_ractu)*100;
    fprintf('%3.0f\t\t %3.4f\t %3.4f\t %3.4f\t %3.3f%%\n', [iter x_a x_b x_ractu e_a])
    if f(x_a)*f(x_ractu)<0
        x_b=x_ractu;
    elseif f(x_a)*f(x_ractu)>0
        x_a=x_ractu;
    else
        x_a=x_ractu;
        x_b=x_ractu;
    end
    x_rante=x_ractu;
    g_i(iter) = iter;
    g_xr_actu(iter) = x_ractu;
    g_ea(iter) = e_a;
fprintf('_________________________________________\n')
figure(2)
plot(g_i,g_xr_actu,'*k')
hold on
plot(g_i,g_xr_actu,'-k')
figure(3)
plot(g_i,g_ea,'or')
hold on
plot(g_i,g_ea,'-b')
fprintf('la raíz calculada es:\nx_r=%4.4f\ncon un error de e_a=%4.3f %%\n',[x_ractu,e_a])
fprintf('en %.0f iteraciones\n',iter);
fprintf('\nCONCLUSION\n');
fprintf('La solución aproximada converge al valor %4.4f\nen %2.0f iteraciones con un error e_a=%4.3f%%\n',[x_ractu,iter,e_a])