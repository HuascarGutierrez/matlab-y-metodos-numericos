%{
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
%}

%{
clc, clear all, close all;
%f=inline('2*exp(-3*x)+sin(0.5*x)+1./(2*x+3)+2');
%f=inline('5./(2*x-3)+exp(-pi*x)+log(x.^(1/3))');
%f=inline('1-exp(-2*x)');
f=inline('1-x-4*x.^3+2*x.^5');
x=[2:0.01:8];
plot(x,f(x),'-m');
%metodo del trapecio
fprintf('\tMétodo del trapecio\n')
a=-1; %limite inferior
b=0.5182; %limite superior
n=50; %nro de segmentos
h=(b-a)/n;
I_exacta=1.7724;

fprintf('____________________________________________________________\n')
fprintf('El valor de a es:\ta=%3.0f\n',a)
fprintf('El valor de b es:\tb=%3.4f\n',b)
fprintf('El valor de n es:\tn=%3.0f\n',n)
fprintf('____________________________________________________________\n')


x=linspace(a,b,100);
plot(x,f(x),'-b');
hold on
area(x,f(x));
xlabel('eje de las abscisas');
ylabel('eje de las ordenadas');
title('gráfica de la función x');
legend('f(x)');

s=0;
s=s+f(a);
for i=1:1:n-1
    s=s+2*f(a+i*h);
end
s=s+f(b);
I_aprox=s*h/2;
fprintf('La integral aproximada es: \t\t\tI_aprox=%4.4f u^2\n',I_aprox)
e_t=abs((I_exacta-I_aprox)/I_exacta)*100;
fprintf('Con un error porcentual verdadero: \te_t=%4.2f%%\n',e_t)
%}

%{
clc, clear all, close all;
%para dos partes de una integral
%f=inline('2*exp(-3*x)+sin(0.5*x)+1./(2*x+3)+2');
%f=inline('5./(2*x-3)+exp(-pi*x)+log(x.^(1/3))');
%f=inline('1-exp(-2*x)');
%f=inline('exp(-x.^2)');
%f=inline('1-x-4*x.^3+2*x.^5');
f=inline('3*sin(x).*cos(2*x)');
%metodo del trapecio
fprintf('\tMétodo del trapecio\n')
a_1=0; %limite inferior
b_1=0.7852; %limite superior
n=500; %nro de segmentos

a_2=0.7852;
b_2=1;

h_1=(b_1-a_1)/n;
h_2=(b_2-a_2)/n;

fun = @(x) 3*sin(x).*cos(2*x);

I_exacta=integral(fun,a_1,b_1)+abs(integral(fun,a_2,b_2));

fprintf('____________________________________________________________\n')
fprintf('El valor de a es:\ta=%3.0f\n',a_1)
fprintf('El valor de b es:\tb=%3.0f\n',b_2)
fprintf('El valor de n es:\tn=%3.0f\n',n)
fprintf('El valor de la integral exacta es:\tn=%3.4f\n',I_exacta)
fprintf('____________________________________________________________\n')


x=linspace(a_1,b_2,100);
plot(x,f(x),'-b');
hold on
area(x,f(x));
xlabel('eje de las abscisas');
ylabel('eje de las ordenadas');
title('gráfica de la función x');
legend('f(x)');

s=0;
s=s+f(a_1);
for i=1:1:n-1
    s=s+2*f(a_1+i*h_1);
end
s=s+f(b_1);
I_aprox=s*h_1/2;

s=0;
s=s+abs(f(a_2));
for i=1:1:n-1
    s=s+abs(2*f(a_2+i*h_2));
end
s=s+abs(f(b_2));
I_aprox=I_aprox+s*h_2/2;

fprintf('La integral aproximada es: \t\t\tI_aprox=%4.4f u^2\n',I_aprox)
e_t=abs((I_exacta-I_aprox)/I_exacta)*100;
fprintf('Con un error porcentual verdadero: \te_t=%4.2f%%\n',e_t)
%}

%{
%METODO DE SIMPSON 1/3
clc, clear all;
fprintf('\n \t \t Metodo de Simpson 1/3 \n \n')
%Datos

%f=inline('2*exp(-3*x)+sin(0.5*x)+1./(2*x+3)+2');
f=inline('sin(x)./x');

%g=input('Inserte por favor la funcion\n g = ');
%f=inline(g);
a=0; %limite inferior
%a=input('Inserte por favor el valor del limite inferior\n a = ');
b=2; %limite superior
%b=input('Inserte por favor el valor del limite superior\n b = ');
n=10; %Numero de segmentos
%n=input('Inserte por favor el valor del numero de segmentos\n n = ');
I_exacta=3.21083;
fprintf('____________________________________________________________\n')
fprintf('El valor de a es:\ta=%3.0f\n',a)
fprintf('El valor de b es:\tb=%3.0f\n',b)
fprintf('El valor de n es:\tn=%3.0f\n',n)
x=linspace(-2,b,100);
plot(x,f(x),'-m');
hold on
area(x,f(x));
h=(b-a)/n;
xlabel('eje de las abscisas');
ylabel('eje de las ordenadas');
title('gráfica de la integral');
legend('f(x)','Área')
suma=1;
for i=1:2:n-1
    suma=suma+4*f(a+i*h);
end
for j=2:2:n-2
   suma=suma+2*f(a+j*h);
end
suma=suma+f(b);
I_aprox=suma*h*2/3;
%e_t=abs((I_aprox-I_exacta)/I_exacta)*100;
fprintf('____________________________________________________________\n')
fprintf('La integral aproximada es: \t\t\tI_aprox=%4.4f u^2\n\n',I_aprox)
fprintf('La integral exacta es: \t\t\t\tI_exacta=%4.4f u^2\n\n',I_exacta)
e_t=abs((I_exacta-I_aprox)/I_exacta)*100;
fprintf('Con un error porcentual verdadero: \te_t=%4.1f%%\n',e_t)
%}

%{
%METODO DE SIMPSON 3/8
clc, clear all;
fprintf('\n \t \t Metodo de Simpson 3/8 \n \n')
%Datos
%f=inline('2*exp(-3*x)+sin(0.5*x)+1./(2*x+3)+2');
f=inline('2-3./x-0.7*x.^2+3*x');
%g=input('Inserte por favor la funcion\n g = ');
%f=inline(g);
a=0.7702; %limite inferior
%a=input('Inserte por favor el valor del limite inferior\n a = ');
b=4.6996; %limite superior
%b=input('Inserte por favor el valor del limite superior\n b = ');
n=24; %Numero de segmentos
%n=input('Inserte por favor el valor del numero de segmentos\n n = ');
I_exacta=10.5600;
fprintf('____________________________________________________________\n')
fprintf('El valor de a es:\ta=%3.0f\n',a)
fprintf('El valor de b es:\tb=%3.0f\n',b)
fprintf('El valor de n es:\tn=%3.0f\n',n)
x=linspace(a,b,100);
plot(x,f(x),'-m');
hold on
area(x,f(x));
xlabel('eje de las abscisas');
ylabel('eje de las ordenadas');
title('gráfica de la integral');
legend('f(x)','Área');
h=(b-a)/n;
suma=f(a);
for i=1:3:n-2
    suma=suma+3*f(a+i*h);
end
for j=2:3:n-1
   suma=suma+3*f(a+j*h);
end
for k=3:3:n-3
   suma=suma+2*f(a+k*h);
end
suma=suma+f(b);
I_aprox=suma*h*3/8;
e_t=abs((I_aprox-I_exacta)/I_exacta)*100;
fprintf('____________________________________________________________\n')
fprintf('La integral aproximada es: \t\t\tI_aprox=%4.4f u^2\n\n',I_aprox)
fprintf('La integral exacta es: \t\t\t\tI_exacta=%4.4f u^2\n\n',I_exacta)
e_t=abs((I_exacta-I_aprox)/I_exacta)*100;
fprintf('Con un error porcentual verdadero: \te_t=%4.2f%%\n',e_t)
%}

%{
clc, clear all;
%DERIVADAS NUMERICAS CON 3 TT
%funcion = log(2/7*x).*exp(1/2*x.^2)
%derivada=diff(funcion,grado de derivacion)
%der_1_x0 = subs(derivada,1)

x_0=-2;
h=0.1;
der_1_exacta=-0.1353;
der_2_exacta=0;
der_3_exacta=0.1353;


fprintf('\t\tMETODO DE DERIVACION TT\n')
fprintf('Datos\n')
fprintf('x_i = %1.0f\n',x_0)
fprintf('h = %1.4f\n',h)
fprintf('der1_f_x = %1.4f\n',der_1_exacta)
%fprintf('der2_f_x = %1.4f\n',der_2_exacta)
fprintf('____________________________________________________\n')


%f=inline('log(2/7*x).*exp(1/2*x.^2)');
%f=inline('X.^3+4*X-15');
%f=inline('x.^2+cos(x)');
%f=inline('tan(x./3)');
%f=inline('sin(0.5*x.^(1/2))./x');
f=inline('x.*exp(x)');

%primera derivada
der_1_f=(-f(x_0+2*h)+8*f(x_0+h)-8*f(x_0-h)+f(x_0-2*h))/(12*h);
e_t=abs((der_1_exacta-der_1_f)/der_1_exacta)*100;
fprintf('La primera derivada es: %10.4f\n',der_1_f)
fprintf('Con un error de: %17.2f%%\n\n',e_t)

%segunad derivada
der_2_f=(-f(x_0+2*h)+16*f(x_0+h)-30*f(x_0)+16*f(x_0-h)-f(x_0-2*h))/(12*h^2);
e_t=abs((der_2_exacta-der_2_f)/der_2_exacta)*100;
fprintf('La segunda derivada es: %10.4f\n',der_2_f)
fprintf('Con un error de: %17.2f%%\n\n',0)

%tercera derivada
%der_3_f=(f(x_0+2*h)-2*f(x_0+h)+2*f(x_0-h)-f(x_0-2*h))/(2*h^3);
der_3_f=(-f(x_0+3*h)+8*f(x_0+2*h)-13*f(x_0+h)+13*f(x_0-h)-8*f(x_0-2*h)+f(x_0-3*h))/(8*h^3);
e_t=abs((der_3_exacta-der_3_f)/der_3_exacta)*100;
fprintf('La segunda derivada es: %10.4f\n',der_3_f)
fprintf('Con un error de: %17.2f%%\n\n',e_t)
%}

%{
clc, clear all;
fprintf('\t\tMETODO DE LA INVERSA\n')
fprintf('Los datos son:\n')
A = [-3 5 2;-1 -2 3;9 -15 -6]
B = [7;-4;0]
%C = [5 4;1 2]
%D = [3 2;-2 -5]
%X = C+D %suma de matrices
%X = C*D %multiplicacion de matrices 
%trace(A)
%det(A)
%inv(A)
%poly(A)
%eig(A)
%RESULTADO = inv(A)*B
det_A = det(A)
if det_A==0
    fprintf('El sistema tiene soluciones infinitas o no tiene solucion')
else
    fprintf('La solucion es: \n')
    RESULTADO = inv(A)*B;
    disp(RESULTADO) %disp 4 decimales
end
%}

%{
clc, clear all;
%MÉTODO DE GAUSS JORDAN
fprintf('\t\tMETODO DE GAUSS JORDAN\n')
fprintf('________________________________________\n')
fprintf('Los datos son:\n')
%DATOS

%A = [1 2 -1 3;2 0 2 -1;-1 1 1 -1;3 3 -1 2];
%B = [-8;13;8;-1];
A = [-3 5 2;-1 -2 3;9 -15 -6]
B = [7;4;0]

%ALGORITMO

AU = [A B]
n = size(AU,1);
fprintf('________________________________________\n')
if det(A) ~= 0
    for i=1:n
    AU(i,:) = (1/AU(i,i))*AU(i,:);
    for j=1:n
        if j~=i
            AU(j,:) = -AU(j,i)*AU(i,:)+AU(j,:);
        end
    end
    end
    disp(AU(:,end))
else
    fprintf('El sistema presente varias soluciones o no tiene solucion')
end
%}

%{
clc, clear all;
%Metodo jacobi
fprintf('Método de Jacobi para sistemas de ecuaciones\n')
fprintf('____________________________________________\n')
fprintf('Datos\n')
A = [8 -4 -1 2;2 6 3 1;1 1 4 1;-2 2 1 5]
B = [9;7;0;9]
iter_max = 100;
errmax = 0.001;
n=size(A,1);
X = zeros(1,n);
err1 = inf;
err = 0;
iter = 0;
fprintf('e_std = %1.3f\n',errmax)
fprintf('____________________________________________\n')
fprintf('iter    x_1      x_2      x_3      x_4     e_a\n')
fprintf('____________________________________________\n')
    fprintf('%2.0f %8.4f %8.4f %8.4f %8.4f %8.3f%%\n',iter,X(1),X(2),X(3),X(4),err1)
while  err1>errmax && iter<iter_max
   
    X_old = X;
    for i = 1 : n 
        sum = B(i);
        for j=1 : n
            if(j~=i)
                sum = sum - A(i,j)*X_old(j);
            end
        end
        X(i) = sum / A(i,i);
        err1 = max(abs((X-X_old)./X)*100);
    end
    iter = iter +1;
    fprintf('%2.0f %8.4f %8.4f %8.4f %8.4f %8.3f%%\n',iter,X(1),X(2),X(3),X(4),err1)
    
end
fprintf('____________________________________________\n')
%}

%{
clc,clear all;
fprintf('\n\t\t Método Gauss Seidel\n');
%Datos
fprintf('Datos:\n');
A=[8 -4 -1 2;2 6 3 1; 1 1 4 1; -2 2 1 5]
B=[9;7;0;9]
iter_max=100;
e_max=0.0001;
fprintf('Error estandar: \tE_a = %.4f\n\n\n',e_max);
%inicializando
n=size(A,1);
x_new=zeros(1,n);
%x_new = [27 5 25 4]
iter = 0;
E_a = inf;%e absoluto
%Algoritmo
fprintf('La Solución es: \n')

while iter<iter_max && E_a>e_max
    x_old = x_new;
    for i=1:n
        suma = 0;
        %nuevos
        for j=1:i-1
            suma=A(i,j)*x_new(j)+suma;
        end
        %antiguos
        for j=i+1:n
            suma=A(i,j)*x_old(j)+suma;
        end
        x_new(i)= (B(i)-suma)/A(i,i);
    end
    iter = iter+1;
    E_a=max(abs(x_new-x_old));
    y(iter,:)=[iter x_new];
end

if iter<iter_max && E_a>e_max
    fprintf('\nEl Método converge en %d iteraciones.\n',iter);
else
    fprintf('\nEl Método no converge en %d iteraciones.\n',iter);
end

display(y);
%}

%{
clc, clear all,close all;
%Método de Newton Raphson


f=inline('x.^2+exp(x)-3');
der=inline('2*x+exp(x)');
x_0=1;
e_std=0.01;
x_ante=x_0;

x=0:0.01:4;
plot(x,f(x),'-r') 
hold on
plot(x,0,'-b')
hold on
xlabel('abscisas');
ylabel('ordenadas');
title('gráfica de la solucion x');
fprintf('\t\tMÉTODO DE NEWTON RAPHSON\n\n')
fprintf('\tx_0=%1.0f\n',x_0)
fprintf('\te_std=%4.2f%%\n',e_std)
fprintf('_______________________\n')
fprintf('iter\t x_i\t e_a\t\n')
fprintf('_______________________\n')
iter=1;
maximo=50;
e_a=inf;
g_i(1)=0;
g_fi(1)=x_ante;
fprintf('%3.0f\t\t %4.4f\t %3.1f\n', [0 x_ante e_a])
while(e_a>e_std && iter<maximo)
   x_actu=x_ante-(f(x_ante)/der(x_ante));
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
fprintf('La solución es %4.4f\nen %1.0f iteraciones con un error e_a=%4.1f%%\n',[x_actu,iter-1,e_a])


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
%}